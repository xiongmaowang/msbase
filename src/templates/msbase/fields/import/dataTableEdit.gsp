<!--字体的样式文件-->
<asset:link href="font-awesome.css" rel="stylesheet"/>
<!--dataTable样式-->
<asset:link href="plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
<!--datatablesEditor -->
<asset:link href="plugins/dataTables/buttons.bootstrap.min.css" rel="stylesheet"/>
<asset:link href="plugins/dataTables/select.bootstrap.min.css" rel="stylesheet"/>
<asset:link href="plugins/dataTables/editor/editor.bootstrap.min.css" rel="stylesheet"/>

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
    background:url(\${request.getContextPath()}/assets/biao_xuan.png) no-repeat center;
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