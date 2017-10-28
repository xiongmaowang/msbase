/*
 * 调用该插件时，需引入Jquery.js文件，该Jquery>=1.5，同时需要引入jquery.ztree.all.min.js文件后才可使用
 * 该js所封装的方法有：
 * 
 * date:	2016/12/13
 * version:	2.5
 * author:	hanyh
 */
function msTreeOperatePlug(){
	var msTree={
		data_ms_tree_treeId:"",
		data_ms_tree_filter:filterOperateData,
		data_ms_tree_icon:true,
		data_ms_tree_url:"",
		data_ms_tree_rightClick:treeOperateRightClick,
		data_ms_tree_click:treeOperateClick
	};
	return msTree;
}
function msTreeOperateCommonInvok(){
	var tree = msTreeOperatePlug();
	return tree;
}

function msTreeOperate(holder,url){
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
	var tree = msTreeOperateCommonInvok();
	tree.data_ms_tree_treeId = treeId != null ? treeId : "";
	tree.data_ms_tree_url = treeUrl != null ? treeUrl : "";
	if($("#"+treeId).length!=1){
		alert("传入参数名错误，请检查后重试....");
		return;
	}
	$.fn.zTree.init($("#"+treeId),asyncOperateParameters(tree));
	//将右键菜单添加到页面
	if($("body").find("#rOperateMenu").length==0){
		var rightMenu = '<div class="menu" id="rOperateMenu" style="display: none; background-color: white; ">'
			+'<ul class="list-group">'
				+'<li class="list-group-item" id="operate_add">增加</li>'
				+'<li class="list-group-item" id="operate_edit">编辑</li>'
				+'<li class="list-group-item" id="operate_del">删除</li>'
			+'</ul>'
		+'</div>';
		var script = '<script type="text/javascript">'
						+'$("#operate_add").click(newOperateMsTreeNode);\n'
						+'$("#operate_edit").click(editOperateMsTreeNode);\n'
						+'$("#operate_del").click(delOperateMsTreeNode);\n'
					+'</script>';
		$("body").append(rightMenu);
		$("body").append(script);
	}
}
//初始化tree插件
function asyncOperateParameters(params){
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
			view: {
				dblClickExpand: true,//关闭双击父节点展开子节点
				showIcon: tree.data_ms_tree_icon
			},
			callback: {
				onRightClick: tree.data_ms_tree_rightClick,
				onClick: tree.data_ms_tree_click
			}
		};
	return setting;
}

