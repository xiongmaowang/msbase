/**
 * Created by King on 2016/12/20.
 */
// layer 弹出层
var ms={
    //0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
    //信息提示框 conntent:提示的内容 icon：图标（0-6)time:显示的时间 fn:成功的回掉
    msg:function (content,icon,time,fn) {
        return layer.msg(content, {
            icon: icon,
            time: time
        },fn)
    },
    //iframe层 title:标题 html:需要加载的html width/height:显示区域的宽高 min:窗口缩小的回掉 restore还原的回掉
    open:function (title, html,width, height,success) {
        null != title && "" != title || (title = !1),
        null != width && "" != width || (width = 800),
        null != height && "" != height || (height= $(window).height() - 300)
            if(!success){
                success=null
            }
        return layer.open({
                type: 2,
                area: [width + "px", height + "px"],
                fix: !1,
                maxmin: !0,
                shade:.4,
                title:[title,'color:#23B7E5'],
                content: html,
                min:function(e){
                    $(".layui-layer-shade").css("display","none");
                },
                restore:function () {
                    $(".layui-layer-shade").css("display","block");
                },
                success: success
            })
    },
    //弹出警告框 content:警告的内容 icon:图标（0-6）time:显示的时间 kind:动画的类型（0-6）fn:成功的回调
    alert:function (content,icon,time,kind,fn) {
        return layer.alert(content, {
            icon: icon,
            time: time,
            //shade: !1
            anim:kind
        },fn)
    },
    //弹出确认框 title:标题（例如警告）content:内容，icon:(0-6),btn_suc/btn_err(自定义的按钮 如确定/取消) succ/error:点击相应按钮的回调
    confirm:function(title,content,icon,btn_suc,btn_err,succ,error){
        return layer.confirm(content,{
            icon: icon,
            title: title,
            shade: !1,
            btn:[btn_suc,btn_err],
        },succ,error)
    },
    //loading层 icon:图标（0-2）time:loading时间(2秒直接time=2) index是创建每一个loading的编号标识
    loading:function(icon,time){
        var index = layer.load(icon, {time: time*1000});
    },
    closeLoading:function(index){
        layer.close(index);
    },
    //浮动提示层 content：浮动框的内容 dom：对应你要操作的元素（"$(xx)"）dir:浮动框显示的方向 color:背景颜色 time:显示时间
    tip:function(content,dom,dir,color,time){
        layer.tips(content, dom, {
            tips: [dir,color],
            time:time
        });
    },
    //加载层 icon:图标（0-2）opa:不透明度 color:遮罩颜色
    load:function (icon,opa,color) {
        var index = layer.load(icon, {
            shade: [opa,color] //0.1透明度的白色背景
        });
    },
    //选项卡层 width/height：展示区域的宽高 tab1/tab2/tab3：选项卡标题  content1/content2/content3:选项卡内容
    tab:function (width,height,tab1,content1,tab2,content2,tab3,content3) {
        return layer.tab({
            area: [width, height],
            tab: [{
                title: tab1,
                content: content1
            }, {
                title: tab2,
                content: content2
            }, {
                title: tab3,
                content: content3
            }]
        });
    },
    //图片查看器
    picLook:function (data,dom,type) {
        return layer.photos({
            photos: json/选择器,
            anim:type,
            tab: function(pic, layero){
                console.log(pic) //当前图片的一些信息
            }
        });
    }
    /*示例异步请求获得的json数据 遵守以下格式
     {
     "title": "", //相册标题
     "id": 123, //相册id
     "start": 0, //初始显示的图片序号，默认0
     "data": [   //相册包含的图片，数组格式
     {
     "alt": "图片名",
     "pid": 666, //图片id
     "src": "", //原图地址
     "thumb": "" //缩略图地址
     }
     ]
     }
     <div id="layer-photos-demo" class="layer-photos-demo">
     <img layer-pid="图片id，可以不写" layer-src="大图地址" src="缩略图" alt="图片名">
     <img layer-pid="图片id，可以不写" layer-src="大图地址" src="缩略图" alt="图片名">
     </div>
     */
}






/**
 * Created by zmd on 2017/1/4.
 */

