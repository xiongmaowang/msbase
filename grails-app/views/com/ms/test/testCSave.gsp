 
<!DOCTYPE html>
<html>

<head>
    <title>添加C</title>
    <meta name="layout" content="dataEdit">
</head>

<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <g:form url="[action:'testCSave',controller:'testC']" class="form-horizontal" useToken="true" id="msForm">
					<input type="hidden" name="id" value="${testC.id}"  /> 
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">testA:</label>
					        <div class="col-md-10">
					            <div class="row">
					                <div class="col-md-4">
					                    <input  type="text" class="form-control adduser"  data-ms-tree="testP" value="${testC.testP}" readonly data-ms-validate data-ms-validate-isnotnull />
					                    <input type="hidden" data-ms-tree="testPId" name="testP.id" value="${testC.testP?testC.testP.id:''}" />
					                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
					                </div>
					                <div class="col-md-8">
					                    <span class="add_controlShow help-block">请选择testA</span>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">testCName:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											   required placeholder="请输入testCName" name="testCName" value="${testC.testCName}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入testCName</span>
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
	msTreeInput("testP","${request.getContextPath()}/public/select",{domain:"com.ms.test.TestP"});

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
