<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="dataEdit">
    <asset:javascript  src="tree/jquery.ztree.all.min.js"/>
    <style>
        .help-block.add_controlShow{
           color:#f00;
        }
    </style>
</head>
<body>
<div>
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <form action="" class="form-horizontal">
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">用&nbsp;户&nbsp;&nbsp;名:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="text" class="form-control adduser" required placeholder="请输入用户名" maxlength="16" minlength="6" name="adduser">
                                        <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="help-block add_controlShow">请输入长度为6-8位的用户名(只能由大小写字母、数字、中文、下划线组成)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="password" class="form-control addpwd" required placeholder="请输入密码" name="addpwd">
                                        <span class="glyphicon glyphicon-eye-open form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="help-block add_controlShow">密码长度为4-16位的大小写字母、数字、中文、下划线组成</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">确认密码:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="password" class="form-control addpwd2" required placeholder="请确认密码" name="addpwd2">
                                        <span class="glyphicon glyphicon-eye-open form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="help-block add_controlShow">请重新输入密码</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">手&nbsp;机&nbsp;&nbsp;号:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="tel" class="form-control addphone" required placeholder="请输入手机号码" name="addphone">
                                        <span class="glyphicon glyphicon-phone form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="help-block add_controlShow">请输入正确的手机号码</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default">
                        <div class="form-group">
                            <label class="col-md-2 control-label">选择地址:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <select name=""   class="form-control">
                                                    <option value="" selected>辽宁省</option>
                                                    <option value="">浙江省</option>
                                                    <option value="">广东省</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <select name=""  class="form-control">
                                                    <option value="" selected>辽宁省</option>
                                                    <option value="">浙江省</option>
                                                    <option value="">广东省</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <select name=""  class="form-control">
                                                    <option value="" selected>辽宁省</option>
                                                    <option value="">浙江省</option>
                                                    <option value="">广东省</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!--<div class="col-md-4">-->
                                    <!--<span class="help-block add_controlShow">你输入的信息正确</span>-->
                                    <!--</div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">身份证号:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="text" class="form-control addid" required placeholder="请输入身份证号码" name="addid">
                                        <span class="glyphicon glyphicon-edit form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="help-block add_controlShow">请输入正确的身份证号码</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="tel" class="form-control addemail" required placeholder="请输入邮箱" name="addemail">
                                        <span class="glyphicon glyphicon-envelope form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="help-block add_controlShow">请输入正确的邮箱</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-2 col-md-offset-2">
                                                <label class="radio inline">
                                                    <input type="radio" name="optionsRadios" value="option1" checked >
                                                    男
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="radio inline">
                                                    <input type="radio" name="optionsRadios"  value="option2">
                                                    女
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
                            <div class="col-md-10">
                                <input id="text1" type="text" data-ms-tree="treeDemo"/>
                                <button type="button">获取选中值的id</button>
                            </div>
                        </div>
                    </div>




                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <button class="btn btn-info" type="submit">立即提交</button>
                            <button class="btn btn-success" style="margin-left:20px;">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    //msTreeInput(treeId,url),该方法有两个参数，treeId对应自定义属性data-ms-tree后的容器名称。
    //url：地址为后台获取数据的地址
    msTreeInput("treeDemo","${request.getContextPath()}/table/aaa");
    $("button[type='button']").click(function(){
        //方法getInputCode()用于获取选中地区的id，需要参数treeId
        var id = getInputCode("treeDemo");//获取选中地址的id
        var value = $("input[data-ms-tree='treeDemo']").val();//获取选中地址的value
        alert("选中地址的id："+id+",value:"+value);
    });
