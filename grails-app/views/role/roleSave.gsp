 
<!DOCTYPE html>
<html>

<head>
    <title>添加角色</title>
    <meta name="layout" content="dataEdit">
</head>

<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <g:form url="[action:'roleSave',controller:'role']" class="form-horizontal" useToken="true" id="msForm">
					<input type="hidden" name="id" value="${role.id}"  /> 
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">角色:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											   required placeholder="请输入角色名" name="roleName" value="${role.roleName}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入角色名</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">资源:</label>
					        <div class="col-md-10">
					            <div class="row">
					                <div class="col-md-4">
					                    <input id="resourcesText" type="text" class="form-control adduser"  data-ms-tree="resources" value="${role.resources?role.resources*.resourceName.join(","):""}" readonly data-ms-validate data-ms-validate-isnotnull/>
					                    <input type="hidden" data-ms-tree="resourcesId" name="resources" value="${role.resources?role.resources*.id.join(','):''}"  />
					                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
					                </div>
					                <div class="col-md-8">
					                    <span class="add_controlShow help-block">请选择资源</span>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">备注:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<textarea class="form-control" rows="3"    placeholder="请输入备注" name="remark">
										${role.remark}
										</textarea>
									</div>
									 <div class="col-md-8">
									    <span class="add_controlShow help-block">请输入备注</span>
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
    <ul id="resources" class="ztree"></ul>
</div>


<script type="text/javascript">

    $(function(){
        msTreeCheckboxNode("resources","${request.getContextPath()}/public/treeDataForDouble",{domain:"com.ms.base.Model",domain2:"com.ms.base.Resource",select:"${role.resources?role.resources*.id.join(','):''}" });

        //console.log(parent.tab.draw())
        var msForm = $("#msForm").validate();
        $("#referring").click(function(){
            var flag =msForm.formSubmitCheck();
            if(flag){
                var url=$("#msForm").attr("action");
                var data = $('#msForm').serialize();
                actionAjax(url,data,success);
                function success(data){
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