//过滤回调函数
function filterOperateData(treeId, parentNode, resData){
	if(!resData){
		return null;
	}
	for(var i=0;i<resData.length;i++){
		if(resData[i].parent == 0){
			resData[i].isParent = true;
		}
	}
	return resData;
}
//点击加载页面
function treeOperateClick(event, treeId, treeNode){
	$("#newPageOperateHolder").load(treeNode.loadMsTreeNodeUrl+"?id="+treeNode.id,function(){
		
		var id = null;
		var name = null;
		var pId = null;
		var pName = null;
		try{
			//var node = treeNode;
			//var url = node.editMsTreeNodeUrl;
			//var data = {"treeId":treeId,"id":node.id};
			//ajaxSend(url,data,editOperateMsTreeNodeSuccess);
			
			id = treeNode.id;
			name = treeNode.name;
			var parent = treeNode.getParentNode();
			pId = parent.id;
			pName = parent.name;
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-id]").val(id);
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-name]").val(name);
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-pid]").val(pId);
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-pname]").val(pName);
		}catch (e) {
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-id]").val(id);
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-name]").val(name);
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-pid]").val(pId);
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-pname]").val(pName);
		}
	});
}
//右键点击事件
function treeOperateRightClick(event, treeId, treeNode){
	selecOperateTreeNode(treeId,treeNode);
	$("#rOperateMenu").data("treeId",treeId);
	$("#rOperateMenu").data("node",treeNode);
	$("#rOperateMenu").data("pNode",treeNode.getParentNode());
	var x = event.clientX;
	var y = event.clientY;
	showOperateRMenu(x,y);
}
//点击右键显示右键菜单
function showOperateRMenu(x,y) {
	$("#rOperateMenu").css({position:"absolute",left:x+"px", top:y + "px"}).slideDown("fast");
}
//封装ajax发送异步请求
function ajaxSend(url,data,suFn){
	$.ajax({
		 url:url,
		 type:"post",
		 data:data,
		 dataType:"json",
		 success:suFn,
		 error:function(data){
		 alert("系统或网络异常,请稍后重试.....");
		 }
	 });
}
function selecOperateTreeNode(treeId,treeNode){
	var ztree = $.fn.zTree.getZTreeObj(treeId);
	ztree.cancelSelectedNode();
	ztree.selectNode(treeNode);
}
//新增节点
function newOperateMsTreeNode(){
	var ul = $(this).parent();
	$("#rOperateMenu").hide();
	var treeId = $("#rOperateMenu").data("treeId");
	var node = $("#rOperateMenu").data("node");
	$("#newPageOperateHolder").load(node.loadMsTreeNodeUrl+"?id="+node.id+"&type=add",function(){
		//$("input").val("");
		$("#newPageOperateHolder").find("input[data-ms-tree-operate-pid]").val(node.id);
		$("#newPageOperateHolder").find("input[data-ms-tree-operate-pname]").val(node.name);
	});	
}
//编辑节点
function editOperateMsTreeNode(){
	var ul = $(this).parent();
	$("#rOperateMenu").hide();
	var node = $("#rOperateMenu").data("node");
	$("#newPageOperateHolder").load(node.loadMsTreeNodeUrl+"?id="+node.id,function(){
		var node = $("#rOperateMenu").data("node");
		var url = node.editMsTreeNodeUrl;
		var treeId = $("#rOperateMenu").data("treeId");
		var data = {"treeId":treeId,"id":node.id};
		//ajaxSend(url,data,editOperateMsTreeNodeSuccess);
		//$("input").val("");
		var editNode = $("#rOperateMenu").data("node");
		var editPnode = $("#rOperateMenu").data("pNode");
		$("#newPageOperateHolder").find("input[data-ms-tree-operate-id]").val(editNode.id);
		$("#newPageOperateHolder").find("input[data-ms-tree-operate-name]").val(editNode.name);
		try{
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-pid]").val(editNode.pId);
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-pname]").val(editPnode.name);
		}catch (e) {
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-pid]").val("");
			$("#newPageOperateHolder").find("input[data-ms-tree-operate-pname]").val("");
		}
	});
}
//编辑成功回调函数
function editOperateMsTreeNodeSuccess(data){
	if(data.result==0){
		$("#abc").val(JSON.stringify(data));
		fuzhi();
		//$("#newPageOperateHolder").append(JSON.stringify(data));
	}else if(data.result==1){
		alert("获取编辑数据失败,请检查后重试!");
		return;
	}
}
//删除节点
function delOperateMsTreeNode(){
	var ul = $(this).parent();
	$("#rOperateMenu").hide();
	var treeId = $("#rOperateMenu").data("treeId");
	var node = $("#rOperateMenu").data("node");
	var nodeId = node.id;
	var url = node.delMsTreeNodeUrl;
	var data = {"treeId":treeId,"id":nodeId};
	ajaxSend(url,data,delOperateMsTreeNodeSuccess);
}
//删除成功回调函数
function delOperateMsTreeNodeSuccess(data){
	if(data.result == 0){
		var treeObj = $.fn.zTree.getZTreeObj(data.treeId);
		var nodes = treeObj.getSelectedNodes();
		var prent;
		if (nodes && nodes.length>0) {
			prent = nodes[0].getParentNode();
			treeObj.removeChildNodes(nodes[0]);
		}
		for (var i=0; i<nodes.length; i++) {
			treeObj.removeNode(nodes[i]);
		}
		treeObj.reAsyncChildNodes(prent, "refresh");
		$("#newPageOperateHolder").empty();
		ms.msg("删除节点成功!",1,1000);//成功  1   失败 2
		return;
	}
	if(data.result == 1){
		ms.msg("删除节点失败!",2,1000);//成功  1   失败 2
		return;
	}
}
function hideOperateMsTree(e,treeId){
	var e = e || window.event; //浏览器兼容性
    var elem = e.target || e.srcElement;
    while (elem) {
    	if (elem.id && elem.id=="rOperateMenu" || elem.id && elem.id==treeId) {
	    	return;
	    }
	    	elem = elem.parentNode;
    } //循环判断至跟节点，防止点击的是div子元素
    $('#rOperateMenu').css('display','none');
}
//该方法默认异步加载完毕后展开父节点
function msTreeOperateUpdateNode(treeId,isSilent){
	if(arguments.length==0){
		alert("未传入必要参数，不能更新"+parentNode.name+"下的子节点，请检查参数后重试.....");
		return;
	}
	if(arguments.length ==1 && typeof arguments[0] == "string" && $("#"+treeId).length==1){
		var treeObj = $.fn.zTree.getZTreeObj(treeId);
		treeObj.reAsyncChildNodes(null, "refresh",true);
		return;
	}
	var id = null;
	var flag = true;
	for(var i=0;i<arguments.length;i++){
		if(typeof arguments[i] == "string" && $("#"+treeId).length==1){
			id = arguments[i];
		}else if(typeof arguments[i] == "boolean"){
			flag = arguments;
		}
	}
	if(id != null){
		var treeObj = $.fn.zTree.getZTreeObj(treeId);
		var nodes = treeObj.getSelectedNodes();
		if (nodes.length>0) {
			treeObj.reAsyncChildNodes(nodes[0], "refresh",flag);
		}
	}else{
		alert("未指定需要更新的实例，请检查参数后重试...");
		return;
	}
}
//子节点下增加节点
function msTreeOperateNodeAdd(treeId){
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var nodes = treeObj.getSelectedNodes();
	if (nodes.length>0) {
		nodes[0].isParent = true;
		treeObj.reAsyncChildNodes(nodes[0], "refresh");
	}
}
//父节点下增加节点
function msTreeOperateParentAdd(treeId){
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var nodes = treeObj.getSelectedNodes();
	if (nodes.length>0) {
		treeObj.reAsyncChildNodes(nodes[0], "refresh");
	}
}