</script>
<!-- 全局js -->
<script>
function vali(name,flag,icon,t1,t2){
//    错误样式的函数定义
    if(flag){
        $("."+name).next("span").removeClass(icon+" glyphicon-remove").addClass("glyphicon-ok").css("color","#27C24C");
        $("."+name).parents(".form-group").removeClass("has-default has-error").addClass("has-success");
        $("."+name).parents(".form-group").find(".add_controlShow").removeClass("add_controlShow").html(t1);
    }else{
        $("."+name).next("span").removeClass( icon+" glyphicon-ok").addClass("glyphicon-remove").css("color","#ED5565");
        $("."+name).parents(".form-group").removeClass("has-default has-success").addClass("has-error");
        $("."+name).parents(".form-group").find(".add_controlShow").removeClass("add_controlShow").html(t2);
    }
}
 //    获得焦点的提示框
function change(name,text,icon) {
    $("."+name).next("span").removeClass("glyphicon-remove").addClass(icon).css("color","#23B7E5");
    $("."+name).parents(".form-group").removeClass("has-error");
    $("."+name).parents(".form-group").find(".help-block").addClass("add_controlShow").html(text)
}
//    错误和正确的函数
function check(name){
    switch(name){
        case "adduser":
            var user_val=$("."+name).val();
            var user_pattern= /^[0-9a-zA-z_]+$/;
            var user_flag = user_pattern.test(user_val);
            user_flag==false||user_val==""||user_val==null||!(user_val.length>=4&&user_val.length<=10)
                ?vali(name,0,'glyphicon-user','正确','用户名错误'):vali(name,1,'glyphicon-user','正确','用户名格式错误');
            break;
        case "addpwd":
             pwd_val=$("."+name).val();
            var pwd_pattern= /^[0-9a-zA-z_]+$/;
            var pwd_flag = pwd_pattern.test(pwd_val);
            pwd_flag==false||pwd_val==""||pwd_val==null||!(pwd_val.length>=4&&pwd_val.length<=16)
                ?vali(name,0,'glyphicon-eye-open','正确','密码格式错误或密码不能为空'):vali(name,1,'glyphicon-eye-open','正确','密码格式错误或密码不能为空');
            break;
        case "addpwd2":
            var pwd_val2=$("."+name).val();
            pwd_val2!==pwd_val||pwd_val2==""||pwd_val2==null
                ?vali(name,0,'glyphicon-eye-open','正确','两次输入的不一致或密码不能为空'):vali(name,1,'glyphicon-eye-open','正确','两次输入的不一致或密码不能为空');
            break;
        case "addphone":
            var pho_val=$("."+name).val();
            var pho_pattern= /(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7}/;
            var pho_flag = pho_pattern.test(pho_val);
            pho_flag==false||pwd_val2==""||pwd_val2==null
                ?vali(name,0,'glyphicon-phone','正确','手机格式不正确'):vali(name,1,'glyphicon-phone','正确','手机格式不正确');
            break;
        case "addid":
            var id_val=$("."+name).val();
            var id_pattern= /\d{15}|\d{17}[0-9Xx]/;
            var id_flag = id_pattern.test(id_val);
            id_flag==false||id_val==""||id_val==null
                ?vali(name,0,'glyphicon-edit','正确','身份证格式不正确'):vali(name,1,'glyphicon-edit','正确','身份证格式不正确');
            break;
        case "addemail":
            var email_val=$("."+name).val();
            var email_pattern= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            var email_flag = email_pattern.test(email_val);
            email_flag==false||email_val==""||email_val==null
                ?vali(name,0,'glyphicon-envelope','正确','邮箱格式不正确'):vali(name,1,'glyphicon-envelope','正确','邮箱证格式不正确');
            break;
    }
}
//失去获得焦点事件
    $("input[name^='add']").each(function(i,v){
        var me=$(this);
        var item_id=me.attr("class").split(" ")[1]+"";
        var text=me.parents(".form-group").find(".help-block").text();
        var icon=me.parents(".form-group").find(".glyphicon").attr("class").split(" ")[1]+"";
        $(v).on("blur",function(){
          check(item_id);
        })
        $(v).on("focus",function(){
         change(item_id,text,icon);
        })
    })
    function add(){
        alert(1)
    }
</script>
</body>
</html>
