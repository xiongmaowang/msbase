/*
 * 该文件用于检查手机号、身份证号、邮箱等是否合法
 */
//验证手机号是否合法
function mobileNumberCheck(mobileNumber){
	var str = mobileNumber;
	if(str.length == 0){
		return "请输入手机号!";//未输入
	}
	if(str.indexOf(" ") != -1){
		return "手机号不能有空格!";//有空格
	}
	if(str.length == 11){
		var reg = /^1[34578]\d{9}$/;
	    return reg.test(str);
	}else{
		return "手机号长度不合法";//长度不合法
	}
}
/**
 * 验证身份证号码是否合法
 */
function idCardChecked(cardNumber){
	var str = cardNumber;
	if(str.length == 0){
		return "请输入身份证号码!";
	}
	if(str.indexOf(" ") != -1){
		return "身份证号码中不能有空格!";
	}
	if(str.length == 15 || str.length == 18){
		var reg = /^(\d{15}$|^\d{18}$|^\d{17}(X|x))$/;
		return reg.test(str);
	}else{
		return "身份证号码不合法，请输入15位或18位身份证号!";
	}
}
/**
 * 验证邮箱是否合法
 */
function emailChecked(emailValue){
	var str = emailValue;
	if(str.length == 0){
		return "请输入邮箱地址!";
	}
	if(str.indexOf(" ") != -1){
		return "邮箱地址中不能有空格!";
	}
	var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	return reg.test(str);
}



