
<div class="form-group has-default has-feedback">
      <div class="form-group">
          <label class="col-md-2 control-label">${label}:</label>
          <div class="col-md-10">
			<div class="row">
				<div class="col-md-4">
				    <input type="password" class="form-control addpwd" data-ms-validate  
				     data-ms-validate-isnotnull  placeholder="请输入${label}" name="${name}" value="\${${propertyName}.${questionMarkName}}">
				    <span class="glyphicon glyphicon-eye-open form-control-feedback" style="color:#23B7E5;"></span>
				</div>
				<div class="col-md-8">
				       <span class="add_controlShow help-block">请输入${label}</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="form-group has-default has-feedback">
      <div class="form-group">
          <label class="col-md-2 control-label">请再次输入${label}:</label>
          <div class="col-md-10">
			<div class="row">
				<div class="col-md-4">
				    <input type="password" class="form-control addpwd" data-ms-validate  
				     data-ms-validate-isnotnull  placeholder="请再次输入${label}" name="${name}2" value="\${${propertyName}.${questionMarkName}}">
				    <span class="glyphicon glyphicon-eye-open form-control-feedback" style="color:#23B7E5;"></span>
				</div>
				<div class="col-md-8">
				       <span class="add_controlShow help-block">请再次输入${label}</span>
				</div>
			</div>
		</div>
	</div>
</div>