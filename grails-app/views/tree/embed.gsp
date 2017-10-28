<!DOCTYPE html>
<html>
<head>
    <title>内嵌页面</title>
	<asset:javascript src="plugins/layer/layer.min.js"/>
    <asset:javascript src="msFunction.js"/>
</head>
<body>
<form action="${request.getContextPath()}/testTreeData/saveTree" id="treeFrom">
<!-- 下面4个是插件默认带的 -->
上级名称<input class="form-control" data-ms-tree-operate-pname readonly="readonly"/><br/>
名称<input class="form-control" data-ms-tree-operate-name name="areaName" /><br/>
<!-- 当前id -->
<input class="form-control" data-ms-tree-operate-id readonly="readonly" style="display: none;" name="areaCde"/><br/>
<!-- 当前pid -->
<input class="form-control" data-ms-tree-operate-pid readonly="readonly" style="display: none;"  name="snrArea"/><br/>
<!-- 添加自己的属性标签 -->
<!-- 当前地区level级别 -->
<input class="form-control" data-ms-tree-operate-level readonly="readonly" style="display: none;" name="areaLevel" value="${boatArea?.areaLevel }"/>

<button type="button" class="btn btn-success pull-right" style="margin-left: 10px;">保存</button>
<button type="reset" class="btn btn-info pull-right">重置</button>
</form>
<script type="text/javascript">


	$("button[type='button']").click(function(){
		var url = "${request.getContextPath()}/testTreeData/saveTree";
		var data = $('#treeFrom').serialize();
		actionAjax(url,data,success);
		function success(data){
			if(data.result){
				//msTreeOperateUpdateNode("handleDemo",true);
				alert("编辑成功");
			}else{
				alert("编辑失败");
			}
			//刷新左边的树
			var treeObj = $.fn.zTree.getZTreeObj("handleDemo");
			var nodes = treeObj.getSelectedNodes();
			var prent;
			if (nodes && nodes.length>0) {
				prent = nodes[0].getParentNode();
			}
			if(prent==null){
				treeObj.reAsyncChildNodes(null, "refresh");
			}else{
				treeObj.reAsyncChildNodes(prent, "refresh");
			}
		}
		//console.log("asdfas");
		//点击保存发送请求，后台返回result=0(演示案例中所有成功标志result=0)，所有tree封装的成功标志为result=0，
		//1、在子节点下增加节点，请调用msTreeOperateNodeAdd(treeId)方法，
		//需传入treeId：容器实例名称如这里传入handle.gsp页面的handleDemo
		//2、在父节点下增加节点，请调用msTreeOperateParentAdd(treeId)方法,需传入treeId：容器实例名称
	});
	
</script>
</body>
</html>