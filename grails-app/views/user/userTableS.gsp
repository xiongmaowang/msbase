


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
                <div class="ibox-content" tableId="msTable" >
                    <div class="form-inline" role="form">
                        <div class="row">
                            <!--搜索条件-->
                            <form>
                            <div class="col-md-9">
                                <div class="row user_div">

                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">用户名:</label>
                                    <input type="text" class="form-control search-input" target="username"  placeholder="请输入用户名"/>

                                    </div>

                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">中文名:</label>
                                    <input type="text" class="form-control search-input" target="chinaName"  placeholder="请输入中文名"/>

                                    </div>

                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">创建时间:</label>
                                        <input  type="text" placeholder="请输入创建时间" readonly  class="date-picker form-control search-input" target="dateCreated"/>
                                     </div>


                                    <div class="col-md-4 col-sm-12 pull-right">
                                        <div class="row">
                                            <div class="col-md-8" style="padding:0;">
                                                <div class="col-sm-6">
                                                    <button class="btn btn-info btn-block search-button" type="button"  name="mySearch" id="mySearch">搜索</button>
                                                </div>
                                                <div class="col-sm-6">
                                                    <button class="btn btn-primary btn-block" type="reset">重置</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            
                            <div class="col-md-3 col-sm-12">
                                <div class="row">
                                
                                    <div class="col-lg-6 col-sm-12">
                                        <button class="btn btn-danger btn-block batch-del" url="${request.getContextPath()}/user/userChange"  style="margin-right:10px;" label="无效">
                                            <span class="fa fa-edit"></span>
                                            批量无效
                                        </button>
                                    </div>
                                
                                    <div class="col-lg-6 col-sm-12">
                                        <button class="btn btn-success btn-block add-button" url="${request.getContextPath()}/user/userSaveView"   label="新增用户">
                                            <span class="fa fa-plus"></span>
                                            新增用户
                                        </button>
                                    </div>
                                
                                </div>
                            </div>
                        
                        </div>
                    </div>
                    <ms:dataTable domainClass="${domainClass}" id="msTable" multiSelect="true" orderNumber="true" actionList="[[action:'编辑', class:'edit', url:createLink(controller:'user',action:'userSaveView')], [action:'无效', class:'del', method:'enabledShow', url:createLink(controller:'user',action:'userChange')]]" serverSide="true" defaultScript="false" />
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 自定义js -->
<!-- Page-Level Scripts -->
<script>
    (function(win,doc,$,lay){
        //datatable 配置
        $(doc).ready( function() {
            var tableId="msTable"
            var dataobj=eval("dataObj"+tableId)
             tab=$('#'+tableId).DataTable( {
                "columns":dataobj.columns,
                "order" :dataobj.defaultSort,
                "processing": true ,
                "serverSide": dataobj.serverSide,
                //控制dataTable的布局
                dom: 'lrtip',
                /*autoWidth: false,
                 scrollX: true,*/
                autoWidth :true,
                "ajax":  {
                    "url": "<g:createLink controller="user" action="userTableS" />.json",
                    "type": "POST",
                    "data": function ( d ) {
                        return {
                            'tableData':JSON.stringify(d),
                            'ajaxData' :dataobj.ajaxData
                        };
                    }
                }
            })
                    dataTablesInit(tab);

         } );
    })(window,document,jQuery,layer);

</script>
</body>
</html>



