<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="dataTable">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content" tableId="sbsb" >
                    <!--搜索条件-->
                    <div class="form-inline" role="form">
                    <div class="form-group">
                        <label for="name1">输入查询条件:</label>
                        <input type="text" class="form-control search-input" target="configAttribute" placeholder="Search configAttribute">
                        <input type="text" class="form-control search-input" target="url" placeholder="Search url">
                        <input type="text" class="form-control search-input" target="resource.model.modelName"  placeholder="Search id">
                        <input type="text" class="form-control search-input" target="getmdn()"  placeholder="Search id">

                        <input type="button" class="btn btn-info search-button" style="margin:6px 10px;" name="mySearch" id="mySearch"  value="搜索"/>
                    </div>
                        <div class="pull-right" style="margin-top: 8px;">
                            <button class="btn btn-danger btn-md batch-del" url="${request.getContextPath()}/table/deleteAll" style="margin-right:10px;">
                                <span class="fa fa-edit"></span>
                                批量删除
                            </button>
                            <button class="btn btn-success btn-md add-button" id="add_user" url="${request.getContextPath()}/table/deleteAll">
                                <span class="fa fa-plus"></span>
                                添加用户</button>
                        </div>
                    </div>

                    <ms:dataTable domainClass="${domainClass}" id="sbsb" multiSelect="true" orderNumber="true" actionList="[[action:'增加',class:'edit',url:'/table/edit'],[action:'删除',class:'del',url:'/table/deleteAll',method:'getRsl()']]" serverSide="true" defaultScript="true" url="http://localhost:8080/msbase/table/dt.json"/>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 自定义js -->
<!-- Page-Level Scripts -->
%{--<script>
    (function(win,doc,$,lay){
        //datatable 配置
        $(doc).ready( function() {
            var tableId="sbsb"
            var dataobj=eval("dataObj"+tableId)
            aa=$('#'+tableId).DataTable( {
                "columns":dataobj.columns,
                "order" :dataobj.defaultSort,
                "processing": true ,
                "serverSide": dataobj.serverSide,
                //控制dataTable的布局很重要 很重要
                dom: 'lrtip',
                /*autoWidth: false,
                 scrollX: true,*/
                autoWidth :true,
                "ajax":  {
                    "url": "http://localhost:8080/msbase/table/dt.json",
                    "type": "POST",
                    "data": function ( d ) {
                        return {
                            'tableData':JSON.stringify(d),
                            'ajaxData' :dataobj.ajaxData
                        };
                    }
                }
            })
                    dataTablesInit(aa);

         } );




    })(window,document,jQuery,layer);

</script>--}%
</body>
</html>



