<!DOCTYPE html>
<html>
<head>
    <title>数据表格</title>
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
                    <table id="233" class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th><input type="checkbox" class="userList_check_control"></th>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>手机</th>
                            <th>身份证号</th>
                            <th>邮箱</th>
                            <th>地址</th>
                            <th>加入时间</th>
                            <th>状态</th>
                            <th style="border-left:none;background: #fff;"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                13
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="" class="go">停用</a>
                                    <a href="" class="edit">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                14
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                15
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-default btn-xs" style="margin-bottom: 0px;background:#E6E6E6;">已停用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                金少
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-default btn-xs" style="margin-bottom: 0px;background:#E6E6E6;">已停用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-default btn-xs" style="margin-bottom: 0px;background:#E6E6E6;">已停用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-default btn-xs" style="margin-bottom: 0px;background:#E6E6E6;">已停用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-default btn-xs" style="margin-bottom: 0px;background:#E6E6E6;">已停用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="checkbox_name[]">
                            </td>
                            <td>
                                11
                            </td>
                            <td>
                                达人
                            </td>
                            <td>男</td>
                            <td>16964554564</td>
                            <td>16454646546544545466</td>
                            <td>16964554564@qq.com</td>
                            <td>杭州市西湖区骆家庄</td>
                            <td>2016-12-22</td>
                            <td>
                                <button class="btn btn-default btn-xs" style="margin-bottom: 0px;background:#E6E6E6;">已停用</button>
                            </td>
                            <td class="ding_control">
                                <div>
                                    <a href="">启用</a>
                                    <a href="">编辑</a>
                                    <a href="">修改密码</a>
                                    <a href="" class="del">删除</a>
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
            aa=$('.dataTables-example').DataTable( {
                "columnDefs": [
                    { "sortable": false, "targets": [0,10] }
                ] });
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
/*        //    编辑
        $(".table ").on("click",".ding_control div a.edit",function (e) {
            e.preventDefault();
            var data=aa.row(e).data();
            console.log(data[1])
            var e = $(this).html();
            var t="add_user.html";
            layer_show(e, t, "", "1000", "600")
        })*/
    })(window,document,jQuery,layer);
</script>
</body>
</html>
