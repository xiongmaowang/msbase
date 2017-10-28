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
                    <table id="example" class="table table-striped table-bordered table-hover dataTables-example" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th rowspan="2">Name</th>
                            <th colspan="2">HR Information</th>
                            <th colspan="3">Contact</th>
                        </tr>
                        <tr>
                            <th>Position</th>
                            <th>Salary</th>
                            <th>Office</th>
                            <th>Extn.</th>
                            <th>E-mail</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Salary</th>
                            <th>Office</th>
                            <th>Extn.</th>
                            <th>E-mail</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <tr>
                            <td>Tiger Nixon</td>
                            <td>System Architect</td>
                            <td>$320,800</td>
                            <td>Edinburgh</td>
                            <td>5421</td>
                            <td>t.nixon@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Garrett Winters</td>
                            <td>Accountant</td>
                            <td>$170,750</td>
                            <td>Tokyo</td>
                            <td>8422</td>
                            <td>g.winters@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Ashton Cox</td>
                            <td>Junior Technical Author</td>
                            <td>$86,000</td>
                            <td>San Francisco</td>
                            <td>1562</td>
                            <td>a.cox@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Cedric Kelly</td>
                            <td>Senior Javascript Developer</td>
                            <td>$433,060</td>
                            <td>Edinburgh</td>
                            <td>6224</td>
                            <td>c.kelly@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Airi Satou</td>
                            <td>Accountant</td>
                            <td>$162,700</td>
                            <td>Tokyo</td>
                            <td>5407</td>
                            <td>a.satou@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Brielle Williamson</td>
                            <td>Integration Specialist</td>
                            <td>$372,000</td>
                            <td>New York</td>
                            <td>4804</td>
                            <td>b.williamson@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Herrod Chandler</td>
                            <td>Sales Assistant</td>
                            <td>$137,500</td>
                            <td>San Francisco</td>
                            <td>9608</td>
                            <td>h.chandler@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Rhona Davidson</td>
                            <td>Integration Specialist</td>
                            <td>$327,900</td>
                            <td>Tokyo</td>
                            <td>6200</td>
                            <td>r.davidson@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Colleen Hurst</td>
                            <td>Javascript Developer</td>
                            <td>$205,500</td>
                            <td>San Francisco</td>
                            <td>2360</td>
                            <td>c.hurst@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Sonya Frost</td>
                            <td>Software Engineer</td>
                            <td>$103,600</td>
                            <td>Edinburgh</td>
                            <td>1667</td>
                            <td>s.frost@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Jena Gaines</td>
                            <td>Office Manager</td>
                            <td>$90,560</td>
                            <td>London</td>
                            <td>3814</td>
                            <td>j.gaines@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Quinn Flynn</td>
                            <td>Support Lead</td>
                            <td>$342,000</td>
                            <td>Edinburgh</td>
                            <td>9497</td>
                            <td>q.flynn@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Charde Marshall</td>
                            <td>Regional Director</td>
                            <td>$470,600</td>
                            <td>San Francisco</td>
                            <td>6741</td>
                            <td>c.marshall@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Haley Kennedy</td>
                            <td>Senior Marketing Designer</td>
                            <td>$313,500</td>
                            <td>London</td>
                            <td>3597</td>
                            <td>h.kennedy@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Tatyana Fitzpatrick</td>
                            <td>Regional Director</td>
                            <td>$385,750</td>
                            <td>London</td>
                            <td>1965</td>
                            <td>t.fitzpatrick@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Michael Silva</td>
                            <td>Marketing Designer</td>
                            <td>$198,500</td>
                            <td>London</td>
                            <td>1581</td>
                            <td>m.silva@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Paul Byrd</td>
                            <td>Chief Financial Officer (CFO)</td>
                            <td>$725,000</td>
                            <td>New York</td>
                            <td>3059</td>
                            <td>p.byrd@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Gloria Little</td>
                            <td>Systems Administrator</td>
                            <td>$237,500</td>
                            <td>New York</td>
                            <td>1721</td>
                            <td>g.little@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Bradley Greer</td>
                            <td>Software Engineer</td>
                            <td>$132,000</td>
                            <td>London</td>
                            <td>2558</td>
                            <td>b.greer@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Dai Rios</td>
                            <td>Personnel Lead</td>
                            <td>$217,500</td>
                            <td>Edinburgh</td>
                            <td>2290</td>
                            <td>d.rios@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Jenette Caldwell</td>
                            <td>Development Lead</td>
                            <td>$345,000</td>
                            <td>New York</td>
                            <td>1937</td>
                            <td>j.caldwell@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Yuri Berry</td>
                            <td>Chief Marketing Officer (CMO)</td>
                            <td>$675,000</td>
                            <td>New York</td>
                            <td>6154</td>
                            <td>y.berry@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Caesar Vance</td>
                            <td>Pre-Sales Support</td>
                            <td>$106,450</td>
                            <td>New York</td>
                            <td>8330</td>
                            <td>c.vance@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Doris Wilder</td>
                            <td>Sales Assistant</td>
                            <td>$85,600</td>
                            <td>Sidney</td>
                            <td>3023</td>
                            <td>d.wilder@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Angelica Ramos</td>
                            <td>Chief Executive Officer (CEO)</td>
                            <td>$1,200,000</td>
                            <td>London</td>
                            <td>5797</td>
                            <td>a.ramos@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Gavin Joyce</td>
                            <td>Developer</td>
                            <td>$92,575</td>
                            <td>Edinburgh</td>
                            <td>8822</td>
                            <td>g.joyce@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Jennifer Chang</td>
                            <td>Regional Director</td>
                            <td>$357,650</td>
                            <td>Singapore</td>
                            <td>9239</td>
                            <td>j.chang@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Brenden Wagner</td>
                            <td>Software Engineer</td>
                            <td>$206,850</td>
                            <td>San Francisco</td>
                            <td>1314</td>
                            <td>b.wagner@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Fiona Green</td>
                            <td>Chief Operating Officer (COO)</td>
                            <td>$850,000</td>
                            <td>San Francisco</td>
                            <td>2947</td>
                            <td>f.green@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Shou Itou</td>
                            <td>Regional Marketing</td>
                            <td>$163,000</td>
                            <td>Tokyo</td>
                            <td>8899</td>
                            <td>s.itou@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Michelle House</td>
                            <td>Integration Specialist</td>
                            <td>$95,400</td>
                            <td>Sidney</td>
                            <td>2769</td>
                            <td>m.house@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Suki Burks</td>
                            <td>Developer</td>
                            <td>$114,500</td>
                            <td>London</td>
                            <td>6832</td>
                            <td>s.burks@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Prescott Bartlett</td>
                            <td>Technical Author</td>
                            <td>$145,000</td>
                            <td>London</td>
                            <td>3606</td>
                            <td>p.bartlett@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Gavin Cortez</td>
                            <td>Team Leader</td>
                            <td>$235,500</td>
                            <td>San Francisco</td>
                            <td>2860</td>
                            <td>g.cortez@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Martena Mccray</td>
                            <td>Post-Sales support</td>
                            <td>$324,050</td>
                            <td>Edinburgh</td>
                            <td>8240</td>
                            <td>m.mccray@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Unity Butler</td>
                            <td>Marketing Designer</td>
                            <td>$85,675</td>
                            <td>San Francisco</td>
                            <td>5384</td>
                            <td>u.butler@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Howard Hatfield</td>
                            <td>Office Manager</td>
                            <td>$164,500</td>
                            <td>San Francisco</td>
                            <td>7031</td>
                            <td>h.hatfield@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Hope Fuentes</td>
                            <td>Secretary</td>
                            <td>$109,850</td>
                            <td>San Francisco</td>
                            <td>6318</td>
                            <td>h.fuentes@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Vivian Harrell</td>
                            <td>Financial Controller</td>
                            <td>$452,500</td>
                            <td>San Francisco</td>
                            <td>9422</td>
                            <td>v.harrell@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Timothy Mooney</td>
                            <td>Office Manager</td>
                            <td>$136,200</td>
                            <td>London</td>
                            <td>7580</td>
                            <td>t.mooney@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Jackson Bradshaw</td>
                            <td>Director</td>
                            <td>$645,750</td>
                            <td>New York</td>
                            <td>1042</td>
                            <td>j.bradshaw@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Olivia Liang</td>
                            <td>Support Engineer</td>
                            <td>$234,500</td>
                            <td>Singapore</td>
                            <td>2120</td>
                            <td>o.liang@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Bruno Nash</td>
                            <td>Software Engineer</td>
                            <td>$163,500</td>
                            <td>London</td>
                            <td>6222</td>
                            <td>b.nash@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Sakura Yamamoto</td>
                            <td>Support Engineer</td>
                            <td>$139,575</td>
                            <td>Tokyo</td>
                            <td>9383</td>
                            <td>s.yamamoto@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Thor Walton</td>
                            <td>Developer</td>
                            <td>$98,540</td>
                            <td>New York</td>
                            <td>8327</td>
                            <td>t.walton@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Finn Camacho</td>
                            <td>Support Engineer</td>
                            <td>$87,500</td>
                            <td>San Francisco</td>
                            <td>2927</td>
                            <td>f.camacho@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Serge Baldwin</td>
                            <td>Data Coordinator</td>
                            <td>$138,575</td>
                            <td>Singapore</td>
                            <td>8352</td>
                            <td>s.baldwin@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Zenaida Frank</td>
                            <td>Software Engineer</td>
                            <td>$125,250</td>
                            <td>New York</td>
                            <td>7439</td>
                            <td>z.frank@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Zorita Serrano</td>
                            <td>Software Engineer</td>
                            <td>$115,000</td>
                            <td>San Francisco</td>
                            <td>4389</td>
                            <td>z.serrano@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Jennifer Acosta</td>
                            <td>Junior Javascript Developer</td>
                            <td>$75,650</td>
                            <td>Edinburgh</td>
                            <td>3431</td>
                            <td>j.acosta@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Cara Stevens</td>
                            <td>Sales Assistant</td>
                            <td>$145,600</td>
                            <td>New York</td>
                            <td>3990</td>
                            <td>c.stevens@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Hermione Butler</td>
                            <td>Regional Director</td>
                            <td>$356,250</td>
                            <td>London</td>
                            <td>1016</td>
                            <td>h.butler@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Lael Greer</td>
                            <td>Systems Administrator</td>
                            <td>$103,500</td>
                            <td>London</td>
                            <td>6733</td>
                            <td>l.greer@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Jonas Alexander</td>
                            <td>Developer</td>
                            <td>$86,500</td>
                            <td>San Francisco</td>
                            <td>8196</td>
                            <td>j.alexander@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Shad Decker</td>
                            <td>Regional Director</td>
                            <td>$183,000</td>
                            <td>Edinburgh</td>
                            <td>6373</td>
                            <td>s.decker@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Michael Bruce</td>
                            <td>Javascript Developer</td>
                            <td>$183,000</td>
                            <td>Singapore</td>
                            <td>5384</td>
                            <td>m.bruce@datatables.net</td>
                        </tr>
                        <tr>
                            <td>Donna Snider</td>
                            <td>Customer Support</td>
                            <td>$112,000</td>
                            <td>New York</td>
                            <td>4226</td>
                            <td>d.snider@datatables.net</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
    var dataObj233={
        columns :[{"data":"id","name":"id","visible":false,"searchable":false},{"data":"configAttribute","name":"configAttribute","orderable":true,"visible":true,"searchable":true,"type":"string"},{"data":"url","name":"url","orderable":true,"visible":true,"searchable":true,"type":"string"}],
        defaultSort :[],
        ajaxData :'{"htmlEncode":[true,true,true],"orderTarget":["","",""]}'
    }

</script>
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
        $('#example').DataTable( {
            columns:[
                {visible:false},
                    null,null,null,null,null
            ]
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