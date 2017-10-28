package com.ms.base

import com.ms.annotation.GridColumn
import com.ms.annotation.MSAction
import com.ms.annotation.MSActions
import com.ms.annotation.MSField
import com.ms.base.util.SystemUtil
import com.ms.systemEnum.MSActionType

@MSActions(msAction = [
		@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
				@MSField(name = "departCode" ),
				@MSField(name = "departName"),
				@MSField(name = "serialNo"),
				@MSField(name = "departPhone"),
				@MSField(name = "children")
		]),
		@MSAction(actionType = MSActionType.CHANGEOFSTATE ,msFileds = [
				@MSField(name = "parent.departCode",value = "'2'"),
				@MSField(name = "departPhone",value = "'33'"),
				@MSField(name = "serialNo" , value = "233")
		]),
		@MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
				@MSField(name = "departCode" ),
				@MSField(name = "departName"),
				@MSField(name = "parent.parent.departPhone"),
				@MSField(name = "parent.departCode")
		])
])
class Depart  implements Comparable{
	def springSecurityService
	static transients = ["springSecurityService"]

	String id
	
	//部门编号
	@GridColumn(name="部门编号",colIdx=1)
	String departCode
	
	//部门名称
	@GridColumn(name="部门名称",colIdx=2)
	String departName
	
	//显示顺序
	Integer serialNo
	
	//部门电话
	@GridColumn(name="部门电话",colIdx=5)
	String departPhone
	
	//部门传真
	@GridColumn(name="部门传真",colIdx=4)
	String departFax
	
	//部门手机
	String departMobile
	
	//部门地址
	String departAdderess
	
	//内容描述
	@GridColumn(name="描述",colIdx=5)
	String description

	//创建日期
	Date dateCreated
	Date lastUpdated


	//上级部门
	static belongsTo = [parent:Depart]
	//是否删除(false删除)
	boolean enabled = true

	//获取所有用户
/*	def getAllUser(){
		def users =[]
		UserDepart.findAllByDepart(this).each{
			users << it.user
		}
		return users
	}
	*/
	SortedSet  children
	static hasMany = [children:Depart,users:User]
	
    static constraints = {

    }
	static mapping = {
		users joinTable: [name: "tb_user_depart", key: 'depart_id']
		children cascade: 'all-delete-orphan'
		sort serialNo: "asc"
		//兼容mysql与oracle
		def systemUtil = new SystemUtil()
		if(systemUtil.getDatabaseType().equals("oracle")){
			description sqlType:"clob"
		}else{
			description sqlType:"text"
		}
	}
	def beforeDelete(){

	}
	def beforeInsert() {
	}

	def beforeUpdate() {
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
