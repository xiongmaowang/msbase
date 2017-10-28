/**
 * Created by Jack on 2017/1/5.
 */
(function(){
    var oLanguage={
        "oAria": {
            "sSortAscending": ": 升序排列",
            "sSortDescending": ": 降序排列"
        },
        "oPaginate": {
            "sFirst": "首页",
            "sLast": "末页",
            "sNext": "下页",
            "sPrevious": "上页"
        },
        "sEmptyTable": "没有相关记录",
        "sInfo": "第 _START_ 到 _END_ 条记录",
        "sInfoEmpty": "第 0 到 0 条记录，共 0 条",
        "sInfoFiltered": "(从 _MAX_ 条记录中检索)",
        "sInfoPostFix": "",
        "sDecimal": "",
        "sThousands": ",",
        "sLengthMenu": "每页显示条数: _MENU_",
        "sLoadingRecords": "处理中...",
        "sProcessing": "处理中...",
        "sSearch": "搜索:",
        "sSearchPlaceholder": "",
        "sUrl": "",
        "sZeroRecords": "没有相关记录"
    }
    $.fn.dataTable.defaults.oLanguage=oLanguage;
    //添加默认的刷新回调函数
    $.fn.dataTable.defaults.fnDrawCallback=function(settings ) {
        var tabId=settings.nTable.id
        if(!tabId){
            tabId="";
        }
        var checkBoxList=$(settings.nTable.id+" INPUT[name='checkbox_name[]']");
        if(checkBoxList.size()==0){
            $('.check_control').prop("checked", false);
        }else{
            checkBoxList.each(function (v) {
                if(false == $(v).is(':checked')) {
                    $('.check_control').prop("checked", false);
                }
            })
        }
    }
})(jQuery);