 
<!DOCTYPE html>
<html>

<head>
    <title>添加P</title>
    <meta name="layout" content="dataEdit">
</head>

<body>
<!--字体的样式文件-->
<asset:link href="font-awesome.css" rel="stylesheet"/>
<!--dataTable样式-->
<asset:link href="plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
<!--datatablesEditor -->
<asset:link href="plugins/dataTables/buttons.bootstrap.min.css" rel="stylesheet"/>
<asset:link href="plugins/dataTables/select.bootstrap.min.css" rel="stylesheet"/>
<asset:link href="plugins/dataTables/editor/editor.bootstrap.min.css" rel="stylesheet"/>

<style>
.form-inline{
    margin-bottom: 10px;
}
.form-group{
    margin-right:8px;
}
.btn.find ,.btn.set{
    margin-top:6px;
    margin-left: 10px;
}
.ding_control{
    background:url(${request.getContextPath()}/assets/biao_xuan.png) no-repeat center;
    position:relative;
}
.ding_control:hover div{
    display:block;
}
.ding_control div{
    position: absolute;
    right:0;
    top:0px;
    min-width: 800px;
    z-index:999;
    display:none;
}
.ding_control div a{
    display:inline-block;
    font-size:16px;
    padding:8px 14px;
    float:right;
    padding-top:6px;
    background:#4E6CA3;
    color:#fff;
}
.ding_control div a:hover{
    color:#27C24C;
}
</style>

