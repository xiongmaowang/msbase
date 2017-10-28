package com.ms.base

import com.ms.annotation.GridColumn
import com.ms.annotation.MSAction
import com.ms.annotation.MSActions
import com.ms.annotation.MSDomain
import com.ms.annotation.MSField
import com.ms.base.User
import com.ms.base.util.SystemUtil
import com.ms.base.util.Util
import com.ms.systemEnum.MSActionType
import com.ms.systemEnum.MSTemplate

@MSActions(msAction = [
		@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
				@MSField(name = "topic",label="标题"  ),
				@MSField(name = "content",label="内容",msTemplate = MSTemplate.UEDITOR)
		]),
		@MSAction(actionType = MSActionType.DELETE),
		@MSAction(actionType = MSActionType.TABLEVIEWSEARCH, msFileds =[
				@MSField(name = "topic",label="标题"  ),
				@MSField(name = "dateCreated",label="创建日期" )
		])
])
@MSDomain(name = "新闻")
class News {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	@GridColumn(name="日期",colIdx=10,target = "dateCreated")
	def getFormattedCreatedDate(){
		dateCreated.format("YYYY-MM-dd")
	}

	//标题
	@GridColumn(name="标题",colIdx=3)
	String topic

	//新闻内容
	def getFormattedContent(){
		content?Util.getLimitLengthString(this.content, 50, "..."):""
	}
	String content
	@GridColumn(name="创建者",colIdx=4,target="userCreated.chinaName")
	def getFormattedUser(){
		userCreated?userCreated.getFormattedName():""
	}
	//创建日期
	Date dateCreated
	Date lastUpdated
	User userCreated
	User userUpdated
    static constraints = {
    }
	static mapping = {
		//兼容mysql与oracle 从config rostenFileConfig 中判断
		def systemUtil = new SystemUtil()
		if(systemUtil.getDatabaseType().equals("oracle")){
			content sqlType:"clob"
		}else{
			content sqlType:"text"
		}
	}
	def beforeInsert() {
		userCreated = springSecurityService?.getCurrentUser()
		userUpdated = springSecurityService?.getCurrentUser()
	}

	def beforeUpdate() {
		userUpdated = springSecurityService?.getCurrentUser()
	}
}
