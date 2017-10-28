 
<!DOCTYPE html>
<html>

<head>
    <title>添加用户</title>
    <meta name="layout" content="dataEdit">
</head>

<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <g:form url="[action:'userSave',controller:'user']" class="form-horizontal" useToken="true" id="msForm">
					<input type="hidden" name="id" value="${user.id}"  /> 
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">用户名:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											   required placeholder="请输入用户名" name="username" value="${user.username}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入用户名</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">密码:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
									    <input type="password" class="form-control addpwd" data-ms-validate  
									     data-ms-validate-isnotnull  placeholder="请输入密码" name="password" value="${user.password}">
									    <span class="glyphicon glyphicon-eye-open form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
									       <span class="add_controlShow help-block">请输入密码</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">请再次输入密码:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
									    <input type="password" class="form-control addpwd" data-ms-validate  
									     data-ms-validate-isnotnull  placeholder="请再次输入密码" name="password2" value="${user.password}">
									    <span class="glyphicon glyphicon-eye-open form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
									       <span class="add_controlShow help-block">请再次输入密码</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">中文名:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											   required placeholder="请输入中文名" name="chinaName" value="${user.chinaName}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入中文名</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">角色:</label>
					        <div class="col-md-10">
					            <div class="row">
					                <div class="col-md-4">
					                    <input id="rolesText" type="text" class="form-control adduser"  data-ms-tree="roles" value="${user.roles?user.roles*.roleName.join(","):""}" readonly data-ms-validate data-ms-validate-isnotnull/>
					                    <input type="hidden" data-ms-tree="rolesId" name="roles" value="${user.roles?user.roles*.id.join(','):''}"  />
					                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
					                </div>
					                <div class="col-md-8">
					                    <span class="add_controlShow help-block">请选择角色</span>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">部门:</label>
					        <div class="col-md-10">
					            <div class="row">
					                <div class="col-md-4">
					                    <input id="departsText" type="text" class="form-control adduser"  data-ms-tree="departsTree" value="${user.departs?(user.departs*.departName.join(",")):""}" readonly data-ms-validate data-ms-validate-isnotnull />
					                    <input type="hidden" data-ms-tree="departsTreeId" name="departs" value="${user.departs?user.departs*.id.join(','):''}"  />
					                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
					                </div>
					                <div class="col-md-8">
					                    <span class="add_controlShow help-block">请选择部门</span>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>

                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <button class="btn btn-info" type="button" id="referring">立即提交</button>
                                <button class="btn btn-success" type="reset" style="margin-left:20px;">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

<div style="display: none; background:#fff; border:1px solid #ccc;">
    <ul id="roles" class="ztree"></ul>
</div>


<div style="display: none; background:#fff; border:1px solid #ccc;">
    <ul id="departsTree" class="ztree"></ul>
</div>


<script type="text/javascript">

    $(function(){
	
	msTreeCheckbox("roles","${request.getContextPath()}/public/select",{domain:"com.ms.base.Role",select:"${user.roles?user.roles*.id.join(','):''}" });
	msTreeCheckbox("departsTree","${request.getContextPath()}/public/selectTree",{domain:"com.ms.base.Depart",select:"${user.departs?user.departs*.id.join(','):''}" });

        //console.log(parent.tab.draw())
        var msForm = $("#msForm").validate();
        $("#referring").click(function(){
            var flag =msForm.formSubmitCheck();
            if(flag){
                var url=$("#msForm").attr("action");
                var data = $('#msForm').serialize();
                actionAjax(url,data,success);
                function success(data){
                    if(data.username){
                        ms.msg("已有用户名"+data.username+" 请重新输入其他用户名")
						return;
					}
                    if(data.result){
                        ms.msg("成功",1,1000);//成功  1   失败 2
                        setTimeout(function(){
                            parent.tab.draw(false); //刷新父页面
                            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                            parent.layer.close(index);  // 关闭layer
                        },1000);
                    }else{
                        ms.msg("失败",2,2000);//成功  1   失败 2
                    }
                }
            }

        });
    });
</script>
</body>
</html>
