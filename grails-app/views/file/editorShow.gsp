<!DOCTYPE html>
<html>
<head>
<title>文本编辑器</title>
<meta name="layout" content="main" charset="UTF-8">

<script type="text/javascript">
    window.UEDITOR_HOME_URL = "/msbase/plugins/ueditor-1.4.3/ueditor-1.4.3/";
    window.UEDITOR = {config:{default:{}},instance:{}};
</script>
<script type="text/javascript" src="/msbase/plugins/ueditor-1.4.3/ueditor-1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="/msbase/plugins/ueditor-1.4.3/ueditor-1.4.3/ueditor.all.js"></script>
<script type="text/javascript" src="/msbase/plugins/ueditor-1.4.3/ueditor-1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    window.UEDITOR_CONFIG.serverUrl = "/msbase/ueditorHandler/handle";
</script>
</head>
<body>
   		<ueditor:editor id="editor" style="width:100%;height:360px;">${editor?.editorValue}</ueditor:editor>
   		<ueditor:config var="toolbars" value="compact"/>
   		<%-- 工具栏禁用选项 --%>
   		<%--<ueditor:config var="toolbars" >
			fullscreen source | undo redo 
			| bold italic underline fontborder strikethrough superscript subscript blockquote pasteplain 
			| forecolor backcolor insertorderedlist insertunorderedlist
		</ueditor:config>
	--%>
</body>
</html>