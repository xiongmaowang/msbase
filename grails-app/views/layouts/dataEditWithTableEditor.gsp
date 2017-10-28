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
    <!--dataTable样式-->
    <asset:link href="plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
    <!--datatablesEditor -->
    <asset:link href="plugins/dataTables/buttons.bootstrap.min.css" rel="stylesheet"/>
    <asset:link href="plugins/dataTables/select.bootstrap.min.css" rel="stylesheet"/>
    <asset:link href="plugins/dataTables/editor/editor.bootstrap.min.css" rel="stylesheet"/>
    <!--定义动画的文件-->
    <asset:link href="animate.css" rel="stylesheet"/>
    <!--后台主题的框架css-->
    <asset:link href="style.css?v=4.1.0" rel="stylesheet"/>
    <!--日期插件-->
    <asset:link href="datepicker/bootstrap-datetimepicker.min3.css" rel="stylesheet"/>
    <!--重写的css-->
    <style>
    .form-inline{
        margin-bottom: 10px;
    }
    .form-group{
        margin-right:8px;
    }
    .btn.find ,.btn.set{
        margin-top:6px;
        margin-left: 10px;
    }
    .ding_control{
        background:url(${request.getContextPath()}/assets/biao_xuan.png) no-repeat center;
        position:relative;
    }
    .ding_control:hover div{
        display:block;
    }
    .ding_control div{
        position: absolute;
        right:0;
        top:0px;
        min-width: 800px;
        z-index:999;
        display:none;
    }
    .ding_control div a{
        display:inline-block;
        font-size:16px;
        padding:8px 14px;
        float:right;
        padding-top:6px;
        background:#4E6CA3;
        color:#fff;
    }
    .ding_control div a:hover{
        color:#27C24C;
    }
    </style>

    <!-- 全局js -->
    <!--jquery依赖文件-->
    <asset:javascript  src="jquery.min.js"/>
    <!--bootstrapt js文件-->
    <asset:javascript src="bootstrap.min.js"/>
    <!--验证-->
    <asset:javascript src="inputcheck/checks.js"/>
    <!--日期插件-->
    <asset:javascript  src="datepicker/bootstrap-datetimepicker.min.gai.js"/>

    <!-- Data Tables插件的js -->
    <asset:javascript src="plugins/dataTables/jquery.dataTables.min2.js"/>
    <asset:javascript src="plugins/dataTables/dataTables.bootstrap.min.js"/>
    <asset:javascript src="plugins/dataTables/defaultSetting.js"/>
    <!-- talbeEditor-->
    <asset:javascript src="plugins/dataTables/editor/dataTables.buttons.min.js"/>
    <asset:javascript src="plugins/dataTables/editor/buttons.bootstrap.min.js"/>
    <asset:javascript src="plugins/dataTables/editor/dataTables.select.min.js"/>
    <asset:javascript src="plugins/dataTables/editor/dataTables.editor.min.js"/>
    <asset:javascript src="plugins/dataTables/editor/editor.bootstrap.min.js"/>

    <!--树插件-->
    <asset:javascript  src="tree/msTreeInputAndCheckbox.js"/>
    <!-- 自定义的方法-->
    <asset:javascript src="plugins/layer/layer.min.js"/>
    <asset:javascript src="msFunction.js"/>
    <g:layoutHead/>
</head>
<body class="${pageProperty(name:'body.class')}" style="${pageProperty(name:'body.style')}">
<g:layoutBody/>
</body>
</html>
