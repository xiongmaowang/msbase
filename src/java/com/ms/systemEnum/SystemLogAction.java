package com.ms.systemEnum;

public enum SystemLogAction {
	SAVE("保存"),DELETE("删除"),VIEW("查看"),LOG("登录"),WRONG("错误");
	private String actionName;
	SystemLogAction(String actionName){
		this.actionName=actionName;
	}
	public String getActionName(){
		return actionName;
	}
}
