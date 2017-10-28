


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
                            
                            <div class="col-sm-10">
                                <div class="form-group" style="width:100%;">
                                    <div class="row user_div">
                                        
                                        <div class="col-md-3 col-sm-4">
                                            <label>m1Name:</label>
										<input type="text" class="form-control search-input" target="m1Name"  placeholder="请输入m1Name"/>

                                        </div>
                                        
                                        
                                        <input type="button" class="btn btn-info search-button" style="margin:0px 10px;" name="mySearch" id="mySearch"  value="搜索"/>
                                    </div>
                                </div>
                            </div>
                                 
                            
                            <div class="col-sm-2">
                                <div class="row" style="margin-top: 2px;">
                                
                                    <div class="col-lg-6 col-sm-12">
                                        <button class="btn btn-danger btn-md batch-del" url="${request.getContextPath()}/m1/m1Delete"  style="margin-right:10px;" label="删除">
                                            <span class="fa fa-edit"></span>
                                            批量删除
                                        </button>
                                    </div>
                                
                                    <div class="col-lg-6 col-sm-12">
                                        <button class="btn btn-success btn-md add-button" url="${request.getContextPath()}/m1/m1SaveView"   label="新增m1">
                                            <span class="fa fa-plus"></span>
                                            新增m1
                                        </button>
                                    </div>
                                
                                </div>
                            </div>
                        
                        </div>
                    </div>
                    <ms:dataTable domainClass="${domainClass}" id="msTable" multiSelect="true" orderNumber="true" actionList="[[action:'编辑', class:'edit', url:createLink(controller:'m1',action:'m1SaveView')], [action:'删除', class:'del', url:createLink(controller:'m1',action:'m1Delete')]]" serverSide="true" defaultScript="false" />
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
                    "url": "<g:createLink controller="m1" action="m1TableS" />.json",
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



