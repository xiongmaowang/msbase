 
<!DOCTYPE html>
<html>

<head>
    <title>添加A</title>
    <meta name="layout" content="dataEdit">
</head>

<body>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <g:form url="[action:'testASave',controller:'testA']" class="form-horizontal" useToken="true" id="msForm">
					<input type="hidden" name="id" value="${testA.id}"  /> 
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">testAName:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											    placeholder="请输入testAName" name="testAName" value="${testA.testAName}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入testAName</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">testPName:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											    placeholder="请输入testPName" name="testP.testPName" value="${testA.testP?.testPName}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入testPName</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">testPInt:</label>
					          <div class="col-md-10">
									<div class="row">
										<div class="col-md-4">
										    <input type="tel" class="form-control addemail" data-ms-validate  data-ms-validate-isnotnull
										     data-ms-validate-integral placeholder="请输入testPInt" name="testP.testPInt" value="${testA.testP?.testPInt}">
										    <span class="glyphicon glyphicon-envelope form-control-feedback" style="color:#23B7E5;"></span>
										</div>
										<div class="col-md-8">
										    <span class="add_controlShow help-block">请输入testPInt</span>
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
