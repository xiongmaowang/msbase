/**
 * Created by zmd on 2017/2/15.
 */

$(function () {
    //日期插件初始化
    $('.date-picker').datetimepicker({
        minView: "month",
        autoclose:true,
        todayBtn: true,
        pickerPosition: "center",
        todayHighlight: true,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        bootcssVer:2,
        format:"yyyy-mm-dd",
        language:  'zh'              //设置时间控件为中文
    });
    //时间初始化
    $('.time-picker').datetimepicker({
        minView: "hour",
        autoclose:true,
        todayBtn: true,
        pickerPosition: "center",
        todayHighlight: true,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        bootcssVer:2,
        format:"yyyy-mm-dd hh:ii",
        language:  'zh'              //设置时间控件为中文
    });

    //chosen插件初始化
    $(".chosen-select").chosen({});
})