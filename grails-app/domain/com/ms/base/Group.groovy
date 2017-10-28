package com.ms.base

import com.ms.annotation.GridColumn
import com.ms.base.util.SystemUtil

class Group {
	String id
	
	//群组名称
	@GridColumn(name="群组名称",colIdx=1)
	String groupName
	
	//人员名称
	@GridColumn(name="人员名称",colIdx=2)
	def getAllUsers(){
		def _array = []
		UserGroup.findAllByGroup(this).each{
			_array << it.user.getFormattedName()
		}
		return _array.join(",")
	}
	
	//具有角色
	@GridColumn(name="具有角色",colIdx=3)
	def getAllRoles(){
		def _array = []
		RoleGroup.findAllByGroup(this).each{
			_array << it.role.authority
		}
		return _array.join(",")
	}
	
    //描述
	@GridColumn(name="描述",colIdx=4)
	String description
	
	//创建日期
	static hasMany = [users:User]

    static constraints = {
		groupName blank: false
		description nullable:true,blank:true
    }
	static mapping = {
		users joinTable: [name: "tb_user_group", key: 'group_id']
		//兼容mysql与oracle
		def systemUtil = new SystemUtil()
		if(systemUtil.getDatabaseType().equals("oracle")){
			description sqlType:"clob"
		}else{
			description sqlType:"text"
		}
	}
	def beforeDelete(){
		RoleGroup.removeAll(this)
		UserGroup.removeAll(this)
	}
}
