<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<title><g:layoutTitle default="艋顺科技" /></title>
	<meta name="keywords" content="艋顺,艋顺科技，艋顺科技公司">
	<meta name="description" content="艋顺,艋顺科技，艋顺科技公司">
	<!--[if lt IE 9]>
		<meta http-equiv="refresh" content="0;ie.html" />
		<asset:javascript src="html5shiv.min.js"></asset:javascript>
	<asset:javascript src="respond.min.js"></asset:javascript>
	<![endif]-->
	<!--网页图标-->
	<asset:link rel="shortcut icon" href="logo.ico" type="images/x-icon" />
	<asset:link rel="icon" href="logo.ico" type="images/x-icon" />
	<!--bootstrapt样式文件-->
	<asset:link href="bootstrap.min.css" rel="stylesheet"/>
	<!--字体的样式文件-->
	<asset:link href="font-awesome.css" rel="stylesheet"/>
	<!--网页图标-->
	<!--定义动画的文件-->
	<asset:link href="animate.css" rel="stylesheet"/>
	<!--后台主题的框架css-->
	<asset:link href="style.css?v=4.1.0" rel="stylesheet"/>
	<!--重写的css-->
	<asset:link rel="stylesheet" href="me.css"/>

	<!-- 全局js -->
	<!--jquery依赖文件-->
	<asset:javascript  src="jquery.min.js"/>
	<!--bootstrapt js文件-->
	<asset:javascript src="bootstrap.min.js"/>
	<!--bootstrapt自定义手风琴菜单-->
	<asset:javascript src="plugins/metisMenu/jquery.metisMenu.js"/>
	<!--滚动条插件-->
	<asset:javascript src="plugins/slimscroll/jquery.slimscroll.min.js"/>
	<!-- 自定义js -->
	<asset:javascript src="hAdmin.js"/>
	<!-- 自定义的方法-->
    <asset:javascript src="plugins/layer/layer.min.js"/>
    <asset:javascript src="msFunction.js"/>

	<!-- 第三方插件 -->
	<g:layoutHead/>
