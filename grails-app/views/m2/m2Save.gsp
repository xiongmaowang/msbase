 
<!DOCTYPE html>
<html>

<head>
    <title>添加m2</title>
    <meta name="layout" content="dataEdit">
</head>

<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <g:form url="[action:'m2Save',controller:'m2']" class="form-horizontal" useToken="true" id="msForm">
					<input type="hidden" name="id" value="${m2.id}"  /> 
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">m1s:</label>
					        <div class="col-md-10">
					            <div class="row">
					                <div class="col-md-4">
					                    <input id="m1sText" type="text" class="form-control adduser"  data-ms-tree="m1s" value="${m2.m1s}" readonly data-ms-validate data-ms-validate-isnotnull/>
					                    <input type="hidden" data-ms-tree="m1sId" name="m1s" value="${m2.m1s?m2.m1s*.id.join(','):''}"  />
					                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
					                </div>
					                <div class="col-md-8">
					                    <span class="add_controlShow help-block">请选择m1s</span>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					
					<div class="form-group has-default has-feedback">
					      <div class="form-group">
					          <label class="col-md-2 control-label">m2Name:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<input type="text" class="form-control adduser" data-ms-validate data-ms-validate-isnotnull
											   required placeholder="请输入m2Name" name="m2Name" value="${m2.m2Name}">
										<span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
									</div>
									<div class="col-md-8">
										<span class="add_controlShow help-block">请输入m2Name</span>
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
    <ul id="m1s" class="ztree"></ul>
</div>


<script type="text/javascript">

    $(function(){
	msTreeCheckbox("m1s","${request.getContextPath()}/public/select",{domain:"com.ms.test.M1",select:"${m2.m1s?m2.m1s*.id.join(','):''}" });

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
