<div class="form-group has-default has-feedback">
    <div class="form-group">
        <label class="col-md-2 control-label">${label}:</label>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-4">
                    <input  type="text" class="form-control adduser"  data-ms-tree="${lastName}" value="\${${propertyName}.${questionMarkName}}" readonly data-ms-validate data-ms-validate-isnotnull />
                    <input type="hidden" data-ms-tree="${lastName}Id" name="${name}.id" value="\${${propertyName}.${questionMarkName}?${propertyName}.${questionMarkName}.id:''}" />
                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
                </div>
                <div class="col-md-8">
                    <span class="add_controlShow help-block">请选择${label}</span>
                </div>
            </div>
        </div>
    </div>
</div>