</head>
<body class="${pageProperty(name:'body.class')}" style="${pageProperty(name:'body.style')}">
<g:layoutBody/>
<!--皮肤-->
<asset:javascript src="set_skins.js"/>
<!--页面加载进度条插件-->
<script>
    var add=0,  //btn按钮的累加
        btn_width=0,//记录btn按钮的width
        btnsArr=[],//记录按钮的数组用于向导航添加
        btn_tmp_width=0,//声明当前按钮的长度值
        Gwidth=$(".width_js").width();//初始化按钮导航的长度
    //默认页面
    changeDefaultTab()
    $("#side-menu .J_menuItem").on("click",function (e) {
        var that=$(this);
        e.preventDefault();
        arr_btn=[];//去重按钮的数组
        var target=search(that);//面包屑导航的逻辑
        var index=that.parents("ul").size();
        var navTitle="";
        for(var i=0;i<index;i++){
            navTitle+='<li>'+target[i]+'</li>'
        }
// 按钮去重设置
        $(".tab_box a").each(function (i,v) {
            var btn_me=$(this);
            var btn_name=find_tab(btn_me);
            arr_btn.push(btn_name);
        });
        if(that.attr("data-iframe-btn").trim()=="none_show"){//主页的展示
            var me_href=that.attr("href");
            var href_flag=that.attr("data-iframe-btn");
            changeTab(me_href,href_flag);
            $(".breadcrumb").html('<li>'+that.text().trim()+'</li>');
        }else{
            var me_href=that.attr("href");//取到点击nav的href属性
            var href_flag=that.attr("data-iframe-btn");
            var str2="";
            $(".width_js").animate({//改变btn导航的高度
                'height':'50px',
                'opacity':'1'
            },200)
// btn 按钮导航的控制
            if(arr_btn.indexOf(href_flag)==-1){
                if(btn_width<Gwidth){
                    ++add;
                    str2+='<a class="btn btn-info btn-md btn-delcommon_style btn_js'+add+" "+href_flag+'">'
                        +'<b class="btn-delcommon_sel">'+that.text()+'</b>'
                        +'<span class="glyphicon glyphicon-remove btn-delcommon_span"></span>'
                        +'<input type="hidden" value="'+navTitle+'"/>'
                        +'</a>';
                    btnsArr.push(str2);
                    arr_btn.push(href_flag);
                    $(".tab_box").append(str2);
                    btn_width+=parseFloat($(".btn_js"+add).css("width"))+6;
                    btn_tmp_width = parseFloat($(".btn_js"+add).css("width"))+6;
                    $(".tab_box").css({"width":Gwidth,"overflow":"hidden","white-space":"nowrap"});
                }
                if(btn_width>Gwidth){
                    btnsArr.splice(btnsArr.length-1,1);
                    var str_3=btnsArr.join("");
                    $(".tab_box").html(str_3);
                    arr_btn.splice(arr_btn.length-1, 1);
                    btn_width= btn_width - btn_tmp_width;
                    btn_tmp_width = 0;
                    ms.alert("请关闭多余的标签页",0,"",4);
                }else{
                    changeTab(me_href,href_flag);//在极值范围内还可以点击显示iframe
                    $(".breadcrumb").html(navTitle);
                }
            }else{
                changeTab(me_href,href_flag);//按钮导航不存在也可以点击切换展示（点击了相同的list）
                $(".breadcrumb").html(navTitle);
            }
        }
    });
    //   查找父级元素
    function search(dom){
        var data=[];
        var dom_text=dom.text();
        var par = dom.parents("ul");
        for(var i=0;i<par.length-1;i++){
            data.push($(par[i]).prev("a").text().trim());
        }
        data.reverse().push(dom_text);
        return data;
    }
    //查找tab对应的iframe
    function find_tab(obj){
        var that=obj.attr("class");
        var that_text=that.split(" ");
        var that_flag=that_text[that_text.length-1];
        return that_flag;
    }
    //iframe 展示
    function show_tab(index){
        $(".tab_item").css("display","none");
        $("."+index).show();
    }
    //iframe 隐藏
    function hide_tab(tab) {
        $("#content-main ."+tab).css("display","none");
    }
    //iframe 标签切换
    function changeTab(me_href,href_flag){
        var isHave = false;
        for(var i=0;i<$(".tab_item").length;i++){
            var iframe = $(".tab_item")[i].outerHTML;
            if(iframe.indexOf(href_flag) != -1){
                isHave = true;
                break;
            }
        }
        if(!isHave){
            var tab_str="";
            tab_str+='<div class="tab_item '+href_flag+'">'
                +'<div class="click_me"></div>'
                +'<iframe  width="100%" height="100%" src="${request.getContextPath()}/'+me_href+'" frameborder="0">'
                +'</iframe>'
                +'</div>';
            $("#content-main").append(tab_str);
        }
        show_tab(href_flag);
    }
    function changeDefaultTab(){
        var d=$("#side-menu li a[data-iframe-btn='none_show']")
        $(".breadcrumb").html('<li>'+d.text().trim()+'</li>');
        var me_href=d.attr("href")?d.attr("href"):"public/noneShow";
        var href_flag=d.attr("data-iframe-btn")?d.attr("data-iframe-btn"):"none_show";
        changeTab(me_href,href_flag);
    }
    //    删除对应的btn
    function del_btn(href) {
        for(var i=0;i<btnsArr.length;i++){
            if(btnsArr[i].indexOf(href)!=-1){
                btnsArr.splice(i,1);
                break;
            }
        }
    }
    //  导航tab切换
    $(".tab_box").on("click","a",function(e){
        e.stopPropagation();
        var me=$(this);
        var that_flag=find_tab(me);
        show_tab(that_flag);
        var navTitleThis = me.find("input[type='hidden']").val();
        $(".breadcrumb").html(navTitleThis);
    });
    //  导航tab删除切换
    $(".tab_box").on("click",".btn-delcommon_span",function(e){
        e.stopPropagation();
        var me=$(this).parent("a");
        var cla = me.prop("class").split(" ");//获取选中button的所有class
        var className = cla[cla.length-2].trim();//获取btn_js标识
        var btns = me.parents("div.tab_box").find("a");
        var index;//点击关闭按钮的索引
        for(var i=0;i<btns.length;i++){
            cla = $(btns[i]).prop("class").split(" ");
            if(cla[cla.length-2].trim() == className){
                index = i;//留住点击按钮的下标
            }
        }
        if(index == btns.length-1){
            $(btns[index-1]).click();
        }else if(index >= 0){
            $(btns[index+1]).click();
        }
        if(btns.length==1){
            changeDefaultTab()
            $(".width_js").css("height","0px");
        }
        btn_width=btn_width-(parseFloat(me.css("width"))+6);
        me.remove();
        var that_flag=find_tab(me);
        var index2 = arr_btn.indexOf(that_flag);
        if (index2 > -1) {
            arr_btn.splice(index2, 1);
        }
        $("."+that_flag).remove();
        del_btn(that_flag);
    });

</script>
<!--定义皮肤的js-->
<script>
    set_Skins.init($(".J_setSkins"));
</script>


