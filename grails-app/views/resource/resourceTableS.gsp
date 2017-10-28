


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
                                        
%{--                                        <div class="col-md-3 col-sm-4">
                                        <label>资源名称:</label>
                                    <input type="text" class="form-control search-input" target="resourceName"  placeholder="请输入资源名称"/>

                                    </div>--}%

                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">模块名:</label>
                                    <input type="text" class="form-control search-input" target="model.modelName"  placeholder="请输入模块名"/>

                                    </div>
%{--                                        <div class="col-md-3 col-sm-4" style="margin-top: -4px;">
                                        <label >模块名:</label>
                                        <span class="radio-1">
                                            <input type="radio" class="search-input" name="radio-1" id="radio-1-1" value="false" target="resourceName"  />
                                            <label for="radio-1-1"></label>
                                            <span class="user_radio">男</span>

                                            <input type="radio" class="search-input" name="radio-1" id="radio-1-2" value="true" target="resourceName"  />
                                            <label for="radio-1-2"></label>
                                            <span class="user_radio">女</span>
                                        </span>
                                    </div>--}%
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
                                        <button class="btn btn-danger btn-block batch-del" url="${request.getContextPath()}/resource/resourceDelete"  style="margin-right:10px;" label="删除">
                                            <span class="fa fa-edit"></span>
                                            批量删除
                                        </button>
                                    </div>
                                
                                    <div class="col-lg-6 col-sm-12">
                                        <button class="btn btn-success btn-block add-button" url="${request.getContextPath()}/resource/resourceSaveView"   label="新增资源">
                                            <span class="fa fa-plus"></span>
                                            新增资源
                                        </button>
                                    </div>
                                </div>
                            </div>
                        
                        </div>
                    </div>
                    <ms:dataTable domainClass="${domainClass}" id="msTable" multiSelect="true" orderNumber="false" actionList="[[action:'编辑', class:'edit', url:createLink(controller:'resource',action:'resourceSaveView')], [action:'删除', class:'del', url:createLink(controller:'resource',action:'resourceDelete')], [action:'启用', class:'del',method:'enabledShow', url:createLink(controller:'resource',action:'resourceChange')]]" serverSide="true" defaultScript="false" />
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
                    "url": "<g:createLink controller="resource" action="resourceTableS" />.json",
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

           //tab.

         } );
    })(window,document,jQuery,layer);

</script>
</body>
</html>



