/*
 * 调用该插件时，需引入Jquery.js文件，该Jquery>=1.5，同时需要引入jquery.ztree.all.min.js文件后才可使用
 * 该js所封装的方法有：
 * 
 * date:	2016/12/13
 * version:	2.5
 * author:	hanyh
 */
function msTreeInputPlug(){
	var msTree={
		data_ms_tree_treeId:"",
		data_ms_tree_filter:filterInputData,
		data_ms_tree_icon:true,
		data_ms_tree_url:"",
		data_ms_tree_dBClick:treeOnDblClick,
	};
	return msTree;
}
function msTreeInputCommonInvok(){
	var tree = msTreeInputPlug();
	return tree;
}

function msTreeInput(holder,url){
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
	var tree = msTreeInputCommonInvok();
	tree.data_ms_tree_treeId = treeId != null ? treeId : "";
	tree.data_ms_tree_url = treeUrl != null ? treeUrl : "";
	if($("input[data-ms-tree="+treeId+"]").length==1){
		var div = '<div style="display: none; border: 1px #000 solid; background: #fff;"><ul id="'+treeId+'" class="ztree"></ul></div>';
		$("body").append(div);
	}else{
		alert("传入参数名错误，请检查后重试....");
		return;
	}
	$.fn.zTree.init($("#"+treeId),asyncInputParameters(tree));
	if($("script[title='input']").length==0){
		var script = '<script title="input" type="text/javascript">'
						+'$("input[data-ms-tree]").click(msTreeInputClick);\n'
						+'$(document).mousedown(hideInputMsTree);'
					+'</script>';
		$("body").append(script);
	}
}
//为input实例绑定点击事件
function msTreeInputClick(){
	var inputobj = $(this);
	var obj = eachMsTreeInputAttr(inputobj);
	var resultTreeId = obj.treeId;
	showInputTree(resultTreeId,inputobj);
}
//初始化tree插件
function asyncInputParameters(params){
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
				dblClickExpand: false,//关闭双击父节点展开子节点
				showIcon: tree.data_ms_tree_icon
			},
			callback: {
				onDblClick: tree.data_ms_tree_dBClick
			}
		};
	return setting;
}
//遍历input对象所有属性
function eachMsTreeInputAttr(obj){
	if(arguments.length==0){
		return;
	}
	var attrObj = obj.get(0).attributes;
	var attrName = null;
	var attrValue = null;
	for(var i=0;i<attrObj.length;i++){
		var name = attrObj[i].nodeName.toString();
		if(name.indexOf("data-ms-tree") != -1){
			attrName = name;
			attrValue = attrObj[i].nodeValue.toString();
		}
	}
	if(attrName == null){
		alert("传入参数错误，或传入参数自定义属性错误。请检查后重试....");
		return;
	}else if(attrValue == ""){
		alert("自定义属性值不能为空，请检查后重试....");
		return;
	}else{
		return {"treeId":attrValue};
	}
}
//过滤回调函数
function filterInputData(treeId, parentNode, resData){
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
//点击input输入框显示树菜单
function showInputTree(tree,seat) {
	
	if($("#"+tree).is(':hidden')){
		var cityOffset = $(seat).offset();
		var cityObj = $(seat);
		//$("#"+tree).parent().width($(seat).width());
		$("#"+tree).parent().css({position:"absolute",left:cityOffset.left+"px", top:cityOffset.top + cityObj.outerHeight() +"px"}).slideDown("fast");
	}else{
		$("#"+tree).parent().hide();
		updateInputMsTree(tree);
	}
}
//更新节点
function updateInputMsTree(obj,out){
	var tree_Obj = $("#"+obj);
	if(tree_Obj.length==0){//是否有传入参数
		return;
	}
	if(tree_Obj.length==1 && typeof obj=="string"){//传入一个参数
		var treeObj = $.fn.zTree.getZTreeObj(obj);
		treeObj.reAsyncChildNodes(null, "refresh",true);
		return;
	}
	if(typeof obj=="string" && typeof out=="string"){
		alert("传入参数类型不合法...");
		return;
	}else if(typeof obj=="boolean" && typeof out=="boolean"){
		alert("传入参数类型不合法...");
		return;
	}
	var tree = null;
	var treeOut = null;
	for(var i=0;i<arguments.length;i++){
		if(typeof arguments[i]=="string"){
			tree = arguments[i];
		}else if(typeof arguments[i]=="boolean"){
			treeOut = arguments[i];
		}else{
			return;
		}
	}
	var treeObj = $.fn.zTree.getZTreeObj(tree);
	treeObj.reAsyncChildNodes(null, "refresh",treeOut);
}
//双击节点事件
function treeOnDblClick(event, treeId, treeNode){
	try{
		$("input[data-ms-tree="+treeId+"]").val(treeNode.name);
		$("body").append(input);
		var hide = $("#data-ms-tree-"+treeId);
		if(hide.length==0){
			var input = '<input type="hidden" id="data-ms-tree-'+treeId+'" value="'+treeNode.id+'"/>';
			$("body").append(input);
		}else{
			$(hide).val(treeNode.id);
		}
		$("#"+treeId).parent().hide();
		updateInputMsTree(treeId);
	}catch (e) {
	}
}
function getInputCode(treeId){
	if(arguments.length==0){
		alert("请传入实例容器参数名称..");
		return;
	}
	if(typeof treeId != "string"){
		alert("传入参数类型错误!");
		return;
	}
	var value = $("input[data-ms-tree='"+treeId+"']").val();
	if(value == "" || value == null){
		alert("输入框中的值为空!");
		return;
	}
	var id = $("#data-ms-tree-"+treeId).val();
	return id;
}

function hideInputMsTree(e){
	var e = e || window.event; //浏览器兼容性
    var elem = e.target || e.srcElement;
    var inputs = $("input[data-ms-tree]");
    var inputId = new Array();
    var holder = new Array();
    for(var i=0;i<inputs.length;i++){
    	inputId[i] = $(inputs[i]).attr("id");
    	holder[i] = $(inputs[i]).attr("data-ms-tree");
    }
    var index;
    while (elem) {
    	for(var i=0;i<holder.length;i++){
    		if (elem.id && elem.id==inputId[i] || elem.id && elem.id==holder[i]) {
    			index = i;
    	    	break;
    	    }
    	}
	    elem = elem.parentNode;
    }//循环判断至跟节点，防止点击的是div子元素
    if(index==undefined){
    	for(var i=0;i<holder.length;i++){
    		if(!$("#"+holder[i]).is(':hidden')){
    			$("#"+holder[i]).parent().hide();
        		var treeObj = $.fn.zTree.getZTreeObj(holder[i]);
        		treeObj.reAsyncChildNodes(null, "refresh",true);
    		}
    	}
    }else if(index >= 0){
    	for(var i=0;i<holder.length;i++){
    		if(i != index && !$("#"+holder[i]).is(':hidden')){
    			$("#"+holder[i]).parent().hide();
    			var treeObj = $.fn.zTree.getZTreeObj(holder[i]);
        		treeObj.reAsyncChildNodes(null, "refresh",true);
    		}
    	}
    }
}