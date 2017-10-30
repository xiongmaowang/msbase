


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
                                        <label style="width:100px;">testPName:</label>
										
										<g:select name="testP"  optionKey="id" optionValue="id" class="chosen-select form-control search-input " target="testP" style="width:196px;"
										   from="${com.ms.test.TestP.list()}"  noSelection="['':'--请选择--']"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">testAName:</label>
										<input type="text" class="form-control search-input" target="testAName"  placeholder="请输入testAName"/>

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
                                <div class="row" >
                                
                                    <div class="col-md-6 col-sm-12">
                                        <button class="btn btn-danger btn-block batch-del" url="${request.getContextPath()}/testA/testADelete" label="删除">
                                            <span class="fa fa-edit"></span>
                                            批量删除
                                        </button>
                                    </div>
                                
                                    <div class="col-md-6 col-sm-12">
                                        <button class="btn btn-success btn-block add-button" url="${request.getContextPath()}/testA/testASaveView" label="新增A">
                                            <span class="fa fa-plus"></span>
                                            新增A
                                        </button>
                                    </div>
                                
                                </div>
                            </div>
                        
                        </div>
                    </div>
                    <!--列表页面-->
                    <ms:dataTable domainClass="${domainClass}" id="msTable" multiSelect="true" orderNumber="true" actionList="[[action:'编辑', class:'edit', url:createLink(controller:'testA',action:'testASaveView')], [action:'删除', class:'del', url:createLink(controller:'testA',action:'testADelete')]]" serverSide="true" defaultScript="false" />
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
                    "url": "<g:createLink controller="testA" action="testATableS" />.json",
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



