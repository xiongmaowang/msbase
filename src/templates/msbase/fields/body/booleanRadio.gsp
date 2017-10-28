
<div class="form-group has-default has-feedback">
    <div class="form-group">
        <label class="col-md-2 control-label">${label}:</label>
        <div class="col-sm-10">
			<div class="row">
			    <div class="col-md-4">
			        <div class="row">
						<g:radioGroup name="${name}" values="[true,false]" value="\${${propertyName}.${questionMarkName}}" labels="['是','否']" >
							<div class="<g:if test='\${it.label=='是'}'>col-md-2 col-md-offset-2</g:if><g:else>col-md-4</g:else>">
							 	<label class="radio inline">
									\${it.radio} <g:message code="\${it.label}"/>
								</label>
			                </div>
						</g:radioGroup>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
