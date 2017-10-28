<!DOCTYPE html>
<html>
<head>
    <title>复选框Demo</title>
    <meta name="layout" content="dataEdit">
    <asset:link href="tree/metroStyle.css" rel="stylesheet"/>
    <asset:javascript  src="jquery.min.js"/>
	<asset:javascript src="tree/jquery.ztree.all.min.js"/>
    <asset:javascript src="tree/msTreeInputAndCheckbox.js"/>
</head>
<body>
	<!-- 初始化复选框树 -->
	<!-- 
		初始化树之前请先创建容器，此为容器的必须格式<div><ul id="checkboxDemo"></ul></div>,
		ul中id必须唯一，否则无法初始化
	 -->
	<div>
		<ul id="checkboxDemo" class="ztree"></ul>
	</div>
	<div>
		<ul id="checkboxDemo1" class="ztree"></ul>
	</div>
	<div id="info"></div>
	<button type="button" id="get">获取勾选节点</button>
	<button type="button" id="out">获取未勾选节点</button>
	<button type="button" id="getData1">获取name为浙江省的节点</button>
	<button type="button" id="getData2">获取parent为0的节点</button>
	<script type="text/javascript">
	//msTreeCheckbox(treeId,url)
	//treeId:对应容器中ul的id
	//url：用于从后台获取数据的地址
		msTreeCheckbox("checkboxDemo","../testTreeData/getchbox");
		$("#get").click(function(){
			var info = getMsTreeCheck("checkboxDemo");//用于获取勾选节点的信息
			//使用getMsTreeCheck方法时，该方法返回json字符串，json字符串中有length属性，
			//以便调用者方便遍历json对象
			//info = JSON.parse(info)
			$("#info").text(info);
		});
		$("#out").click(function(){
			var info = getMsTreeNoCheck("checkboxDemo");
			info = JSON.parse(info)//将json字符串转换为json对象。
			$("#info").text(info);
			console.log(info);
		});
		//获取name为浙江省的id、name
		$("#getData1").click(function(){
			var data = getMsTreeCheckboxNodeByParam("checkboxDemo","name","浙江省");
			alert(data);
		});
		//获取所有parent为0的节点,前三个参数为必须，后一个参数随意，该参数为在勾选节点下查找所有符合条件的节点
		$("#getData2").click(function(){
			var data = getMsTreeCheckboxNodesByParam("checkboxDemo","parent",0,1);
			alert(data);
		});
		//传入other格式的参数后，请在后台打印参数查看
		//var other = ["userId","abcdefaf"];
		//msTreeCheckbox("checkboxDemo1","../testTreeData/getchbox",other);
	</script>
</body>
</html>