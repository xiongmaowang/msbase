//=require jquery.ztree.all.min.js
/*
 *
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
        data_ms_tree_other:[]
    };
    return msTree;
}
function msTreeInputCommonInvok(){
    var tree = msTreeInputPlug();
    return tree;
}

function msTreeInput(holder,url,otherParamObj){
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
    var other = null;
    for(var i=0;i<arguments.length;i++){
        if(typeof arguments[i]=="string" && /^[a-zA-Z0-9]*$/.test(arguments[i])){
            treeId = arguments[i];
        }else if(typeof arguments[i]=="string" && arguments[i].indexOf("/") != -1){
            treeUrl = arguments[i];
        }else if(typeof arguments[i]=="object"){
        	other = arguments[i];
        }
    }
    var tree = msTreeInputCommonInvok();
    tree.data_ms_tree_treeId = treeId != null ? treeId : "";
    tree.data_ms_tree_url = treeUrl != null ? treeUrl : "";
    tree.data_ms_tree_other = other != null ? other : [];
    if($("input[data-ms-tree="+treeId+"]").length==1){
        var div = '<div style="display: none; background:#fff; border:1px solid #ccc;"><ul id="'+treeId+'" class="ztree"></ul></div>';
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
            otherParam: tree.data_ms_tree_other,
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
    if($("#"+tree).parent().is(':hidden')){
        var cityOffset = $(seat).offset();
        var cityObj = $(seat);
        var attrClass;
        try{
        	attrClass = $(seat).attr("class").split(" ");
        }catch (e) {
        	$("#"+tree).parent().css("width",$(seat).width()+"px");
            $("#"+tree).parent().css({position:"absolute",left:cityOffset.left+"px", top:cityOffset.top + cityObj.outerHeight() +"px"}).slideDown("fast");
            return;
		}
        if(attrClass.length == 0){
        	$("#"+tree).parent().css("width",$(seat).width()+"px");
            $("#"+tree).parent().css({position:"absolute",left:cityOffset.left+"px", top:cityOffset.top + cityObj.outerHeight() +"px"}).slideDown("fast");
            return;
        }
        if(attrClass.length == 1 && attrClass[0].indexOf("form-control") != -1){
        	$("#"+tree).parent().css("width",$(seat).parent().width()+"px");
            $("#"+tree).parent().css({position:"absolute",left:cityOffset.left+"px", top:cityOffset.top + cityObj.outerHeight() +"px"}).slideDown("fast");
            return;
        }
        var bootClass = true;
        for(var i=0;i<attrClass.length;i++){
        	if(attrClass[i].indexOf("form-control") != -1){
        		$("#"+tree).parent().css("width",$(seat).parent().width()+"px");
                $("#"+tree).parent().css({position:"absolute",left:cityOffset.left+"px", top:cityOffset.top + cityObj.outerHeight() +"px"}).slideDown("fast");
                return;
        	}
        }
        if(bootClass){
        	$("#"+tree).parent().css("width",$(seat).width()+"px");
            $("#"+tree).parent().css({position:"absolute",left:cityOffset.left+"px", top:cityOffset.top + cityObj.outerHeight() +"px"}).slideDown("fast");
        }
    }else{
    	$("#"+tree).parent().hide();
    	try{
    		var treeObj = $.fn.zTree.getZTreeObj(holder[i]);
            var nodes = treeObj.getNodes();
            var node = nodes[0].chked;
            if(node==undefined){
            	updateInputMsTree(tree);
            }
    	}catch (e) {
		}
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
        $("input[data-ms-tree="+treeId+"Id]").val(treeNode.id);
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
            if(!$("#"+holder[i]).parent().is(':hidden')){
            	try{
            		var treeObj = $.fn.zTree.getZTreeObj(holder[i]);
                    var nodes = treeObj.getNodes();
                    var node = nodes[0].chked;
                    $("#"+holder[i]).parent().hide();
                    if(node==undefined){
                    	treeObj.reAsyncChildNodes(null, "refresh",true);
                    }
            	}catch (e) {
				}
            }
        }
    }else if(index >= 0){
        for(var i=0;i<holder.length;i++){
            if(i != index && !$("#"+holder[i]).parent().is(':hidden')){
            	try{
            		var treeObj = $.fn.zTree.getZTreeObj(holder[i]);
                    var nodes = treeObj.getNodes();
                    var node = nodes[0].chked;
                    $("#"+holder[i]).parent().hide();
                    if(node==undefined){
                    	treeObj.reAsyncChildNodes(null, "refresh",true);
                    }
            	}catch (e) {
				}
            }
        }
    }
}

/*初始化checkbox树所需js文件*/
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
        data_ms_tree_url:"",
        data_ms_tree_other:[],
        data_ms_tree_beforeClick:checkboxBeforeClick,
        data_ms_tree_onCheck:checkboxOnCheck
    };
    return msTree;
}
function msTreeCheckboxCommonInvok(){
    var tree = msTreeCheckboxPlug();
    return tree;
}
function msTreeCheckbox(holder,url,otherParamObj){
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
    var other = null;
    for(var i=0;i<arguments.length;i++){
        if(typeof arguments[i]=="string" && /^[a-zA-Z0-9]*$/.test(arguments[i])){
            treeId = arguments[i];
        }else if(typeof arguments[i]=="string" && arguments[i].indexOf("/") != -1){
            treeUrl = arguments[i];
        }else if(typeof arguments[i]=="object"){
        	other = otherParamObj;
        }
    }
    var tree = msTreeCheckboxCommonInvok();
    tree.data_ms_tree_treeId = treeId != null ? treeId : "";
    tree.data_ms_tree_url = treeUrl != null ? treeUrl : "";
    tree.data_ms_tree_other = other != null ? other : [];
    if($("#"+treeId).length!=1){
        alert("初始化复选框参数错误，请检查后重试....");
        return;
    }
    $.fn.zTree.init($("#"+treeId),asyncCheckboxParameters(tree));
    if($("script[title='input']").length==0){
        var script = '<script title="input" type="text/javascript">'
            +'$("input[data-ms-tree]").click(msTreeInputClick);\n'
            +'$(document).mousedown(hideInputMsTree);'
            +'</script>';
        $("body").append(script);
    }
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
            otherParam: tree.data_ms_tree_other,
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
        },
        callback: {
			beforeClick: tree.data_ms_tree_beforeClick,
			onCheck: tree.data_ms_tree_onCheck
		}
    };
    return setting;
}
function checkboxBeforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function checkboxOnCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	var nodes = zTree.getCheckedNodes(true);
	var strValue = "";
	var strId = "";
	for(var i=0;i<nodes.length;i++){
		strValue += nodes[i].name+",";
		strId += nodes[i].id+","
	}
	if(strValue.length>0){
		strValue = strValue.substring(0, strValue.length-1);
		strId = strId.substring(0, strId.length-1);
	}
	$("input[data-ms-tree='"+treeId+"']").val(strValue);
	$("input[data-ms-tree='"+treeId+"Id']").val(strId);
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
//获取容器中符合条件的一个节点
function getMsTreeCheckboxNodeByParam(treeId,key,value,node){
	if(arguments.length<3){
		return;
	}
	var tree = null;
	var attrKey = null;
	var attrValue = null;
	for(var i=0;i<3;i++){
		var length = $("ul#"+arguments[i]).length;
		if(typeof arguments[i]=="string" && length==1){
			tree = arguments[i];
		}else if(typeof arguments[i]=="string" && /^[a-zA-Z0-9]*$/.test(arguments[i])){
			attrKey = arguments[i];
		}else{
			attrValue = arguments[i];
		}
	}
	var treeNdoe = null;
	if(arguments[3] != undefined){
		treeNdoe = arguments[3];
	}
	if(tree != null && attrKey != null && attrValue != null && treeNdoe == null){
		var treeObj = $.fn.zTree.getZTreeObj(tree);
		var node = treeObj.getNodeByParam(attrKey, attrValue, null);
		return node.id;
	}else if(tree != null && attrKey != null && attrValue != null && treeNdoe != null){
		var treeObj = $.fn.zTree.getZTreeObj(tree);
		var nodes = treeObj.getSelectedNodes();
		if(nodes.length<0){
			nodes = treeObj.getCheckedNodes(true);
		}
		var node = treeObj.getNodeByParam(attrKey, attrValue, nodes[0]);
		return node.id;
	}
}
//获取指定容器中所有符合条件的节点
function getMsTreeCheckboxNodesByParam(treeId,key,value,nodeId){
	if(arguments.length<3){
		return;
	}
	var tree = null;
	var attrKey = null;
	var attrValue = null;
	for(var i=0;i<3;i++){
		var length = $("ul#"+arguments[i]).length;
		if(typeof arguments[i]=="string" && length==1){
			tree = arguments[i];
		}else if(typeof arguments[i]=="string" && /^[a-zA-Z0-9]*$/.test(arguments[i])){
			attrKey = arguments[i];
		}else{
			attrValue = arguments[i];
		}
	}
	var treeNdoe = null;
	if(arguments[3] != undefined){
		treeNdoe = arguments[3];
	}
	if(tree != null && attrKey != null && attrValue != null && treeNdoe == null){
		var treeObj = $.fn.zTree.getZTreeObj(tree);
		var nodes = treeObj.getNodesByParam(attrKey, attrValue, null);
		if(nodes.length<=0){
			nodes = treeObj.getCheckedNodes(true);
		}
		var result = "";
		for(var i=0;i<nodes.length;i++){
			result += nodes[i].id+","
		}
		result = result.substring(0, result.length-1);
		return result;
	}else if(tree != null && attrKey != null && attrValue != null && treeNdoe != null){
		var treeObj = $.fn.zTree.getZTreeObj(tree);
		var nodes = treeObj.getCheckedNodes(true);
		var result = "";
		for(var i=0;i<nodes.length;i++){
			var resultNodes = treeObj.getNodesByParam(attrKey, attrValue, nodes[i]);
			for(var j=0;j<resultNodes.length;j++){
				result += resultNodes[j].id+",";
			}
		}
		result = result.substring(0, result.length-1);
		return result;
	}
}
function msTreeInputPlugNode(){
    var msTree={
        data_ms_tree_treeId:"",
        data_ms_tree_filter:filterInputData,
        data_ms_tree_icon:true,
        data_ms_tree_url:"",
        data_ms_tree_dBClick:treeOnDblClickNode,
        data_ms_tree_other:[]
    };
    return msTree;
}
function msTreeInputCommonInvokNode(){
    var tree = msTreeInputPlugNode();
    return tree;
}

