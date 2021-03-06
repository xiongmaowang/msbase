<g:form url="[action:'dictParamSave',controller:'dictParam']"
	useToken="true" id="mf" class="form-horizontal">
	<!-- 下面4个是插件默认带的 -->
	<div class="form-group has-default has-feedback">
		<div class="form-group">
			<label class="col-md-2 control-label">上级代码:</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<input type="text" data-ms-tree-operate-pname readonly="readonly"
							value="${model?.parent?.id }" class="form-control" placeholder="">
						<span class="glyphicon glyphicon-envelope form-control-feedback"
							style="color: #23B7E5;"></span>
					</div>
					<div class="col-md-8">
						<span class="add_controlShow help-block"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group has-default has-feedback">
		<div class="form-group">
			<label class="col-md-2 control-label">代码:</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<input type="text" data-ms-tree-operate-name name="id"
							readonly="readonly" value="${model?.id }" class="form-control"
							data-ms-validate data-ms-validate-isnotnull placeholder="">
						<span class="glyphicon glyphicon-envelope form-control-feedback"
							style="color: #23B7E5;"></span>
					</div>
					<div class="col-md-8">
						<span class="add_controlShow help-block">不能为空</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 当前id -->
	<div class="form-group has-default has-feedback" style="display: none;">
		<div class="form-group">
			<label class="col-md-2 control-label">当前id</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<input type="text" data-ms-tree-operate-id name=""
							value="${model?.id }" readonly="readonly" class="form-control"
							placeholder=""> <span
							class="glyphicon glyphicon-envelope form-control-feedback"
							style="color: #23B7E5;"></span>
					</div>
					<div class="col-md-8">
						<span class="add_controlShow help-block"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 当前pid(父级id) -->
	<div class="form-group has-default has-feedback" style="display: none;">
		<div class="form-group">
			<label class="col-md-2 control-label">pid(父级id):</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<input type="text" data-ms-tree-operate-pid name="pid"
							value="${model?.parent?.id}" readonly="readonly"
							class="form-control" placeholder=""> <span
							class="glyphicon glyphicon-envelope form-control-feedback"
							style="color: #23B7E5;"></span>
					</div>
					<div class="col-md-8">
						<span class="add_controlShow help-block"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加自己的属性标签 -->
	<div class="form-group has-default has-feedback">
		<div class="form-group">
			<label class="col-md-2 control-label">中文名称:</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<input type="text" data-ms-tree-operate-cnm name="cnm"
							value="${model?.cnm }" class="form-control" data-ms-validate
							data-ms-validate-isnotnull placeholder=""> <span
							class="glyphicon glyphicon-envelope form-control-feedback"
							style="color: #23B7E5;"></span>
					</div>
					<div class="col-md-8">
						<span class="add_controlShow help-block">不能为空</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group has-default has-feedback">
		<div class="form-group">
			<label class="col-md-2 control-label">英文名称:</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<input type="text" data-ms-tree-operate-enm name="enm"
							value="${model?.enm }" class="form-control" data-ms-validate
							data-ms-validate-isnotnull placeholder=""> <span
							class="glyphicon glyphicon-envelope form-control-feedback"
							style="color: #23B7E5;"></span>
					</div>
					<div class="col-md-8">
						<span class="add_controlShow help-block">不能为空</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group has-default has-feedback">
		<div class="form-group">
			<label class="col-md-2 control-label">是否有效:</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-4 col-md-offset-2">
								<label class="radio inline">
									<input type="radio" name="enabled" value="true" <g:if test='${model?.enabled}'>checked</g:if>> 是
								</label>
							</div>
							<div class="col-md-4">
								<label class="radio inline">
									<input type="radio" name="enabled" value="false" <g:if test='${!model?.enabled}'>checked</g:if>> 否
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
			<label class="col-md-2 control-label">备注:</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<input type="text" data-ms-tree-operate-remark name="remark"
							value="${model?.remark }" class="form-control" data-ms-validate
							data-ms-validate-isnotnull placeholder=""> <span
							class="glyphicon glyphicon-envelope form-control-feedback"
							style="color: #23B7E5;"></span>
					</div>
					<div class="col-md-8">
						<span class="add_controlShow help-block">不能为空</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group has-default has-feedback">
		<div class="form-group">
			<label class="col-md-2 control-label">显示顺序:</label>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4">
						<input type="text" data-ms-tree-operate-serialNo name="serialNo"
							value="${model?.serialNo }" class="form-control" data-ms-validate
							data-ms-validate-isnotnull placeholder=""> <span
							class="glyphicon glyphicon-envelope form-control-feedback"
							style="color: #23B7E5;"></span>
					</div>
					<div class="col-md-8">
						<span class="add_controlShow help-block">不能为空</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-10 col-md-offset-2">
			<button type="button" class="btn btn-info" id="referring">保存</button>
			<button type="reset" class="btn btn-success">重置</button>
		</div>
	</div>
</g:form>
<script type="text/javascript">
$(function(){
	var form = $("#mf").validate();
	$("#referring").click(function(){
		var flag =form.formSubmitCheck();
	    if(!flag){
			return;
	    }
		var url = $("#mf").attr("action");
		var data = $('#mf').serialize();
		//actionAjax(url,data,success);
		ajaxForm ({
	        url: url,
	        data:data,
	        success: success
	    });
	});
});
function success(data){
	if(data.result){
		//刷新左边的树
		ms.msg("编辑成功",1,1000);//成功  1   失败 2
		var treeObj = $.fn.zTree.getZTreeObj("handleDemo");
		var nodes = treeObj.getSelectedNodes();
		var prent;
		if (nodes && nodes.length>0) {
			prent = nodes[0].getParentNode();
		}
		treeObj.reAsyncChildNodes(prent, "refresh");
		$("input").val("");
		$("#newPageOperateHolder").load("${request.getContextPath()}/dictParam/dictParamEmb");
	} else {
		ms.msg("编辑失败", 2, 2000);//成功  1   失败 2
	}
}
</script>
