
<div class="form-group has-default has-feedback">
      <div class="form-group">
          <label class="col-md-2 control-label">${label}:</label>
          <div class="col-md-10">
			<div class="row">
				<div class="col-md-4">
					<div class="input-append date date-picker"  data-date-format="yyyy-mm-dd" >
					    <input  type="text" data-ms-validate data-ms-validate-isnotnull placeholder="请输入${label}" name="${name}" value="\${(${propertyName}.${questionMarkName}?:new Date()).format('yyyy-MM-dd')}" readonly class="form-control" />
					    <span class="glyphicon glyphicon-time form-control-feedback text-primary"></span>
					    <span class="add-on"><i class="icon-th"></i></span>
					</div>
				</div>
				<div class="col-md-8">
			        <span class="add_controlShow help-block">请输入${label}</span>
				</div>
			</div>
		</div>
	</div>
</div>