<!-- Data Tables插件的js -->
<asset:javascript src="plugins/dataTables/jquery.dataTables.min2.js"/>
<asset:javascript src="plugins/dataTables/dataTables.bootstrap.min.js"/>
<asset:javascript src="plugins/dataTables/defaultSetting.js"/>
<!-- talbeEditor-->
<asset:javascript src="plugins/dataTables/editor/dataTables.buttons.min.js"/>
<asset:javascript src="plugins/dataTables/editor/buttons.bootstrap.min.js"/>
<asset:javascript src="plugins/dataTables/editor/dataTables.select.min.js"/>
<asset:javascript src="plugins/dataTables/editor/dataTables.editor.min.js"/>
<asset:javascript src="plugins/dataTables/editor/editor.bootstrap.min.js"/>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <g:form url="[action:'testPSave',controller:'testP']" class="form-horizontal" useToken="true" id="msForm">
					<input type="hidden" name="id" value="${testP.id}"  /> 
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">中文名:</label>
					        <div class="col-md-10">
					            <div class="row">
					                <div class="col-md-4">
					                    <g:select value="${testP.testPName}" name="testPName" optionKey="id" optionValue="cnm" class="form-control"
					                              from="${com.ms.base.DictParam.createCriteria().list{eq("parent.id","1") eq("enabled",true)}}"  noSelection="['':'--请选择--']"/>
					                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
					                </div>
					                <div class="col-md-8">
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
										     data-ms-validate-integral placeholder="请输入testPInt" name="testPInt" value="${testP.testPInt}">
										    <span class="glyphicon glyphicon-envelope form-control-feedback" style="color:#23B7E5;"></span>
										</div>
										<div class="col-md-8">
										    <span class="add_controlShow help-block">请输入testPInt</span>
										</div>
									</div>
							   </div>
						   </div>
					</div>
					
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">testPBol:</label>
					        <div class="col-sm-10">
								<div class="row">
								    <div class="col-md-4">
								        <div class="row">
											<g:radioGroup name="testPBol" values="[true,false]" value="${testP.testPBol}" labels="['是','否']" >
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
					          <label class="col-md-2 control-label">content:</label>
					          <div class="col-md-10">
								<div class="row">
									<div class="col-md-4">
										<textarea class="form-control" rows="3"    placeholder="请输入content" name="content">
										${testP.content}
										</textarea>
									</div>
									 <div class="col-md-8">
									    <span class="add_controlShow help-block">请输入content</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group has-default has-feedback">
					    <div class="form-group">
					        <label class="col-md-2 control-label">att:</label>
					        <div class="col-md-10">
					            <div class="row">
					                <div class="col-md-4">
					                    <input  type="text" class="form-control adduser"  data-ms-tree="att" value="${testP.att}" readonly data-ms-validate data-ms-validate-isnotnull />
					                    <input type="hidden" data-ms-tree="attId" name="att.id" value="${testP.att?testP.att.id:''}" />
					                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
					                </div>
					                <div class="col-md-8">
					                    <span class="add_controlShow help-block">请选择att</span>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					<div class="ibox float-e-margins">
					    <div class="ibox-content">
					        <!--搜索条件-->
					        <div class="form-inline" role="form">
					            <div class="pull-right" style="margin-top: 8px;">
					                <button class="btn btn-danger btn-md batch-del" style="margin-right:10px;" type="button">
					                    <span class="fa fa-edit"></span>
					                    批量删除
					                </button>
					                <button class="btn btn-success btn-md" id="addRow" type="button">
					                    <span class="fa fa-plus"></span>
					                    添加一条</button>
					            </div>
					        </div>
					        <table id="testCs"
					               class="table table-striped table-bordered table-hover dataTables-example dataTable no-footer"
					               cellspacing="0" width="100%">
					            <thead>
					            <tr>
					                <th>序号</th>
					                <th style="width: 30px;text-align: center;"><input type="checkbox" class="check_control"></th>
					            </tr>
					            </thead>
					            <tbody>
					                <g:each in="${testP.testCs}" var="it" status="status">
					                    <tr>
					                        <td>${status}</td>
					                        <td><input style="width: 30px;text-align: center;" type="checkbox" name="checkbox_name[]"></td>
					                        <!--要显示的字段(另外加) -->
					                    </tr>
					                </g:each>
					            </tbody>
					        </table>
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
		msTreeInput("att","${request.getContextPath()}/public/select",{domain:"com.ms.file.AttachMent"});
		var testCscount = ${testP.testCs?.size()?:0}
		//初始化editor
		testCseditor = new $.fn.dataTable.Editor({
		    //重写请求方法(拦截)
		    ajax: function(method, url, data, success, error) {
		    if (data.action === 'edit') {
		        out = {data: []};
		        $.each(data.data, function (key, val) {
		            var oldObj
		            var datas = testCsObj.data()
		            for (var i = 0; i < datas.length; i++) {
		                if (datas[i]["DT_RowId"] == key) {
		                    oldObj = datas[i]
		                    break;
		                }
		            }
		            out.data.push($.extend(oldObj, val));
		        });
		        success(out);
		    }
		},
		    table: "#testCs",
		    //要编辑的字段(要另外加)
		    fields: [
		
		     ]
		    });
		$('#testCs').on('click', 'tbody td:not(:first-child)', function (e) {
		    testCseditor.inline(this, {
		        onBlur: "submit"
		    });
		});
		//初始化DataTable
		testCsObj = $('#testCs').DataTable({
		            "ordering": false,
		            //datatables的字段(要另外加)
		            dom: 'tip',
		            columns: [
		                {data: "DT_RowId", visible: false},
		                {data: "multiSelect"}
		            ]
		        });
		//添加方法
		$('#addRow').on('click', function () {
		    testCscount++
		    //要添加的字段(要另外加)
		    var addObj = {
		        DT_RowId: testCscount,
		        multiSelect: '<input style="width: 30px;text-align: center;" type="checkbox" name="checkbox_name[]">'
		    }
		    testCsObj.row.add(addObj).draw(false);
		})
		//多选
		multiSelectInit(testCsObj)
		batchDelByEditInit(testCsObj)

        //console.log(parent.tab.draw())
        var msForm = $("#msForm").validate();
        $("#referring").click(function(){
            var flag =msForm.formSubmitCheck();
            if(flag){
                var url=$("#msForm").attr("action");
                var data = $('#msForm').serialize();
				testCseditor.submit();
				var datas=testCsObj.data();
				if(testCsObj.data().length>0){
				    var result={};
				    $.each(datas, function(index,val) {
				        $.each(val,function(name,value){
				            if(name!="multiSelect"&&name!="DT_RowId"&&value&&value!=""){
				                result["testCs"+"["+index+"]."+name]=value;
				            }
				        })
				    });
				    data=$.param(result)+"&"+data;
				}

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
