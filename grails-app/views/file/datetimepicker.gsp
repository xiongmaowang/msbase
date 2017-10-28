<!DOCTYPE html>
<html>
<head>
    <title>文件上传</title>
    <meta name="layout" content="main">
    <asset:link href="datepicker/bootstrap-datetimepicker.min3.css" rel="stylesheet"/>
    <asset:javascript  src="datepicker/bootstrap-datetimepicker.min.gai.js"/>
    <%-- 控件参考文档     http://www.bootcss.com/p/bootstrap-datetimepicker/  --%>
</head>
<body>
<div class="form-group has-feedback" style="width: 200px;">
    <label for="datetimepicker">日期选择器(精确到日)</label>
    <div class="input-append date date-picker" id="datetimepicker"  data-date-format="yyyy-mm-dd" >
        <input  type="text" name="time" value="2016-12-5" readonly class="form-control" id=""/>
        <span class="glyphicon glyphicon-time form-control-feedback text-primary" style="margin-top:25px;"></span>
        <span class="add-on"><i class="icon-th"></i></span>
    </div>
</div>
<input type="button" id="aa" value="点击"/>

<div class="form-group has-feedback" style="width: 200px;">
    <label for="datetimepicker">日期选择器(精确到日)</label>
    <div class="input-append date date-picker" id="datetimepicker1"  data-date-format="yyyy-mm-dd" >
        <input  type="text" name="time" value="2016-12-5" readonly class="form-control" id="datetime"/>
        <span class="glyphicon glyphicon-time form-control-feedback text-primary" style="margin-top:25px;"></span>
        <span class="add-on"><i class="icon-th"></i></span>
    </div>
</div>
<input type="button" id="bb" value="点击"/>

<div class="form-group has-feedback" style="width: 200px;">
    <label for="datetimepicker">日期选择器(精确到 时分)</label>
    <div class="input-append date  time-picker" id="datetimepicker2"  data-date-format="yyyy-mm-dd hh:ii" >
        <input  type="text" name="time2" value="2016-12-5 00:00" readonly class="form-control" id="datetime2"/>
        <span class="glyphicon glyphicon-time form-control-feedback text-primary" style="margin-top:25px;"></span>
        <span class="add-on"><i class="icon-th"></i></span>
    </div>
</div>
<input type="button" id="aa2" value="点击"/>
<form>
    <div class="col-sm-10">
        <g:radioGroup name="myGroup" values="[true,false]" value="trye" labels="['是','否']" >
            <div class="col-md-2">
                <label class="radio-inline">${it.radio}  <g:message code="${it.label}" /></label>
            </div>
        </g:radioGroup>
    </div>

</form>
<script type="text/javascript">
	$(function(){
		$("#aa").click(function(){
			alert($("#datetime").val());
		});
		$("#aa2").click(function(){
			alert($("#datetime2").val());
		});
	});
</script>
<script>
    $(function () {

    })
</script>
</body>
</html>