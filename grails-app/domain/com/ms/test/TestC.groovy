package com.ms.test

import com.ms.annotation.MSAction
import com.ms.annotation.MSActions
import com.ms.annotation.MSDomain
import com.ms.annotation.MSField
import com.ms.base.User
import com.ms.systemEnum.MSActionType
import com.ms.systemEnum.MSTemplate

@MSActions(msAction = [
		@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
				@MSField(name = "testP",label="testP" ),
				@MSField(name = "testCName",label="testCName" )
		]),
		@MSAction(actionType = MSActionType.DELETE  ),
		@MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
		])
])
@MSDomain(name = "C")
class TestC {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	String testCName
	static belongsTo = [testP:TestP]
	//创建日期
	Date dateCreated
	Date lastUpdated
	User userCreated
	User userUpdated
    static constraints = {
    }
	static mapping = {

	}
	def beforeInsert() {
		userCreated = springSecurityService?.getCurrentUser()
		userUpdated = springSecurityService?.getCurrentUser()
	}

	def beforeUpdate() {
		userUpdated = springSecurityService?.getCurrentUser()
	}
}