function validateTextBox(){
	var dataMsValidate = {
			data_ms_validate_phone:validatePhone,//电话号码
			data_ms_validate_idcard:validateIdCard,//身份证号码
			data_ms_validate_email:validateEmail,//邮箱
			data_ms_validate_select:validateSelect,
			data_ms_validate_max:validateMax,//最大值
			data_ms_validate_min:validateMin,//最小值
			data_ms_validate_leftblank:validateLeftBlank,//去左边的空格
			data_ms_validate_rightblank:validateRightBlank,//去右边的空格
			data_ms_validate_allblank:validateAllBlank,//去所有空格
			data_ms_validate_isnotnull:validateIsNotNull,//非空
			data_ms_validate_integral:validateIntegral,//整数
			data_ms_validate_small:validateSmall//小数,支持自定义小数点后位数
	};
	return dataMsValidate;
}
function validatePhone(inputobj){
	var input = $(inputobj);
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		return;
	}
	var arr = cla.split(" ");
	var text = null;
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	var value = $(input).val().trim();
	var msg = mobileNumberCheck(value);
	if(icon == null){
		if(msg==true){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else if(msg==false){
			text = "输入手机号不合法,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = msg;
			return {"flag":false,"text":text,"icon":icon};
		}
	}else if(icon != null){
		if(msg==true){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else if(msg==false){
			text = "输入手机号不合法,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = msg;
			return {"flag":false,"text":text,"icon":icon};
		}
	}
}
function validateIdCard(inputobj){
	var input = $(inputobj);
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		return;
	}
	var arr = cla.split(" ");
	var text = null;
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	var value = $(input).val().trim();
	var msg = idCardChecked(value);
	if(icon == null){
		if(msg==true){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else if(msg==false){
			text = "输入身份证号不合法,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = msg;
			return {"flag":false,"text":text,"icon":icon};
		}
	}else if(icon != null){
		if(msg==true){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else if(msg==false){
			text = "输入身份证号不合法,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = msg;
			return {"flag":false,"text":text,"icon":icon};
		}
	}
}
function validateEmail(inputobj){
	var input = $(inputobj);
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		return;
	}
	var arr = cla.split(" ");
	var text = null;
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	var value = $(input).val().trim();
	var msg = emailChecked(value);
	if(icon == null){
		if(msg==true){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else if(msg==false){
			text = "输入邮箱地址不合法,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = msg;
			return {"flag":false,"text":text,"icon":icon};
		}
	}else if(icon != null){
		if(msg==true){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else if(msg==false){
			text = "输入邮箱地址不合法,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = msg;
			return {"flag":false,"text":text,"icon":icon};
		}
	}
}
/**
 * 待完善
 */
function validateSelect(inputobj){
	var select = $(inputobj);
	if(select.length==0){
		console.log("错误");
	}
	var value = $(select).find("option:selected").text();
	if(value == "" || value == null || value == "请选择"){
		
		return;
	}else{
		
	}
}
function validateMax(inputobj){
	var input = $(inputobj);
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		return;
	}
	var arr = cla.split(" ");
	var text = null;
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	var value = $(input).val().trim();
	var msg = $(input).attr("data-ms-validate-max");
	if(icon == null){
		if(value.length>msg){
			text = "所输入的值超过"+msg+"位,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}
	}else if(icon != null){
		if(value.length>msg){
			text = "所输入的值超过"+msg+"位,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}
	}
}
function validateMin(inputobj){
	var input = $(inputobj);
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		return;
	}
	var arr = cla.split(" ");
	var text = null;
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	var value = $(input).val().trim();
	var msg = $(input).attr("data-ms-validate-min");
	if(icon == null){
		if(value.length>=msg){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else{
			text = "所输入的值不足"+msg+"位,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}
	}else if(icon != null){
		if(value.length>=msg){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else{
			text = "所输入的值不足"+msg+"位,请重新输入!";
			return {"flag":false,"text":text,"icon":icon};
		}
	}
}
function validateLeftBlank(inputobj){
	var value = $(inputobj).val();
	if(value == "" || value == null){
		return;
	}
	if(value.indexOf(" ") != -1){
		while(value.indexOf(" ")==0){
			value = value.replace(/" "/,"");
		}
		$(inputobj).val(value);
		return;
	}
}
function validateRightBlank(inputobj){
	var value = $(inputobj).val();
	if(value == "" || value == null){
		return;
	}
	if(value.lastIndexOf(" ") != -1){
		while(value.lastIndexOf(" ")==value.length-1){
			value = value.replace(/" "/,"");
		}
		$(inputobj).val(value);
		return;
	}
}
function validateAllBlank(inputobj){
	var value = $(inputobj).val();
	if(value == "" || value == null){
		return;
	}
	value = value.replace(/" "/g,"");
	$(inputobj).val(value);
	return;
}
function validateIsNotNull(inputobj){
	var input = $(inputobj);
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		return;
	}
	var arr = cla.split(" ");
	var text = null;
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	var value = $(input).val().trim();
	if(icon == null){
		if(value == "" || value == null){
			text = "该输入框不能为空，请输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}
	}else if(icon != null){
		if(value == "" || value == null){
			text = "该输入框不能为空，请输入!";
			return {"flag":false,"text":text,"icon":icon};
		}else{
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}
	}
}
function validateIntegral(inputobj){
	var input = $(inputobj);
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		return;
	}
	var arr = cla.split(" ");
	var text = null;
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	var value = $(input).val().trim();
	var reg = /^\d*$/;
	if(icon == null){
		if(reg.test(value)){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else{
			text = "请输入正整数，如：01234...";
			return {"flag":false,"text":text,"icon":icon};
		}
	}else if(icon != null){
		if(reg.test(value)){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else{
			text = "请输入正整数，如：01234...";
			return {"flag":false,"text":text,"icon":icon};
		}
	}
}
function validateSmall(inputobj){
	var input = $(inputobj);
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		return;
	}
	var arr = cla.split(" ");
	var text = null;
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	var value = $(input).val().trim();
	var len = $(input).attr("data-ms-validate-small");
	if(len == "" || len == null){
		len = 2;
	}
	var reg1 = /^\d$/;
	var reg2 = eval("/^\\d+(\\.\\d{0,"+len+"})?$/");
	if(icon == null){
		if(reg1.test(value)){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else if(reg2.test(value)){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else{
			text = "输入非法,请输入##.##(小数)或##(正整数)!";
			return {"flag":false,"text":text,"icon":icon};
		}
	}else if(icon != null){
		if(reg1.test(value)){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else if(reg2.test(value)){
			text = "";
			return {"flag":true,"text":text,"icon":icon};
		}else{
			text = "输入非法,请输入##.##(小数)或##(正整数)!";
			return {"flag":false,"text":text,"icon":icon};
		}
	}
}
$.fn.validate = function(){
	var form = $(this);
	var inputs = $(this).find("input[data-ms-validate]");
	if(inputs.length<1){
		return;
	}
	$(inputs).parents(".form-group").find(".help-block").hide();
	//获得焦点时
	$(this).find("input[data-ms-validate]").on("focus",gotFocus);
	//input失去焦点时调用函数
	$(this).find("input[data-ms-validate]").on("blur",function(e){
		var input = $(this);
		eachAtrr(input);
	});    
	//Select框非空验证
	$(this).find("select[data-ms-validate-select]").on("blur",function(){
		var select = $(this);
		validateSelect(select);
	});
	//消息提示
	messageBox();
	return form
}
//表单提交
//表单提交控制
$.fn.formSubmitCheck=function(){
	var inputs = this.find("input[data-ms-validate]");
	var inputsObj = inputs;
	var arr = new Array();
	for(var i=0;i<inputsObj.length;i++){
		arr[i] = validateAtrr($(inputsObj[i]));
	}
	var length = arr.length;
	var arr1 = new Array();
	var index = 0;
	for(var i=0;i<length;i++){
		if(arr[i]==false){
			arr1[index] = arr[i];
			index++;
		}
	}
	if(arr1.length>0){
		return false;
	}else{
		return true;
	}
}   

//获得焦点
function gotFocus(){
	var input = $(this);
	reviseInputAttr(input);
	$(input).parents(".form-group").find(".help-block").show();
	var cla =  $(input).parents(".form-group").find(".glyphicon").prop("class");
	if(cla == undefined){
		getFocus(input);
		return;
	}
	var arr = cla.split(" ");
	var text = $(input).parents(".form-group").find(".help-block").text();
	var icon = null;
	for(var i=0;i<arr.length;i++){
		if(arr[i].indexOf("glyphicon-") != -1){
			icon = arr[i];
		}
	}
	if(icon == null){
		if($(input).attr("data-ms-validate") == ""){
			$(input).attr("data-ms-validate",text);
			getFocus(input,text);
		}else{
			text = $(input).attr("data-ms-validate");
			getFocus(input,text);
		}
	}else if(icon != null){
		if($(input).attr("data-ms-validate") == ""){
			$(input).attr("data-ms-validate",text);
			$(input).addClass(icon);
			getFocus(input,icon,text);
		}else{
			icon = $(input).prop("class").split(" ");
			text = $(input).attr("data-ms-validate");
			getFocus(input,icon[icon.length-1],text);
		}
	}
}
//获得焦点时调用函数
function getFocus(obj,icon,text) {
	//传入参数个数为0
	if(arguments.length == 0){
		return;
	}
	if(arguments.length == 1){
		return;
	}
	var count = 0;
	for(var i=0;i<arguments.length;i++){
		if(typeof arguments[i] == "object"){
			count += count+1;
		}
	}
	if(count==3 || count == 2 || count == 0){
		return;
	}
	var inputObj = null;
	var inputIcon = null;
	var inputText = null;
	for(var i=0;i<arguments.length;i++){
		if(typeof arguments[i]=="object"){
			inputObj = arguments[i];
		}else if(typeof arguments[i]=="string" && arguments[i].indexOf("glyphicon-") != -1){
			inputIcon = arguments[i];
		}else{
			inputText = arguments[i];
		}
	}
	if(inputObj != null && inputIcon != null && inputText != null){
		$(inputObj).parents(".form-group").removeClass("has-error");
		$(inputObj).next("span").removeClass("glyphicon-remove glyphicon-ok").addClass(inputIcon).css("color","#23B7E5")
		$(inputObj).parents(".form-group").find(".help-block").addClass("add_controlShow").text(inputText);
	}else if(inputObj != null && inputText != null){
		$(inputObj).parents(".form-group").find(".help-block").addClass("add_controlShow").text(inputText);
	    $(inputObj).parents(".form-group").removeClass("has-error");
	}
}
//失去焦点时调用函数
function loseFocus(name,flag,icon,mesg){
	if(arguments.length == 0 || arguments.length == 1 || arguments.length == 2){
		return;
	}
	var count = 0;
	for(var i=0;i<arguments.length;i++){
		if(typeof arguments[i] == "object"){
			count += count+1;
		}
	}
	if(count==4 || count == 3 || count == 2 || count == 0){
		return;
	}
	var inputObj = null;
	var inputFlag = null;
	var inputIcon = null;
	var inputText = null;
	for(var i=0;i<arguments.length;i++){
		if(typeof arguments[i]=="object"){
			inputObj = arguments[i];
		}else if(typeof arguments[i]=="boolean"){
			inputFlag = arguments[i];
		}else if(typeof arguments[i]=="string" && arguments[i].indexOf("glyphicon-") != -1){
			inputIcon = arguments[i];
		}else{
			inputText = arguments[i];
		}
	}
	if(inputObj != null && inputText != null){
		if(inputFlag){
		      $(inputObj).parents(".form-group").removeClass("has-default has-error").addClass("has-success");
		  }else{
		      $(inputObj).parents(".form-group").removeClass("has-default has-success").addClass("has-error");
		  }
		$(inputObj).parents(".form-group").find(".add_controlShow").removeClass("add_controlShow").text(inputText);
	}
	if(inputObj != null && inputIcon != null && inputText != null){
		if(inputFlag){
		      $(inputObj).next("span").removeClass(inputIcon+" glyphicon-remove").addClass("glyphicon-ok").css("color","#27C24C");
		      $(inputObj).parents(".form-group").removeClass("has-default has-error").addClass("has-success");
		  }else{
		      $(inputObj).next("span").removeClass( inputIcon+" glyphicon-ok").addClass("glyphicon-remove").css("color","#ED5565");
		      $(inputObj).parents(".form-group").removeClass("has-default has-success").addClass("has-error");
		  }
		$(inputObj).parents(".form-group").find(".add_controlShow").removeClass("add_controlShow").text(inputText);
	}
}
//遍历input对象自定义属性
function eachAtrr(obj){
	if(arguments.length == 0){
		return;
	}
	var attrObj = null; 
	for(var i=0;i<obj.length;i++){
		attrObj = obj.get(i).attributes;
	}
	var validateObj = validateTextBox();
	var results;
	var flag;
	for(var i=0;i<attrObj.length-1;i++){
		var attrName = attrObj[i].nodeName.toString();
		if(attrName.indexOf("data-ms-validate-") != -1){
			attrName = attrName.replace(/-/g,"_");
			try{
				results = eval("validateObj."+attrName+"(obj)");
				if(results != null && results.flag==false){
					loseFocus(obj,false,results.icon,results.text);
					flag = false;
					break;
				}else if(results != null && results.flag){
					flag = true;
				}
			}catch(e){
				var icon = null;
				var text = null;
				var cla =  $(obj).prop("class").split(" ");
				if(cla[cla.length-1].indexOf("glyphicon-") != -1){
					icon = cla[cla.length-1];
					text = $(obj).attr("data-ms-validate");
					$(obj).next("span").removeClass("glyphicon-ok").addClass(icon).css("color","#ED5565");
				    $(obj).parents(".form-group").removeClass("has-default has-success").addClass("has-error");
				    $(obj).parents(".form-group").find(".add_controlShow").removeClass("add_controlShow").text(text);
				}
				var messg = attrName.replace(/_/g,"-")+"自定义属性有误！"
				$("body #validateMsgModal").find(".modal-body").text(messg);
				$('#validateMsgModal').modal('show');
				return;
			}
		}
	}
	if(flag){
		loseFocus(obj,true,results.icon,results.text);
	}
}
//获得焦点时修改input相关属性
function reviseInputAttr(obj){
	if(arguments.length == 0){
		return;
	}
	var attrObj = obj.get(0).attributes;
	/*for(var i=0;i<attrObj.length;i++){
		var attrName = attrObj[i].nodeName.toString();
		if(attrName=="data-ms-validate-phone"){
			$(obj).css("ime-mode","disabled");
		}else if(attrName=="data-ms-validate-idcard"){
			$(obj).css("ime-mode","disabled");
		}else if(attrName=="data-ms-validate-email"){
			$(obj).css("ime-mode","disabled");
		}else if(attrName=="data-ms-validate-integral"){
			$(obj).css("ime-mode","disabled");
		}else if(attrName=="data-ms-validate-small"){
			$(obj).css("ime-mode","disabled");
		}
	}*/
}
//提交验证属性遍历
function validateAtrr(obj){
	if(arguments.length == 0){
		return;
	}
	var attrObj = null; 
	for(var i=0;i<obj.length;i++){
		attrObj = obj.get(i).attributes;
	}
	var validateObj = validateTextBox();
	var results =null;
	for(var i=0;i<attrObj.length-1;i++){
		var attrName = attrObj[i].nodeName.toString();
		if(attrName.indexOf("data-ms-validate-") != -1){
			attrName = attrName.replace(/-/g,"_");
			try{
				results = eval("validateObj."+attrName+"(obj)");
				if(results != null && results.flag==false){
					$(obj).parents(".form-group").find(".help-block").show();
					loseFocus(obj,false,results.icon,results.text);
					return false;
				}else{
					return true;
				}
			}catch (e) {
				return null;
			}
		}
	}
}
//错误消息提示框
function messageBox(){
	var msg = '<div class="modal fade" id="validateMsgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
				+'<div class="modal-dialog">'
					+'<div class="modal-content">'
						+'<div class="modal-header">'
							+'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
							+'<h4 class="modal-title" id="myModalLabel">消息提示</h4>'
						+'</div>'
						+'<div class="modal-body"></div>'
						+'<div class="modal-footer">'
							+'<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>'
						+'</div>'
					+'</div>'
				+'</div>'
			+'</div>';
	$("body").append(msg);
}