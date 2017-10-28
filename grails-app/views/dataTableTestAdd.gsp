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
                <div class="ibox-content">
                    <!--搜索条件-->
                    <div class="form-inline" role="form">
                        <div class="form-group">
                            <label for="name1">输入用户名:</label>
                            <input type="text" class="form-control" id="name1"
                                   placeholder="请输入搜索条件">
                            <button class="btn btn-info" style="margin:6px 10px;">搜索</button>
                        </div>
                        <div class="pull-right" style="margin-top: 8px;">
                            <button class="btn btn-danger btn-md batch" style="margin-right:10px;">
                                <span class="fa fa-edit"></span>
                                批量删除
                            </button>
                            <button class="btn btn-success btn-md" id="add_user">
                                <span class="fa fa-plus"></span>
                                添加用户</button>
                        </div>
                    </div>
                    <ms:dataTable domainClass="${com.ms.base.Requestmap}" id="233" multiSelect="false" orderNumber="false" actionList="[[action:'增加',class:'sbsb'],[action:'增加2',class:'sbsb2']]"/>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 自定义js -->
<!-- Page-Level Scripts -->
<script>
    (function(win,doc,$,lay){
        // layer 弹出层
        function layerMsg(e, n) {
            lay.msg(e, {
                icon: n,
                time: 1e3
            })
        }
        //   t弹出层显示
        function layer_show(e, n, t, a, s) {
            null != e && "" != e || (e = !1),
            null != a && "" != a || (a = 800),
            null != s && "" != s || (s = $(window).height() - 300),
                    lay.open({
                        type: 2,
                        area: [a + "px", s + "px"],
                        fix: !1,
                        maxmin: !0,
                        shade:.4,
                        title:[e,'color:#23B7E5'],
                        content: n
                    })
        }
        //datatable 配置
        $(doc).ready( function() {
            var tableId="233"
            var dataobj=eval("dataObj"+tableId)
            aa=$('#'+tableId).DataTable( {
                "columns":dataobj.columns,
                "order" :dataobj.defaultSort,
                //控制dataTable的布局很重要 很重要
                //dom: 'lrtip',
                /*autoWidth: false,
                 scrollX: true,*/
                "ajax":  {
                    "url": "http://localhost:8080/msbase/table/dtAdd.json",
                    "type": "POST",
                    "data": function ( d ) {
                        return {
                            'tableData':JSON.stringify(d),
                            'ajaxData' :dataobj.ajaxData
                        };
                    }
                }

            });
        } );
        // 全选按钮
        $(".userList_check_control").bind("click", function () {
            if($('.userList_check_control').is(':checked') == true){
                $("INPUT[name='checkbox_name[]']").each( function() {
                    if(false == $(this).is(':checked')){
                        $(this).prop("checked", true);
                    }
                });
            }
            if($('.userList_check_control').is(':checked') == false){
                $("INPUT[name='checkbox_name[]']").each( function() {
                    if(true == $(this).is(':checked')){
                        $(this).prop("checked", false);
                    }
                });
            }
        });
        //  批量删除
        $(".batch").on("click", function(e) {
            e.preventDefault();
            0 == $(".table tbody :checkbox:checked").length ? lay.msg("请选择需要删除的数据！", {
                icon: 0
            }) : lay.confirm("确认要删除吗？", {
                icon: 0,
                title: "警告",
                shade: !1
            }, function(t) {
                $(".table tbody :checkbox:checked").parents("tr").remove(),
                        lay.msg("已删除!", {
                            icon: 1,
                            time: 1e3
                        })
            })
        })
        //    添加用户
        $("#add_user").on("click", function() {
            var e = $(this).html();
            var t="add_user.html";
            layer_show(e, t, "", "1000", "600")
        }),
                //    删除一行
                $(".table ").on("click",".ding_control div a.del",function (e) {
                    e.preventDefault();
                    var t=$(this);
                    lay.confirm("确认要删除吗？", {
                        icon: 0,
                        title: "警告",
                        shade: !1
                    }, function(a) {
                        t.parent().parent().parent().remove();
                        lay.msg("已删除!", {
                            icon: 1,
                            time: 1e3
                        })
                    })
                })
        //    重新启用或停用
        $(".table ").on("click",".ding_control div a.go",function (e) {
            e.preventDefault();
            var t=$(this);
            if(t.text()=="启用"){
                lay.confirm("确认要启用吗？", {
                    icon: 0,
                    title: "警告",
                    shade: !1
                }, function(a) {
                    t.html("停用");
                    t.parent().parent().prev().html('<button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>');
                    lay.msg("已启用!", {
                        icon: 5,
                        time: 1e3
                    })
                })
            }else{
                lay.confirm("确认要停用吗？", {
                    icon: 0,
                    title: "警告",
                    shade: !1
                }, function(a) {
                    t.html("启用");
                    t.parent().parent().prev().html('<button class="btn btn-default btn-xs" style="margin-bottom: 0px;background:#E6E6E6;">已停用</button>');
                    lay.msg("已停用!", {
                        icon: 5,
                        time: 1e3
                    })
                })
            }
        })
        //    编辑
        $(".table ").on("click",".ding_control div a.edit",function (e) {
            e.preventDefault();
            var data=aa.row().data();
            var e = $(this).html();
            var t="add_user.html";
            layer_show(e, t, "", "1000", "600")
        })
    })(window,document,jQuery,layer);
</script>
</body>
</html>