function msTreeInputNode(holder,url,otherParamObj){
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
    var other = null;
    for(var i=0;i<arguments.length;i++){
        if(typeof arguments[i]=="string" && /^[a-zA-Z0-9]*$/.test(arguments[i])){
            treeId = arguments[i];
        }else if(typeof arguments[i]=="string" && arguments[i].indexOf("/") != -1){
            treeUrl = arguments[i];
        }else if(typeof arguments[i]=="object"){
        	other = arguments[i];
        }
    }
    var tree = msTreeInputCommonInvokNode();
    tree.data_ms_tree_treeId = treeId != null ? treeId : "";
    tree.data_ms_tree_url = treeUrl != null ? treeUrl : "";
    tree.data_ms_tree_other = other != null ? other : [];
    if($("input[data-ms-tree="+treeId+"]").length==1){
        var div = '<div style="display: none; background:#fff; border:1px solid #ccc;"><ul id="'+treeId+'" class="ztree"></ul></div>';
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
//双击节点事件
function treeOnDblClickNode(event, treeId, treeNode){
    try{
    	var treeObj = $.fn.zTree.getZTreeObj(treeId);
    	var nodes = treeObj.getSelectedNodes();
    	if(nodes.length>0){
    		nodes = nodes[0].children;
    	}
    	if(!nodes.length>0){
    		alert("当前选中节点没有子节点");
    		return;
    	}
    	var name = "";
    	var id = "";
    	for(var i=0;i<nodes.length;i++){
    		name += nodes[i].name+",";
    		id += nodes[i].id+",";
    	}
    	if(name.lenth>0){
    		name = name.substring(0, name.length-1);
    		id = id.substring(0, id.length-1);
    		$("input[data-ms-tree="+treeId+"]").val(name);
            $("input[data-ms-tree="+treeId+"Id]").val(id);
    	}
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
function msTreeCheckboxPlugNode(){
    var msTree={
        data_ms_tree_treeId:"",
        data_ms_tree_checkbox:true,
        data_ms_tree_filter:filterCheckboxData,
        data_ms_tree_icon:true,
        data_ms_tree_url:"",
        data_ms_tree_other:[],
        data_ms_tree_beforeClick:checkboxBeforeClick,
        data_ms_tree_onCheck:checkboxOnCheckNode
    };
    return msTree;
}
function msTreeCheckboxCommonInvokNode(){
    var tree = msTreeCheckboxPlugNode();
    return tree;
}
function msTreeCheckboxNode(holder,url,otherParamObj){
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
    var other = null;
    for(var i=0;i<arguments.length;i++){
        if(typeof arguments[i]=="string" && /^[a-zA-Z0-9]*$/.test(arguments[i])){
            treeId = arguments[i];
        }else if(typeof arguments[i]=="string" && arguments[i].indexOf("/") != -1){
            treeUrl = arguments[i];
        }else if(typeof arguments[i]=="object"){
        	other = otherParamObj;
        }
    }
    var tree = msTreeCheckboxCommonInvokNode();
    tree.data_ms_tree_treeId = treeId != null ? treeId : "";
    tree.data_ms_tree_url = treeUrl != null ? treeUrl : "";
    tree.data_ms_tree_other = other != null ? other : [];
    if($("#"+treeId).length!=1){
        alert("初始化复选框参数错误，请检查后重试....");
        return;
    }
    $.fn.zTree.init($("#"+treeId),asyncCheckboxParameters(tree));
    if($("script[title='input']").length==0){
        var script = '<script title="input" type="text/javascript">'
            +'$("input[data-ms-tree]").click(msTreeInputClick);\n'
            +'$(document).mousedown(hideInputMsTree);'
            +'</script>';
        $("body").append(script);
    }
}

function checkboxOnCheckNode(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	var nodes = zTree.getCheckedNodes(true);
	var strValue = "";
	var strId = "";
	for(var i=0;i<nodes.length;i++){
		if(nodes[i].isParent==false){
			strValue += nodes[i].name+",";
			strId += nodes[i].id+","
		}
	}
	if(strValue.length>0){
		strValue = strValue.substring(0, strValue.length-1);
		strId = strId.substring(0, strId.length-1);
	}
	$("input[data-ms-tree='"+treeId+"']").val(strValue);
	$("input[data-ms-tree='"+treeId+"Id']").val(strId);
}