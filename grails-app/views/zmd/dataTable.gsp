


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
                                <div class="col-sm-10">
                                    <div class="form-group" style="width:100%;">
                                        <div class="row user_div">

                                            <input type="button" class="btn btn-info search-button" style="margin:0px 10px;" name="mySearch" id="mySearch"  value="搜索"/>
                                            <button class="btn btn-success" type="reset" style="margin:0px 10px;">重置</button>
                                        </div>
                                    </div>
                                </div>
                                </form>

                                    <div class="col-sm-2">
                                        <div class="row" style="margin-top: 2px;">

                                            <div class="col-lg-6 col-sm-12">
                                                <button class="btn btn-danger btn-md batch-del" url="${request.getContextPath()}/user/userChange"  style="margin-right:10px;" label="无效">
                                                    <span class="fa fa-edit"></span>
                                                    批量无效
                                                </button>
                                            </div>

                                            <div class="col-lg-6 col-sm-12">
                                                <button class="btn btn-success btn-md add-button" url="${request.getContextPath()}/user/userSaveView"   label="新增用户">
                                                    <span class="fa fa-plus"></span>
                                                    新增用户
                                                </button>
                                            </div>

                                        </div>
                                    </div>

                        </div>
                    </div>
                    <table id="msTable" class="table table-striped table-bordered table-hover dataTables-example" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                        </tr>
                        </thead>
                    </table>
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
            tab=$('#'+tableId).DataTable( {
                "columns":    [
                    {"data":"re","name":"re","orderable":false},
                    {"data":"br","name":"br","orderable":false},
                    {"data":"pl","name":"pl","orderable":false},
                    {"data":"ev","name":"ev","orderable":false},
                    {"data":"cg","name":"cg","orderable":false}
                ],
                "processing": true ,
                "serverSide": true,
                //控制dataTable的布局
                dom: 'lrtip',
                /*autoWidth: false,
                 scrollX: true,*/
                autoWidth :true,
                "ajax":  {
                    "url": "<g:createLink controller="table" action="index" />.json",
                    "type": "POST",
                    "data": function ( d ) {
                        return {
                            'tableData':JSON.stringify(d)
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



