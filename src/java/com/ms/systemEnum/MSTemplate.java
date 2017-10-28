package com.ms.systemEnum;

/**
 * Created by zmd on 2016/11/23.
 */
public enum MSTemplate {
    //密码框
    PASSWORD("passWord"),
    //字符串输入框
    STRINGINPUT("stringInput"),
    //content
    STRINGCONTENT("stringContent"),
    //0.00 小数输入框
    NUMBERINPUT("numberInput"),
    //整数输入框
    INTEGERINPUT("integerInput"),
    //true/false的 radio button
    BOOLEANRADIO("booleanRadio"),
    //字典表选择框
    DICTSELECT("dictSelect"),
    //日期
    DATEPICKER("datePicker"),
    //时间
    TIMEPICKER("timePicker"),
    //单选树
    TREESELECT("treeSelect"),
    //多选树
    TREEMULTISELECT("treeMultiSelect"),
    //单选
    SINGLESELECT("singleSelect"),
    //多选
    MULTISELECT("multiSelect"),
    //DataTableEdit 一对多属性编辑器
    DATATABLEEDIT("dataTableEdit"),
    //编辑器
    UEDITOR("ueditor"),
    //根据字段类型判断
    DEFAULT("default");
    private String url;
    MSTemplate(String url){
        this.url=url;
    }
    public String getUrl(){
        return url;
    }
}
