 
<!DOCTYPE html>
<html>

<head>
    <title>添加资源</title>
    <meta name="layout" content="dataEdit">
</head>

<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <g:form url="[action:'resourceSave',controller:'resource']" class="form-horizontal" useToken="true" id="msForm">
					<input type="hidden" name="id" value="${resource.id}"  /> 
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">资源名:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											   placeholder="请输入资源名" name="resourceName" value="${resource.resourceName}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入资源名</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">模块:</label>
					        <div class="col-md-10">
					            <div class="row">
					                <div class="col-md-4">
					                    <input type="text" class="form-control adduser"  data-ms-tree="modelTree" value="${resource.model?.modelName}" readonly  />
					                    <input type="hidden" data-ms-tree="modelTreeId" name="model.id" value="${resource.model?.id}" />
					                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
					                </div>
					                <div class="col-md-8">
					                    <span class="add_controlShow help-block">请选择模块</span>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">URL:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser"
											   required placeholder="请输入URL" name="url" value="${resource.url}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入URL</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">控制器名称:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser"
											   required placeholder="请输入控制器名称" name="controllerName" value="${resource.controllerName}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入控制器名称</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">序号:</label>
					          <div class="col-md-10">
									<div class="row">
										<div class="col-md-4">
										    <input type="tel" class="form-control addemail" data-ms-validate  data-ms-validate-isnotnull
										     data-ms-validate-integral placeholder="请输入序号" name="serialNo" value="${resource.serialNo}">
										    <span class="glyphicon glyphicon-envelope form-control-feedback" style="color:#23B7E5;"></span>
										</div>
										<div class="col-md-8">
										    <span class="add_controlShow help-block">请输入序号</span>
										</div>
									</div>
							   </div>
						   </div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">imgClass:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											   required placeholder="请输入imgClass" name="imgClass" value="${resource.imgClass}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入imgClass</span>
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

<script type="text/javascript">

    $(function(){
	msTreeInput("modelTree","${request.getContextPath()}/public/selectTree",{domain:"com.ms.base.Model"});

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
