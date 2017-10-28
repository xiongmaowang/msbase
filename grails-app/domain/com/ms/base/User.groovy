package com.ms.base

import com.ms.annotation.*
import com.ms.systemEnum.MSActionType
import com.ms.systemEnum.MSTemplate

@MSActions(msAction = [
		@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
				@MSField(name = "username",label="用户名"  ),
				@MSField(name = "password",label="密码"),
				@MSField(name = "chinaName",label="中文名"),
				@MSField(name = "roles",label="角色"),
				//@MSField(name = "departs",label="组"),
				@MSField(name = "departs",label="部门" ,msTemplate=MSTemplate.TREEMULTISELECT)
		]),
		@MSAction(actionType = MSActionType.CHANGEOFSTATE,msFileds = [
				@MSField(name = "enabled",label="无效",value = "false")
		] ),
		@MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
				@MSField(name = "username",label="用户名" ),
				@MSField(name = "chinaName",label="中文名"),
				@MSField(name = "dateCreated",label="创建时间")
		])
])

@MSDomain(name = "用户",controllerPackage = "com.ms",controllerName="userC")
class User {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	@GridColumn(name="登陆名",defaultOrder = true, defaultOrderType = "desc" )
	String username//登录名
	String password//密码
	@GridColumn(name="中文名")
	String chinaName//中文名
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	//创建日期
	Date dateCreated
	@GridColumn(name="创建时间",target ="dateCreated",colIdx = 101)
	def formattedDateCreated(){
		dateCreated?dateCreated.format("YYYY-MM-dd"):""
	}
	Date lastUpdated
	@GridColumn(name="是否有效",target ="enabled")
	def formattedEnabled(){
		if(enabled)"有效"
		else "失效"
	}
	def enabledShow(){
		if(enabled)"禁用"
		else "启用"
	}
	//样式表
	String cssStyle

	def getFormattedName(){
		return chinaName?chinaName:username
	}


	static constraints = {
		username blank: false, unique: true
		password blank: false
	}
	static belongsTo = [Role,Group,Depart]
	static hasMany = [roles: Role,groups:Group,departs:Depart]
	static mapping = { password column: '`password`'
		roles joinTable: [name: "tb_user_role", key: 'user_id']
		groups joinTable: [name: "tb_user_group", key: 'user_id']
		departs joinTable: [name: "tb_user_depart", key: 'user_id']
	}
	//用于获取权限
	Set<Resource> getAuthorities() {
		def auths=[]
		if(username=='admin'){
			 auths = Resource.findAll()
		}else{
			this.roles.each{
				auths+=it.resources
			}
		}
		auths.removeAll{
			!it.authority
		}
		auths as Set
	}

	Set<Resource> getAllAuthorities() {
		def auths=[]
		if(username=='admin'){
			auths = Resource.findAll()
		}else{
			this.roles.each{
				auths+=it.resources
			}
		}
		auths as Set
	}

	//2016-8-5 查询条件角色
	def getAllRoles(){
		//用户自身拥有角色
		return this.roles.unique()
	}
	
/*	def getDepartEntity(){
		def entitys = UserDepart.findByUser(this,[sort:"user"])
		if(entitys) return entitys.depart
		else return null
	}*/
	//所属部门
	
	protected void encodePassword() {
		password = springSecurityService?.encodePassword(password)
	}
	def getEncodedPassword(String passwordstr){
		return springSecurityService?.encodePassword(passwordstr)
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}
	def beforeDelete(){
	}

}
