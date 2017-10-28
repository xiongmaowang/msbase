package com.ms.base

import com.ms.annotation.GridColumn
import com.ms.annotation.MSAction
import com.ms.annotation.MSActions
import com.ms.annotation.MSDomain
import com.ms.annotation.MSField
import com.ms.systemEnum.MSActionType
import com.ms.systemEnum.MSTemplate
@MSActions(msAction = [
		@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
				@MSField(name = "resourceName",label="资源名"  ),
				@MSField(name = "model",label="模块",msTemplate = MSTemplate.TREESELECT  ),
				@MSField(name = "model.resources",label="模块",msTemplate = MSTemplate.TREESELECT  ),
				@MSField(name = "url",label="URL"),
				@MSField(name = "controllerName",label="控制器名称"),
				@MSField(name = "serialNo",label="序号"),
				//@MSField(name = "departs",label="组"),
				@MSField(name = "imgClass",label="imgClass")
		]),
		@MSAction(actionType = MSActionType.DELETE),
		@MSAction(actionType = MSActionType.CHANGEOFSTATE,msFileds = [
				@MSField(name = "enabled",label="启用",value = "false")
		] ),
		@MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
				@MSField(name = "resourceName",label="资源名称" ),
				@MSField(name = "model.modelName",label="模块名")
		])
])
@MSDomain(name = "资源")
class Resource implements Comparable{
	def springSecurityService
	static transients = ["springSecurityService"]
	String id


	//模块名称
	@GridColumn(name="模块名称",colIdx=2,target="model.modelName")
	def getModelName(){
		if(model){
			return model.modelName
		}
		return "无模块"
	}
	def enabledShow(){
		if(enabled){
			"禁用"
		}else{
			"启用"
		}
	}

	//资源名称
	@GridColumn(name="资源名称" ,colIdx=1 )
	String resourceName

	//显示顺序
	Integer serialNo

	//资源路径
	@GridColumn(name="资源路径", colIdx=0)
	String url
	//权限控制器名称(url显示)
	String controllerName
	//判断权限
/*	def getAuthority(){
		if(controllerName){
			"ROLE_$controllerName"
		}
	}*/
	def getAuthority(){
		if(controllerName){
			"ROLE_$controllerName"
		}
	}

	String imgClass
	//是否启用,默认为启用
	boolean enabled = true
	@GridColumn(name="启用",colIdx=4,target ="enabled")
	def formattedEnable(){
		if(enabled)return "启用"
		else return "不启用"
	}
	//描述
	@GridColumn(name="描述")
	String description

	boolean defaultIndex=false
	//所属单位
	Model model

	//创建日期
	//创建日期
	Date dateCreated
	Date lastUpdated
	User userCreated
	User userUpdated
	//相关联的RequestMap
	Requestmap requestmap
	static constraints = {
		resourceName blank: false , unique: true
	}
	static mapping = {
		cache true
	}
	def beforeDelete(){
		Role.withNewSession {
			Role.createCriteria().list{resources{eq("id",id)}}?.each {Role role->
				role.resources.removeAll {rs->
					rs.id==id
				}
				role.save(flush:true)
			}
		}
	}
	def beforeInsert(){
		userCreated = springSecurityService.getCurrentUser()
		userUpdated = springSecurityService.getCurrentUser()

	}
	def beforeUpdate(){
		userUpdated = springSecurityService.getCurrentUser()
	}

	@Override
	int compareTo(obj) {
		if(this.equals(obj)){
			return 0
		}
		if(this.serialNo>=obj.serialNo){
			1
		}else{
			-1
		}
	}
}