<script type="text/javascript">
    //格式化时间
    Date.prototype.format = function(fmt)
    { //author: meizz
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }


    function connect(address, path) {
        var currWebsocket;
        if ('WebSocket' in window) {
            currWebsocket = new WebSocket("ws://" + address + path);
        } else if ('MozWebSocket' in window) {
            currWebsocket = new MozWebSocket("ws://" + address + path);
        } else {
            console.log("不支持websocket");
        }
        return currWebsocket;
    }

    var address = "${request.serverName}:${request.serverPort}${request.contextPath}/";
    var websocket = connect(address, "remind");

    if(websocket) {
        websocket.onopen = function (evnt) {
            var info = {uid: "admin", connect: true};
            websocket.send(JSON.stringify(info));  //发送用户信息
            console.log("连接成功,发送测试帐号admin的信息..");

        };

        websocket.onmessage = function (evnt) {
            var json = $.parseJSON(evnt.data);
            if (json.remind) {  //接收到新消息或回复
                //重新获取提醒
                //refreshRemind(url);

                //先给测试数据
                setRemindContent(
                    {
                        message: {count: parseInt(Math.random() * 66), lasttime: new Date().format("yyyy/MM/dd hh:mm")},
                        reply: {count: parseInt(Math.random() * 66), lasttime: new Date().format("yyyy/MM/dd hh:mm")}
                    }
                );

                console.log("接收到更新提醒的消息,admin将重新获取提醒");
            }
        };

        websocket.onerror = function (evnt) {

        };
        websocket.onclose = function (evnt) {
            console.log("关闭成功..");
        }

    }

</script>


<!--获取提醒（消息及回复）-->
<script>

    setRemindContent(
        {
            message: {count: 26, lasttime: "2017/1/22 10:29"},
            reply: {count: 10, lasttime: "2017/1/21 15:30"}
        }
    );

	/*通过ajax获取数据,设置提醒的内容*/
    function refreshRemind(url) {
        $.ajax(
            {
                url: url,
                dataType: 'json',
                success: function (json) {
                    setRemindContent(json);
                }

            }
        );
    }
    var remindtimer = null;
    function setRemindContent(remind) {
        $(".remind .total").html(remind.message.count + remind.reply.count);
        $(".remind .ms-message .count").html(remind.message.count);
        $(".remind .reply .count").html(remind.reply.count);

        var flag = setTimeContent();
        if (flag) {  //存在距离上次提醒的时间为分钟时,定时更新消息的时间状态
            if(remindtimer == null) {
                remindtimer = setInterval(function () {
                    var flag = setTimeContent();
                    if (!flag) {  //最低为小时的时候,清除定时器
                        clearInterval(remindtimer);
                        remindtimer = null;
                    }
                }, 1000 * 60);
            }
        }

        function setTimeContent() {
            var messageResult = formatTimeDiff(new Date(), new Date(remind.message.lasttime));
            var replyResult = formatTimeDiff(new Date(), new Date(remind.reply.lasttime));
            $(".remind .ms-message .time-difference").html(messageResult);
            $(".remind .reply .time-difference").html(replyResult);

            if (messageResult.indexOf("刚刚") != -1 || messageResult.indexOf("分钟前") != -1) {
                return true;
            }
            if (replyResult.indexOf("刚刚") != -1 || replyResult.indexOf("分钟前") != -1) {
                return true;
            }
            return false;
        }
    }




	/*格式化时间差，并返回值*/
    function formatTimeDiff(first, second) {
        var temp;
        if (first < second) {
            temp = second;
            second = first;
            first = temp;
        }
        var timeDiff = parseInt((first - second) / 60 / 1000);
        if (timeDiff <= 0) {
            return "刚刚";
        } else {
            if (timeDiff > 59) {
                var hour = timeDiff / 60;
                if (hour >= 24) {
                    //判断月份差
                    var month = monthDiff(first, second);
                    if (month >= 1 && month < 12) {
                        return parseInt(month) + "月前";
                    } else {
                        if (month < 1) {
                            return parseInt(hour / 24) + "天前";
                        } else {
                            return parseInt((first.getFullYear() - second.getFullYear())) + "年前";
                        }
                    }
                } else {
                    return parseInt(hour) + "小时前";
                }
            } else {
                return timeDiff + "分钟前";
            }
        }
    }
    //获取月份差,first应大于second的时间,精度到天
    function monthDiff(first, second) {
        var temp;
        if (first < second) {
            temp = second;
            second = first;
            first = temp;
        }
        var year = first.getFullYear() - second.getFullYear();
        var month = first.getMonth() - second.getMonth();
        var day = first.getDate() - second.getDate();
		/* var hour = first.getHours() - second.getHours();
		 var minute = first.getMinutes() - second.getMinutes();
		 var seconds = first.getSeconds() - second.getSeconds();*/
        if (year > 0) {
            if (day >= 0) {
                return month + year * 12;
            } else {
                return month - 1 + year * 12;
            }
        } else { //同年
            if (day >= 0) {
                return month;
            } else {
                return month - 1;
            }
        }
    }
</script>
</body>
</html>
