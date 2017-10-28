//封装设置背景
;(function($,doc,win){
    var reg = /^#([0-9a-fA-f]{3}|[0-9a-fA-f]{6})$/;
    String.prototype.colorHex = function(){
        var that = this;
        if(/^(rgb|RGB)/.test(that)){
            var aColor = that.replace(/(?:\(|\)|rgb|RGB)*/g,"").split(",");
            var strHex = "#";
            for(var i=0; i<aColor.length; i++){
                var hex = Number(aColor[i]).toString(16);
                if(hex === "0"){
                    hex += hex;
                }
                strHex += hex;
            }
            if(strHex.length !== 7){
                strHex = that;
            }
            return strHex;
        }else if(reg.test(that)){
            var aNum = that.replace(/#/,"").split("");
            if(aNum.length === 6){
                return that;
            }else if(aNum.length === 3){
                var numHex = "#";
                for(var i=0; i<aNum.length; i+=1){
                    numHex += (aNum[i]+aNum[i]);
                }
                return numHex;
            }
        }else{
            return that;
        }
    };
    var set_Skins=function(item){
        var me1=this;
        this.item=item;
        this.arr_fan=[];
        this.settings={
            show_items:3,//每行展示的item
            color_items:["#3c8dbc","rgb(0,0,0)","#605ca3","#008d4c","#0362F5","#f39c12","#367fa9","#fefefe","#605ca8","#008d4b","#dd4b39","#f39c13"],//默认皮肤的颜色
            color_title:["light-blue","light-black","purple","green","red","yellow","light2-blue","black_light","purple","green","red","yellow"],//颜色的title
            define_items:[],//自定义的列表
            define_title:[]//自定义的title
        }
        $.extend(this.settings,this.getsettings());
        this.getsettings();
        this.newitems();
        this.changeBj();
        this.show_others();
    }
    set_Skins.prototype={
        constructor:set_Skins,
        getsettings:function () {//获得配置的参数
            var m2=this;
            var data=this.item.attr("data-set");
            if(data&&data!=""){
                return $.parseJSON(data);
            }else{
                return{};
            }
        },
        newitems:function () {
            var m3=this;
            var amount=1/this.settings.show_items*100+"%";//横向排列的个数(所占的百分比)
            var def_arr=this.settings.color_items;//默认的数组
            var define_arr=this.settings.define_items;//自定义的数组
            var def_title_arr=this.settings.color_title;//默认的颜色title;
            var define_title_arr=this.settings.define_title;//自定义的颜色title
            if(define_arr.length!=0&&define_arr.length<=4){
                def_arr.push.apply( def_arr, define_arr );
                def_title_arr.push.apply(def_title_arr,define_title_arr);
                for(var i=0;i<def_arr.length;i++){
                    var str="";
                    str+="<li class='skins_li'>"
                       +"<a href='javascript:void(0);' data-skin='skin-red-light'  class='clearfix full-opacity-hover skin_a_sum'>"
                       + "<div><span  class='skins_public skins_top_1'></span><span class='skins_public skins_top_2'></span></div>"
                       +"<input type='hidden' value='"+def_arr[i]+"'>"
                       + "<div><span class='skins_public skins_bottom_1'></span><span class='skins_bottom_2'></span></div>"
                       + "</a>"
                       + "<p class='text-center no-margin skins_p'>"+def_title_arr[i]+"</p>"
                       +"</li>";
                    this.item.append(str);
                    this.oppositeColor(def_arr[i])
                    this.item.find(".skins_li:last").find(".skins_public").css("background",def_arr[i]);
                }
                $(".skins_li").css({'width':amount,'padding':'5px'});
            }
        },
        changeBj:function () {
            var m4=this;
            $(".skins_li").on("click",function(){
                var col=$(this).find("input").val();
                $("#set_color").css("background",col);
                $("#set_color").attr("data-color",col);
                $("#set_color").parent().removeClass("border-bottom");
                $(".breadcrumb li").css("color",m4.oppositeColor(col));
                $("#side-menu > li.active").css("border-left-color",col);
            })
        },
        oppositeColor:function (a) {//颜色取反
            var m5=this;
            a=a.replace('#','');
            var c16,c10,max16=15,b=[];
            if(a.indexOf("rgb")!=-1){
                var arr_fan=a.colorHex();//rgb类型
                return m5.oppositeColor(arr_fan);
            }else{
                for(var i=0;i<a.length;i++){
                    c16=parseInt(a.charAt(i),16);//  to 16进制
                    c10=parseInt(max16-c16,10);// 10进制计算
                    b.push(c10.toString(16)); // to 16进制
                }
                var arr_fan='#'+b.join('');
                this.arr_fan.push(arr_fan);
            }
            return arr_fan;
        },
        show_others:function () {
            var m5=this;
            $(".tab_box").on("click",".btn-delcommon_span",function(){
                m5.succ_skins();
            })
            $("#side-menu li").on("click",function(){
                m5.succ_skins();
            })
        },
        succ_skins:function(){
            var index="";
            var obj_show=new Object();
            for(var i=0;i<this.arr_fan.length;i++){
                obj_show[this.settings.color_items[i]]=this.arr_fan[i];
            }
            var col_val=$("#set_color").attr("data-color");
            if(col_val&&col_val!=""){
                for(var i in obj_show){
                    if(col_val==i){
                        var fan_val=obj_show[i];
                        index=i;
                        break;
                    }
                }
                $("#side-menu > li.active").css("border-left-color",index);
                $(".breadcrumb li").css("color",fan_val);
            }
        }
    };
    $(".set a").on("click",function (e) {
        e.stopPropagation();
        $(this).hide();
        $(".set_skin").addClass("go");
    });
    $(".hand_close").on("click",function (e) {
        e.stopPropagation();
        $(".set_skin").removeClass("go");
        $(".set a").show();
    });
    $(doc).on("click",function (e) {
        $(".set_skin").removeClass("go");
        $(".set a").show();
    });
    $(".set_skin").on("click",function(e){
        e.stopPropagation()
    })
    //为iframe 绑定的事件的特殊函数
    set_Skins.init=function(items){
        var that=this;
        items.each(function () {
            new that($(this));
        })
    }
    window['set_Skins']=set_Skins;
})(jQuery,document,window);