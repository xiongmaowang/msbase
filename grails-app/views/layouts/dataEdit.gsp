<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title><g:layoutTitle default="数据表格" /></title>
    <meta name="keywords" content="艋顺,艋顺科技，艋顺科技公司">
    <meta name="description" content="艋顺,艋顺科技，艋顺科技公司">

    <!--bootstrapt样式文件-->
    <asset:link href="bootstrap.min.css" rel="stylesheet"/>
    <!--字体的样式文件-->
    <asset:link href="font-awesome.css" rel="stylesheet"/>
    <!--定义动画的文件-->
    <asset:link href="animate.css" rel="stylesheet"/>
    <!--chosen样式(下拉选择)-->
    <asset:link href="plugins/chosen/chosen.css" rel="stylesheet"/>
    <!--日期插件-->
    <asset:link href="datepicker/bootstrap-datetimepicker.min3.css" rel="stylesheet"/>
    <!--后台主题的框架css-->
    <asset:link href="style.css?v=4.1.0" rel="stylesheet"/>
    <!--树插件-->
    <asset:link href="tree/metroStyle.css" rel="stylesheet"/>
    <style>
	    .help-block.add_controlShow{
	        color:#f00;
	    }
	    <%-- ajax进度条 --%>
	    
	    .hideForm{display:none } 
	    .progressForm{z-index: 2000} 
	    .maskForm{position: fixed;top: 0;right: 0;bottom: 0;left: 0; z-index: 1000; background-color: #000000} 
    </style>

    <!-- 全局js -->
    <!--jquery依赖文件-->
    <asset:javascript  src="jquery.min.js"/>
    <!--bootstrapt js文件-->
    <asset:javascript src="bootstrap.min.js"/>
    <!--验证-->
    <asset:javascript src="inputcheck/checks.js"/>
    <!--chosen js(下拉选择)-->
    <asset:javascript src="plugins/chosen/chosen.jquery.js"/>
    <!--日期插件-->
    <asset:javascript  src="datepicker/bootstrap-datetimepicker.min.gai.js"/>
    <!--树插件-->
    <asset:javascript  src="tree/msTreeInputAndCheckbox.js"/>
    <!-- 自定义的方法-->
    <asset:javascript src="plugins/layer/layer.min.js"/>
    <asset:javascript src="msFunction.js"/>
    <asset:javascript src="msInit.js"/>
    <g:layoutHead/>
</head>
<body class="${pageProperty(name:'body.class')}" style="${pageProperty(name:'body.style')}">
<%-- ajax进度条 --%>
<img id="progressImgage" class="progressForm hideForm" alt="" src="${request.getContextPath()}/assets/ajax-loader.gif"/>
<div id="maskOfProgressImage" class="maskForm hideForm"> </div>
<g:layoutBody/>
</body>
</html>
