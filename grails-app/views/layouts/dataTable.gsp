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
    <!--chosen样式(下拉选择)-->
    <asset:link href="plugins/chosen/chosen.css" rel="stylesheet"/>
    <!--日期插件-->
    <asset:link href="datepicker/bootstrap-datetimepicker.min3.css" rel="stylesheet"/>
    <!--定义动画的文件-->
    <asset:link href="animate.css" rel="stylesheet"/>
    <!--后台主题的框架css-->
    <asset:link href="style.css?v=4.1.0" rel="stylesheet"/>

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

.user_div{
    margin-top:4px;
}
.user_div>div{
    margin-bottom:1em;
}
.user_select{
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #cfdadd;
    box-shadow: none;
    width:60%;height:30px;
}
.radio-1 {
    text-align: center;
    top: 10px;
    display: inline-block;
    position: relative;
    left: -20px;
    width: 196px;
}
.radio-1 [type="radio"] {
    display: none;
}
.radio-1 label {
    display: inline-block;
    position: relative;
    width: 20px;
    height: 20px;
    border: 1px #ccc solid;
    background-color: #fff;
    margin-right: 10px;
    cursor: pointer;
    border-radius: 100%;
}
.radio-1 label:after {
    content: '';
    position: absolute;
    top: 1.6px;
    left: 1.8px;
    width: 15px;
    height: 15px;
    background-color: #00a1e9;
    border-radius: 50%;
    -webkit-transform: rotate(0deg) scale(0) skew(0) translate(0);
    -moz-transform: rotate(0deg) scale(0) skew(0) translate(0);
    -o-transform: rotate(0deg) scale(0) skew(0) translate(0);
    -ms-transform: rotate(0deg) scale(0) skew(0) translate(0);
    transform: rotate(0deg) scale(0) skew(0) translate(0);
    -webkit-transition: transform 0.2s ease-out;
    -moz-transition: transform 0.2s ease-out;
    -o-transition: transform 0.2s ease-out;
    -ms-transition: transform 0.2s ease-out;
    transition: transform 0.2s ease-out;
}
.radio-1 [type="radio"]:checked + label {
    background-color: #eee;
    -webkit-transition: background-color 0.2s ease-in;
    -moz-transition: background-color 0.2s ease-in;
    -o-transition: background-color 0.2s ease-in;
    -ms-transition: background-color 0.2s ease-in;
    transition: background-color 0.2s ease-in;
}
.radio-1 [type="radio"]:checked + label:after {
    -webkit-transform: rotate(0deg) scale(1) skew(0) translate(0);
    -moz-transform: rotate(0deg) scale(1) skew(0) translate(0);
    -o-transform: rotate(0deg) scale(1) skew(0) translate(0);
    -ms-transform: rotate(0deg) scale(1) skew(0) translate(0);
    transform: rotate(0deg) scale(1) skew(0) translate(0);
    -webkit-transition: transform 0.2s ease-in;
    -moz-transition: transform 0.2s ease-in;
    -o-transition: transform 0.2s ease-in;
    -ms-transition: transform 0.2s ease-in;
    transition: transform 0.2s ease-in;
}
.radio-1 .user_radio {
    position: relative;
    top: -9px;
    margin-right: 12px;
}
#msTable_processing{
	width:120px;
	height:30px;
	margin-top:-15px;
	margin-left:-60px;
	position:fixed;
	left:50%;
	top:50%;
	font-size:14px;
}
.ms_align_center{
      text-align: center;
}

.chosen-single{
    padding:0 12px !important;
}
    </style>

    <!-- 全局js -->
    <!--jquery依赖文件-->
    <asset:javascript  src="jquery.min.js"/>
    <!--bootstrapt js文件-->
    <asset:javascript src="bootstrap.min.js" />
    <!-- Data Tables插件的js -->
    <asset:javascript src="plugins/dataTables/jquery.dataTables.min2.js"/>
    <asset:javascript src="plugins/dataTables/dataTables.bootstrap.min.js"/>
    <!-- dataTables汉化 -->
    <asset:javascript src="plugins/dataTables/defaultSetting.js"/>
    <!--chosen js(下拉选择)-->
    <asset:javascript src="plugins/chosen/chosen.jquery.js"/>
    <!--日期插件-->
    <asset:javascript  src="datepicker/bootstrap-datetimepicker.min.gai.js"/>
    <!-- 自定义的方法-->
    <asset:javascript src="plugins/layer/layer.min.js"/>
    <asset:javascript src="msFunction.js"/>
    <asset:javascript src="msInit.js"/>
    <g:layoutHead/>
</head>
<body class="${pageProperty(name:'body.class')}" style="${pageProperty(name:'body.style')}">
<g:layoutBody/>
</body>
</html>
