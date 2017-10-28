
<div class="form-group has-default has-feedback">
      <div class="form-group">
          <label class="col-md-2 control-label">${label}:</label>
          <div class="col-md-10">
			<div class="row">
				<div class="col-md-4">
					<textarea class="form-control" rows="3"    placeholder="请输入${label}" name="${name}">
					\${${propertyName}.${questionMarkName}}
					</textarea>
				</div>
				 <div class="col-md-8">
				    <span class="add_controlShow help-block">请输入${label}</span>
				</div>
			</div>
		</div>
	</div>
</div>