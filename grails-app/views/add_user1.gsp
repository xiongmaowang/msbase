<!DOCTYPE html>
<html>

<head>
    <title>添加用户</title>
    <meta name="layout" content="dataEdit">
    <asset:link href="datepicker/bootstrap-datetimepicker.min3.css" rel="stylesheet"/>
    <asset:javascript  src="datepicker/bootstrap-datetimepicker.min.gai.js"/>
</head>

<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <form action="#" method="post" class="form-horizontal">
                	<div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">日期选择器(精确到 时分):</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="input-append date" id="datetimepicker"  data-date-format="yyyy-mm-dd hh:ii" >
									        <input  type="text" name="time2" value="2016-12-5 00:00" readonly class="form-control" id="datetime2"/>
									        <span class="glyphicon glyphicon-time form-control-feedback text-primary"></span>
									        <span class="add-on"><i class="icon-th"></i></span>
									    </div>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请输入时间</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                	<div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">多行文本框:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
										<textarea class="form-control" rows="3" placeholder="请输入文本"></textarea>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请输入文本</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">用&nbsp;户&nbsp;&nbsp;名:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="text" class="form-control adduser" data-ms-validate data-ms-validate-max="30" data-ms-validate-min="6"
                                        	required placeholder="请输入用户名" maxlength="16" minlength="6" name="adduser">
                                        <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请输入长度为6-8位的用户名(只能由大小写字母、数字、中文、下划线组成)</span>
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
                                        <input type="password" class="form-control addpwd" data-ms-validate  required placeholder="请输入密码" name="addpwd">
                                        <span class="glyphicon glyphicon-eye-open form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">密码长度为4-16位的大小写字母、数字、中文、下划线组成</span>
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
                                        <input type="password" class="form-control addpwd2" data-ms-validate required placeholder="请确认密码" name="addpwd2">
                                        <span class="glyphicon glyphicon-eye-open form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请重新输入密码</span>
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
                                        <input type="tel" class="form-control addphone" data-ms-validate data-ms-validate-phone required placeholder="请输入手机号码" maxlength="11" 
                                        name="addphone"/>
                                        <span class="glyphicon glyphicon-phone form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请输入正确的手机号码</span>
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
                                                <select name=""   class="form-control" data-ms-validate-select>
                                                    <option value="" selected>辽宁省</option>
                                                    <option value="">浙江省</option>
                                                    <option value="">广东省</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <select name=""  class="form-control" data-ms-validate-select>
                                                    <option value="" selected>辽宁省</option>
                                                    <option value="">浙江省</option>
                                                    <option value="">广东省</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <select name=""  class="form-control">
                                                	<option value="" selected>请选择</option>
                                                    <option value="">辽宁省</option>
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
                                        <input type="text" class="form-control addid" data-ms-validate data-ms-validate-idcard required placeholder="请输入身份证号码" name="addid">
                                        <span class="glyphicon glyphicon-edit form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请输入正确的身份证号码</span>
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
                                        <input type="tel" class="form-control addemail" data-ms-validate data-ms-validate-email data-ms-validate-min="10" data-ms-validate-max="20" required placeholder="请输入邮箱" name="addemail">
                                        <span class="glyphicon glyphicon-envelope form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请输入正确的邮箱</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">小数校验:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="tel" class="form-control addemail" data-ms-validate data-ms-validate-small="5" required placeholder="请输入y" name="addemail">
                                        <span class="glyphicon glyphicon-envelope form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请输入正确的小数</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">字符位数校验:</label>
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="tel" class="form-control addemail" data-ms-validate  data-ms-validate-min="2" data-ms-validate-max="5" required placeholder="" name="addemail">
                                        <span class="glyphicon glyphicon-envelope form-control-feedback" style="color:#23B7E5;"></span>
                                    </div>
                                    <div class="col-md-8">
                                        <span class="add_controlShow help-block">请输入2-5位</span>
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
                                    <!--<div class="col-md-8">-->
                                        <!--<span class="help-block add_controlShow">你输入的信息正确</span>-->
                                    <!--</div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group has-default has-feedback">
                        <div class="form-group">
                            <label class="col-md-2 control-label">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否:</label>
                            <div class="col-sm-10">
	                            <div class="row">
	                               <div class="col-md-4">
	                                   <div class="row">
											<g:radioGroup name="${name}" values="[true,false]" value="true" labels="['是','否']" >
												<div class="<g:if test='${it.label=='是'}'>col-md-2 col-md-offset-2</g:if><g:else>col-md-4</g:else>">
												 	<label class="radio inline">
														${it.radio} <g:message code="${it.label}"/>
													</label>
			                                    </div>
											</g:radioGroup>
										</div>
									</div>
								</div>
							</div>
                        </div>
                    </div>
                    
                   <div class="form-group has-default has-feedback">
                   <div class="form-group">
                    	<ueditor:resources/>
                    	<ueditor:editor id="editor" style="height:360px;">Hello World</ueditor:editor>
   						<ueditor:config var="toolbars" value="compact"/>
   						</div>
                    </div>
                    
                    
                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <button class="btn btn-info" type="button" id="referring">立即提交</button>
                            <button class="btn btn-success" type="reset" style="margin-left:20px;">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
var form = $("form.form-horizontal").validate();
$("#referring").click(function(){
    var flag =form.formSubmitCheck();
    console.log(flag);

});


$(function () {
    $('#datetimepicker').datetimepicker({
        minView: "hour",
        autoclose:true,
        todayBtn: true,
        pickerPosition: "center",
        todayHighlight: true,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        bootcssVer:2,
        language:  'zh'              //设置时间控件为中文
    });
})
</script>
<body>
</html>
