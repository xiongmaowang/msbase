<div class="form-group has-default has-feedback">
    <div class="form-group">
        <label class="col-md-2 control-label">中文名:</label>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-4">
                    <g:select value="\${${propertyName}.${questionMarkName}}" name="${name}" optionKey="id" optionValue="cnm" class="form-control"
                              from="\${com.ms.base.DictParam.createCriteria().list{eq("parent.id","${value}") eq("enabled",true)}}"  noSelection="['':'--请选择--']"/>
                    <span class="glyphicon glyphicon-user form-control-feedback" style="color:#23B7E5;"></span>
                </div>
                <div class="col-md-8">
                </div>
            </div>
        </div>
    </div>
</div>