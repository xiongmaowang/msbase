<!DOCTYPE html>
<html>
<head>
    <title>下拉菜单树Demo</title>
    <asset:link href="tree/metroStyle.css" rel="stylesheet"/>
    <asset:javascript  src="jquery.min.js"/>
    <asset:javascript src="tree/jquery.ztree.all.min.js"/>
    <asset:javascript src="tree/msTreeInputAndCheckbox.js"/>
</head>
<body>
	<!-- 初始化下拉菜单树 -->
	<!-- 
	初始化下拉菜单树时，必须为input元素，该元素必须有id，
	必须有自定义属性data-ms-tree，并且该属性后必须有容器名称，且容器名称唯一。
	缺少任何一个条件则下拉菜单初始化不成功。
	初始化时，mstree插件会向后台自动提交参数id、name。请看/msbase/controllers/com/ms/tree/TestTreeDataController.groovy
	
	 -->
	<input id="text1" type="text" data-ms-tree="treeDemo"/>
	<button type="button" id="get">获取选中值的id</button>
	<input id="text2" type="text" data-ms-tree="treeDemo1"/>
	<div style="display: none; background:#fff; border:1px solid #ccc;">
		<ul id="treeDemo1" class="ztree"></ul>
	</div>
	<input data-ms-tree="treeDemo1Id" type="hidden"/>
	<input data-ms-tree="treeDemoId" type="hidden"/>
	<script type="text/javascript">
	//msTreeInput(treeId,url),该方法有两个参数，treeId对应自定义属性data-ms-tree后的容器名称。
	//url：地址为后台获取数据的地址
	//msTreeInput("treeDemo","../testTreeData/getInput");
	msTreeCheckbox("treeDemo1","../testTreeData/getchbox");
	/*$("#get").click(function(){
		//方法getInputCode()用于获取选中地区的id，需要参数treeId
		var id = getInputCode("treeDemo");//获取选中地址的id
		var value = $("input[data-ms-tree='treeDemo']").val();//获取选中地址的value
		alert("选中地址的id："+id+",value:"+value);
	});*/
	</script>
</body>
</html>