package com.ms.sms

import com.ms.annotation.GridColumn
import com.ms.base.User
import com.ms.base.util.SystemUtil
import com.ms.base.util.Util
import com.ms.systemEnum.SystemLogAction
import java.text.SimpleDateFormat

class SystemLog {
	transient springSecurityService

	String id

	User user

	@GridColumn(name="用户",width="80px",colIdx=1)
	def getUserName(){
		if(user)return user.username
		else return ""
	}


	SystemLogAction action
	@GridColumn(name="行为", colIdx=2,width="80px")
	def getFormattedAction(){
		action?.actionName
	}
	//日志内容
	String content
	@GridColumn(name="内容" , colIdx=3)
	def getFormattedContent(){
		if(this.content){
			return Util.getLimitLengthString(this.content, 50, "...")
		}else{
			return ""
		}
	}
	//控制器名称
	@GridColumn(name="控制器名称" ,colIdx=4)
	String controllerName
	//创建时间
	Date dateCreated
	@GridColumn(name="时间",width="150px",colIdx=5,target = "dateCreated")
	def getFormattedCreatedDate(){
		if(dateCreated){
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			return sd.format(dateCreated)
		}else{
			return ""
		}
	}
	//ip地址
	@GridColumn(name="ip地址" , colIdx=9)
	String ipAddress

	//mac地址
	@GridColumn(name="mac地址", colIdx=10)
	String macAddress

	User userCreated
	User userUpdated

	def beforeInsert() {
		userCreated = springSecurityService.getCurrentUser()
		userUpdated = springSecurityService.getCurrentUser()
	}

	def beforeUpdate() {
		userUpdated = springSecurityService.getCurrentUser()
	}
	static constraints = {
	}

	static mapping = {
		def systemUtil = new SystemUtil()
		if(systemUtil.getDatabaseType().equals("oracle")){
			content sqlType:"clob"
		}else{
			content sqlType:"text"
		}
		cache : true
	}
}
