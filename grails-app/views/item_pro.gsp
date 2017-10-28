<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>数据表格</title>
    <meta name="keywords" content="艋顺,艋顺科技，艋顺科技公司">
    <meta name="description" content="艋顺,艋顺科技，艋顺科技公司">
    <link rel="shortcut icon" href="logo.ico" type="images/x-icon" />
    <link rel="icon" href="logo.ico" type="images/x-icon" />
    <link href="bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- 数据表格 -->
    <link href="plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="animate.css" rel="stylesheet">
    <link href="style.css?v=4.1.0" rel="stylesheet">
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
            background:url(biao_xuan.png) no-repeat center;
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
            padding:5px 14px;
            float:right;
            padding-top:6px;
            background:#4E6CA3;
            color:#fff;
        }
        .ding_control div a:hover{
            color:#27C24C;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                        <!--搜索条件-->
                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <label class="sr-only" for="name1">名称</label>
                            <input type="text" class="form-control" id="name1"
                                   placeholder="责任部门">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="name2">名称</label>
                            <input type="text" class="form-control" id="name2"
                                   placeholder="项目名称">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="name3">名称</label>
                            <input type="text" class="form-control" id="name3"
                                   placeholder="项目概况">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="name4">名称</label>
                            <input type="text" class="form-control" id="name4"
                                   placeholder="阶段名称">
                        </div>
                         <div class="form-group">
                            <input type="text" class="form-control input-xs" id="name5"
                                   placeholder="阶段名称" style="width:100px;"><b> -</b>
                            <input type="text" class="form-control input-xs" style="width:100px;" id="name6"
                                   placeholder="阶段名称">
                         </div>
                        <button type="submit" class="btn btn-primary find">查找</button>
                        <button type="submit" class="btn btn-success set">重置</button>
                    </form>
                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                            <tr>
                                <th>项目责任部门</th>
                                <th>项目名称</th>
                                <th>项目概况</th>
                                <th>阶段名称</th>
                                <th style="border-right:none;">登记时间</th>
                                <th style="border-left:none;background: #fff;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Trident</td>
                                <td>Internet Explorer 4.0
                                </td>
                                <td>Win 95+</td>
                                <td>4</td>
                                <td>X</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeC">
                                <td>Trident</td>
                                <td>Internet Explorer 5.0
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5</td>
                                <td class="center">C</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>Trident</td>
                                <td>Internet Explorer 5.5
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5.5</td>
                                <td class="center">A</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet Explorer 4.0
                                </td>
                                <td>Win 95+</td>
                                <td>4</td>
                                <td>X</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeC">
                                <td>Trident</td>
                                <td>Internet Explorer 5.0
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5</td>
                                <td class="center">C</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>Trident</td>
                                <td>Internet Explorer 5.5
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5.5</td>
                                <td class="center">A</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet Explorer 4.0
                                </td>
                                <td>Win 95+</td>
                                <td>4</td>
                                <td>X</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeC">
                                <td>Trident</td>
                                <td>Internet Explorer 5.0
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5</td>
                                <td class="center">C</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>Trident</td>
                                <td>Internet Explorer 5.5
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5.5</td>
                                <td class="center">A</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet Explorer 4.0
                                </td>
                                <td>Win 95+</td>
                                <td>4</td>
                                <td>X</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeC">
                                <td>Trident</td>
                                <td>Internet Explorer 5.0
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5</td>
                                <td class="center">C</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>Trident</td>
                                <td>Internet Explorer 5.5
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5.5</td>
                                <td class="center">A</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet Explorer 4.0
                                </td>
                                <td>Win 95+</td>
                                <td>4</td>
                                <td>X</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeC">
                                <td>Trident</td>
                                <td>Internet Explorer 5.0
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5</td>
                                <td class="center">C</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>Trident</td>
                                <td>Internet Explorer 5.5
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5.5</td>
                                <td class="center">A</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Trident</td>
                                <td>Internet Explorer 4.0
                                </td>
                                <td>Win 95+</td>
                                <td>4</td>
                                <td>X</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeC">
                                <td>Trident</td>
                                <td>Internet Explorer 5.0
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5</td>
                                <td class="center">C</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>Trident</td>
                                <td>Internet Explorer 5.5
                                </td>
                                <td>Win 95+</td>
                                <td class="center">5.5</td>
                                <td class="center">A</td>
                                <td class="ding_control">
                                    <div>
                                        <a href="">编辑</a>
                                        <a href="">增加</a>
                                        <a href="">删除</a>
                                        <a href="">新建</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 自定义js -->
<!-- Page-Level Scripts -->
<script>
//    <!--datatable 配置-->
    $(document).ready( function() {
        $('.dataTables-example').dataTable( {
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ 5 ] }
            ] } );
    } );
//    layer 弹出层
    $(".ding_control div a").click(function (e) {
        e.preventDefault();
        e.stopPropagation()
        layer.msg('Hello layer');
    })
</script>
</body>
</html>
