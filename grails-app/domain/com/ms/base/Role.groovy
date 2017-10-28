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
				@MSField(name = "roleName",label="roleName"  ),
				@MSField(name = "resources",label="资源",msTemplate = MSTemplate.MULTISELECT  ),
				@MSField(name = "remark",label="备注")
		]),
		@MSAction(actionType = MSActionType.DELETE),
		@MSAction(actionType = MSActionType.TABLEVIEW)
])
@MSDomain(name = "角色")
class Role {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	@GridColumn(name="角色名称",colIdx=1)
	String roleName

	static hasMany=[resources:Resource,users:User]
	@GridColumn(name="具有权限",colIdx=2)
	def getAllResourcesShow(){
		 resources.grep().collect {it.model?.modelName}.grep().unique().join(",")
	}
	@GridColumn(name="描述",colIdx=4)
	String remark

	//创建日期
	Date dateCreated
	Date lastUpdated
	static constraints = {
		roleName blank: false, unique: true
		remark  maxSize:2000

	}
	static mapping = {
		cache true  
		resources cascade: 'none'
		users joinTable: [name: "tb_user_role", key: 'role_id' ]
	}
	def beforeDelete(){
	}


	
}
