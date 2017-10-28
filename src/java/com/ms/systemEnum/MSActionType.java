package com.ms.systemEnum;

import com.ms.annotation.MSAction;

/**
 * Created by zmd on 2016/11/24.
 */
public enum MSActionType {
    //删除
    DELETE("Delete"),
    //新增并更新
    SAVEORUPDATE("Save"),
    //更改状态(假删除,赋值等)
    CHANGEOFSTATE("Change"),
    //标准表单查看(全部数据) ,非服务器端
    TABLEVIEW("Table"),
    //带搜索框
    TABLEVIEWSEARCH("TableS");
    //JsTree

    private String actionName;
    MSActionType(String actionName){
        this.actionName=actionName;
    }
    public String getActionName(){
        return actionName;
    }
    static public MSActionType[] getAllExceptViewsAction(){
        MSActionType[] msL={MSActionType.CHANGEOFSTATE,MSActionType.DELETE,MSActionType.SAVEORUPDATE};
        return msL;
    }
    static public MSActionType[] getAllViewsAction(){
        MSActionType[] msL={MSActionType.TABLEVIEW,MSActionType.TABLEVIEWSEARCH};
        return msL;
    }
}
