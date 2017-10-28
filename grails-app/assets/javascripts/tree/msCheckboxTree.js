/*
 * 调用该插件时，需引入Jquery.js文件，该Jquery>=1.5，同时需要引入jquery.ztree.all.min.js文件后才可使用
 * 该js所封装的方法有：
 * 
 * date:	2016/12/13
 * version:	2.5
 * author:	hanyh
 */
function msTreeCheckboxPlug(){
	var msTree={
		data_ms_tree_treeId:"",
		data_ms_tree_checkbox:true,
		data_ms_tree_filter:filterCheckboxData,
		data_ms_tree_icon:true,
		data_ms_tree_url:""
	};
	return msTree;
}
function msTreeCheckboxCommonInvok(){
	var tree = msTreeCheckboxPlug();
	return tree;
}
function msTreeCheckbox(holder,url){
	if(arguments.length==0){
		alert("未传入必要参数，不能完成tree初始化，请传入必要参数后重试.....");
		return;
	}
	if(arguments.length==1){
		alert("初始化树失败，未匹配到所需参数.....");
		return;
	}
	var treeId = null;
	var treeUrl = null;
	for(var i=0;i<arguments.length;i++){
		if(typeof arguments[i]=="string" && /^[a-zA-Z0-9]*$/.test(arguments[i])){
			treeId = arguments[i];
		}else if(typeof arguments[i]=="string" && arguments[i].indexOf("/") != -1){
			treeUrl = arguments[i];
		}
	}
	var tree = msTreeCheckboxCommonInvok();
	tree.data_ms_tree_treeId = treeId != null ? treeId : "";
	tree.data_ms_tree_url = treeUrl != null ? treeUrl : "";
	if($("#"+treeId).length!=1){
		alert("初始化复选框参数错误，请检查后重试....");
		return;
	}
	$.fn.zTree.init($("#"+treeId),asyncCheckboxParameters(tree));
}
//初始化tree插件
function asyncCheckboxParameters(params){
	var tree = params;
	var setting = {
			async: {
				enable: true,//开启异步加载
				dataType: "json",//返回数据为json格式
				url:tree.data_ms_tree_url,//向服务器获取数据的url地址(异步请求地址)
				autoParam:["id","name"],//自动提交节点id、name
				dataFilter: tree.data_ms_tree_filter,//数据过滤，如加载时勾选某些节点、展开某些节点等操作
				type: "post"//提交方式
			},
			check:{
				enable: tree.data_ms_tree_checkbox,
				chkStyle: "checkbox",
				chkboxType: { "Y": "s", "N": "s" }
			},
			view: {
				dblClickExpand: true,//双击父节点展开子节点
				showIcon: tree.data_ms_tree_icon
			}
		};
	return setting;
}
//过滤回调函数
function filterCheckboxData(treeId, parentNode, resData){
	if(!resData){
		return null;
	}
	for(var i=0;i<resData.length;i++){
		if(resData[i].chked == 0){
			resData[i].checked = true;
		}
	}
	for(var i=0;i<resData.length;i++){
		if(resData[i].parent == 0){
			resData[i].isParent = true;
		}
	}
	return resData;
}
//获取被勾选的节点名称及值
function getMsTreeCheck(treeId){
	if(arguments.length==0){
		alert("获取被勾选节点参数不合法，请检查后重试...");
		return;
	}
	if(arguments.length!=1){
		alert("获取被勾选节点参数不合法，请检查后重试...");
		return;
	}
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var nodes = treeObj.getCheckedNodes(true);
	if($(nodes).length==0){
		alert("当前没有几点被勾选");
		return;
	}
	var node = $(nodes);
	var nodeJosn = "{";
	for(var i=0;i<node.length;i++){
		nodeJosn += '"id'+i+'":"'+node[i].id+'",';
		nodeJosn += '"name'+i+'":"'+node[i].name+'",';
		nodeJosn += '"pId'+i+'":"'+node[i].pId+'",';
	}
	nodeJosn += '"length":"'+node.length+'"';
	nodeJosn += "}";
	return nodeJosn;
}
//获取未勾选的节点名称及值
function getMsTreeNoCheck(treeId){
	if(arguments.length==0){
		alert("获取未勾选节点参数不合法，请检查后重试...");
		return;
	}
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var nodes = treeObj.getCheckedNodes(false);
	var node = $(nodes);
	var nodeJosn = "{";
	for(var i=0;i<node.length;i++){
		nodeJosn += '"id'+i+'":"'+node[i].id+'",';
		nodeJosn += '"name'+i+'":"'+node[i].name+'",';
		nodeJosn += '"pId'+i+'":"'+node[i].pId+'",';
	}
	nodeJosn += '"length":"'+node.length+'"';
	nodeJosn += "}";
	return nodeJosn;
}