//dataTable
var layerSuccessBack =function (data,i){
    var erroResult=data.children(".layui-layer-content").children()[0].contentWindow.erroResult
    if(erroResult&&erroResult==true){
        ms.msg("数据异常请刷新页面后重新操作",5,2600);
        layer.close(i)
    }
}
function defaultActionListInit(tableObj){
    var table="#"+$(tableObj.table().node()).attr("id");
    //    编辑
    $(table).on("click",".ding_control div a.edit",function (e) {
        e.preventDefault();
        var id=tableObj.row($(this).parent().parent()).data().id;
        var url=$(this).attr("msHref")+"/"+id;
        var title=$(this).text();
        ms.open(title,url,"1000", "600",layerSuccessBack);
    });

    //    重新启用或停用
    $(table).on("click",".ding_control div a.go",function (e) {
        e.preventDefault();
        var t=$(this);
        if(t.text()=="启用"){
            ms.confirm("警告","确定要启用吗?",0,"确定","取消",function(){
                t.html("停用");
                t.parent().parent().prev().html('<button class="btn btn-info btn-xs" style="margin-bottom: 0px;">已启用</button>');
                ms.msg("已启用",5,600);
            })
        }else{
            ms.confirm("警告","确认要停用吗?",0,"确定","取消",function(){
                t.html("启用");
                t.parent().parent().prev().html('<button class="btn btn-default btn-xs" style="margin-bottom: 0px;background:#E6E6E6;">已停用</button>');
                ms.msg("已停用",5,600);
            })
        }
    });

    //    删除一行
    $(table).on("click",".ding_control div a.del",function (e) {
        e.preventDefault();
        var t=$(this);
        var id=tableObj.row(t.parent().parent()).data().id;
        var url=t.attr("msHref");
        var innerHtml=t.text()?t.text():"删除";
        ms.confirm("警告","确定要"+innerHtml+"吗?",0,"确定","取消",function() {
            actionAjax(url,{ids:id},function(data){
                tableObj.draw( false );
                //删除多选框的全选按钮
                if(data.result&&data.result==true){
                    ms.msg("数据已"+innerHtml,1,1000);
                }else{
                    ms.msg(innerHtml+"失败",2,2000);
                }
            })
        })
    });
}

function batchDelInit(tableObj){
    var tableId=$(tableObj.table().node()).attr("id");
    var table="#"+tableId;
    var tableDiv = getTableDiv(tableId);
    tableDiv.on("click",".batch-del", function(e) {
    e.preventDefault();
    var check=$(table+" tbody :checkbox:checked")
    var url =$(this).attr("url")
    var innerHtml=$(this).attr("label")?$(this).attr("label"):"删除";
    0 == check.length
        ? ms.msg("请选择需要批量"+innerHtml+"的数据！",0,2000) :
        ms.confirm("警告","确定要批量"+innerHtml+"吗?",0,"确定","取消",function(data) {
            var ids=""
            check.each(function(i,e){
                if(i!=0){
                    ids+=","
                }
                ids+=tableObj.row($(e).parent()).data().id
            });
            actionAjax(url,{ids:ids},function(data){
                tableObj.draw(false);
                //删除多选框的全选按钮
                $(table+" .check_control").prop("checked",false);
                if(data.result&&data.result==true){
                    var changedSize=check.length;
                    if(data.changedSize){
                        changedSize=data.changedSize;
                    }
                    ms.msg(changedSize+"条数据已"+innerHtml,1,1000);
                }else{
                    ms.msg("部分数据"+innerHtml+"失败",2,2000);
                }
            })
        })
    })
}

