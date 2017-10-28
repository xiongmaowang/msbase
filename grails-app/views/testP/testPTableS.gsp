


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
										
										<g:select  name="testPName" optionKey="id" optionValue="cnm" class="form-control search-input" target="testPName" style="width:196px;"
										   from="${com.ms.base.DictParam.createCriteria().list{eq("parent.id","1") eq("enabled",true)}}"  noSelection="['':'--请选择--']"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">testPInt:</label>
										<input type="number" class="form-control search-input" target="testPInt" placeholder="请输入testPInt"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">testPShort:</label>
										<input type="number" class="form-control search-input" target="testPShort" placeholder="请输入testPShort"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">testPBigInteger:</label>
										<input type="number" class="form-control search-input" target="testPBigInteger" placeholder="请输入testPBigInteger"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">testPDouble:</label>
										<input type="number" class="form-control search-input" target="testPDouble" placeholder="请输入testPDouble"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">testPByte:</label>
										<input type="number" class="form-control search-input" target="testPByte" placeholder="请输入testPByte"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">testPBol:</label>
										
										<span class="radio-1">
										    <input type="radio" class="search-input" id="testPBol-1" name="testPBol-1" value="true"  target="testPBol" />
										    <label for="testPBol-1"></label>
										    <span class="user_radio">是</span>
										
										    <input type="radio" class="search-input" id="testPBol-2" name="testPBol-1" value="false" target="testPBol"/>
										    <label for="testPBol-2"></label>
										    <span class="user_radio">否</span>
										</span>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">content:</label>
										<input type="text" class="form-control search-input" target="content"  placeholder="请输入content"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">dateCreated:</label>
										
										<input  type="text" placeholder="请输入dateCreated" readonly  class="date-picker form-control search-input" target="dateCreated"/>

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">testCs:</label>
										<input type="text" class="form-control search-input" target="testCs"  placeholder="请输入testCs"/>

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
                                        <button class="btn btn-danger btn-block batch-del" url="${request.getContextPath()}/testP/testPDelete" label="删除">
                                            <span class="fa fa-edit"></span>
                                            批量删除
                                        </button>
                                    </div>
                                
                                    <div class="col-md-6 col-sm-12">
                                        <button class="btn btn-success btn-block add-button" url="${request.getContextPath()}/testP/testPSaveView" label="新增P">
                                            <span class="fa fa-plus"></span>
                                            新增P
                                        </button>
                                    </div>
                                
                                </div>
                            </div>
                        
                        </div>
                    </div>
                    <!--列表页面-->
                    <ms:dataTable domainClass="${domainClass}" id="msTable" multiSelect="true" orderNumber="true" actionList="[[action:'编辑', class:'edit', url:createLink(controller:'testP',action:'testPSaveView')], [action:'删除', class:'del', url:createLink(controller:'testP',action:'testPDelete')]]" serverSide="true" defaultScript="false" />
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
                    "url": "<g:createLink controller="testP" action="testPTableS" />.json",
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



