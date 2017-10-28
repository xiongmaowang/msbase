<!DOCTYPE html>
<html>
<head>
    <title>文件上传</title>
    <meta name="layout" content="dataEdit"> 
    <asset:link href="tree/metroStyle.css" rel="stylesheet"/> 
	<asset:javascript src="tree/jquery.ztree.all.min.js"/>
    <asset:javascript src="tree/msOperateTree.js"/>
</head>
<body>
	<!-- 初始化操作树 -->
	<!-- 
		初始化树之前请先创建容器及内嵌页面容器，此两个容器为必须,
		ul中id必须唯一，否则无法初始化
	 -->
	<button id="count" class="btn btn-info">添加父节点</button>
	<div>
		<div style="width: 40%; float: left;">
			<ul id="handleDemo" class="ztree"></ul>
		</div>
		<!-- 该div容器用于内嵌页面，在该演示按钮中用于内嵌embed.gsp页面，
			该容器的id必须为newPageOperateHolder且id唯一，否则无法内嵌页面
		-->
		<div id="newPageOperateHolder" style="width: 50%; float: left;">	
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		$("#count").click(function(){
			$("#newPageOperateHolder").load("${request.getContextPath()}/${controller}/${controller}Emb?type=parent");
		});
	});
	//msTreeCheckbox(treeId,url)
	//treeId:对应容器中ul的id
	//url：用于从后台获取数据的地址
		msTreeOperate("handleDemo","${request.getContextPath()}/${controller}/getOperate");
		//该函数用于隐藏右键操作菜单，使用时必须加此函数，
		//函数所调用方法hideOperateMsTree()需要两个参数，
		//e:even对象
		//handleDemo:treeId
		$(document).mousedown(function(e){
			hideOperateMsTree(e,"handleDemo");
		});
	</script>
</body>
</html>