function addButtonInit(tableObj){
    var table="#"+$(tableObj.table().node()).attr("id")
    var addButton=$(".add-button");
    addButton.on("click", function(e) {
        e.preventDefault();
        var title=$(this).html();
        var url =$(this).attr("url");
        ms.open(title,url,"1000", "600",layerSuccessBack);
    })
}
//多选框的初始化
function multiSelectInit(tableObj){
    var table="#"+$(tableObj.table().node()).attr("id")
    var control =$(table+" .check_control")
    $(table).on("click","INPUT[name='checkbox_name[]']",function () {
        var flag=true;
        $(table+" INPUT[name='checkbox_name[]']").each(function (i,v) {
            if(false == $(v).is(':checked')){
                control.prop("checked",false);
                flag=false;
            }
        })
        if(flag){
            control.prop("checked",true);
        }
    })

// 全选按钮
    control.bind("click", function () {
        var input =$(table+" INPUT[name='checkbox_name[]']")
        if(control.is(':checked') == true){
            input.each( function() {
                if(false == $(this).is(':checked')){
                    $(this).prop("checked", true);
                }
            });
        }
        if(control.is(':checked') == false){
            input.each( function() {
                if(true == $(this).is(':checked')){
                    $(this).prop("checked", false);
                }
            });
        }
    });

};
//搜索框
function searchInit(tableObj){
    var tableId=$(tableObj.table().node()).attr("id");
    var table="#"+tableId;
    var tableDiv = getTableDiv(tableId);
    tableDiv.on("click",".search-button", function(e){
        e.preventDefault();
        tableObj.draw(false);
    });
    tableDiv.find(".search-input").each(function(i,e){
        var search =$(e);
        tableObj.columns(search.attr("target")+":name").every(function () {
            var that = this;
            search.change(function () {
                if (that.search() !== this.value) {
                    that.search(this.value)
                }
            });
        });
    });
    //重置按钮
    tableDiv.find(":reset").click(function(){
        $(".chosen-select").val("");
        $(".chosen-select").trigger("chosen:updated");
        tableObj.columns().every(function(){
            this.search("");
        })
        tableObj.draw(false);
    })
}
//
function dataTablesInit(tableObj){
    multiSelectInit(tableObj);
    defaultActionListInit(tableObj);
    batchDelInit(tableObj);
    addButtonInit(tableObj);
    searchInit(tableObj);
}

//批量删除编辑列表
function batchDelByEditInit(tableObj){
    var tableId=$(tableObj.table().node()).attr("id");
    var table="#"+tableId;
    var tableDiv = getTableDiv(tableId);
    tableDiv.on("click",".batch-del", function(e) {
        e.preventDefault();
        var check=$(table+" tbody :checkbox:checked")
        var url =$(this).attr("url")
        var innerHtml=$(this).attr("label")?$(this).attr("label"):"删除";
        0 == check.length
            ? ms.msg("请选择需要批量"+innerHtml+"的数据！",0,2000) :
            ms.confirm("警告","确定要批量"+innerHtml+"吗?",0,"确定","取消",function(data) {
                check.each(function(i,e){
                    tableObj.row($(e).parent()).remove();
                });
                tableObj.draw( false );
                layer.close(data);
            })
    })
}

//ajax
$("#ajaxx").click(function(){
    var url = "${request.getContextPath()}/public/ajaxRequest";
    var data={name:"张三",age:"18",sex:"女"};
    ajaxRequest(url,data,true,"json");
});
function actionAjax(url,data,success,async){
	var as=false;
	if(async==undefined || async==true){
		as=true;
	}
    $.ajax({
        url: url,			//请求路径
        data: data,			//请求参数
        type: "POST",			//请求方式  POST   GET
        async:as,	//是否异步  true:异步(默认)     false:同步
        success:success,
        error: function(){
            ms.msg("服务器异常",5,600);
        },
        dataType: "json"	//返回格式  xml,html,script,json,jsonp,text
    });
}
//该函数用于提交文件
function actionAjaxFile(url,data,success){
  $.ajax({
      url: url,			//请求路径
      data: data,			//请求参数
      type: "POST",			//请求方式  POST   GET
      cache: false,  
      contentType: false,  
      processData: false,
      success:success,
      error: function(){
          ms.msg("服务器异常",5,600);
      }
  });
}
ajaxForm = function (options) {
    var img = $("#progressImgage");
    var mask = $("#maskOfProgressImage");
    var complete = options.complete;
    options.complete = function (httpRequest, status) {
        img.hide();
        mask.hide();
        if (complete) {
            complete(httpRequest, status);
        }
    };
    options.async = true;
    img.show().css({
        "position": "fixed",
        "top": "50%",
        "left": "50%",
        "margin-top": function () { return -1 * img.height() / 2; },
        "margin-left": function () { return -1 * img.width() / 2; }
    });
    mask.show().css("opacity", "0.1");
    $.ajax(options);
 };


function getTableDiv(tableId){
    var tableDiv=$("div[tableId='"+tableId+"']")
    if(!tableDiv||tableDiv.length<=0){
        tableDiv=$(document)
    }
   return tableDiv
}





