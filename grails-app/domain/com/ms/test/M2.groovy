package com.ms.test

import com.ms.annotation.MSAction
import com.ms.annotation.MSActions
import com.ms.annotation.MSDomain
import com.ms.annotation.MSField
import com.ms.base.User
import com.ms.systemEnum.MSActionType

@MSActions(msAction = [
		@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
				@MSField(name = "m1s",label="m1s"  ),
				@MSField(name = "m2Name",label="m2Name"  )
		]),
		@MSAction(actionType = MSActionType.DELETE  ),
		@MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
				@MSField(name = "m2Name",label="m2Name" ),
		])
])
@MSDomain(name = "m2")
class M2 {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	String m2Name
	static hasMany = [m1s:M1]
	static belongsTo = [M2]

	//创建日期
	Date dateCreated
	Date lastUpdated
	User userCreated
	User userUpdated
    static constraints = {
    }
	static mapping = {
		m1s joinTable: [name: "tb_m1_m2", key: 'm2_id']
	}
	def beforeInsert() {
		userCreated = springSecurityService?.getCurrentUser()
		userUpdated = springSecurityService?.getCurrentUser()
	}

	def beforeUpdate() {
		userUpdated = springSecurityService?.getCurrentUser()
	}
}
