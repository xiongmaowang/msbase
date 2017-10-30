package com.ms.test

import com.ms.annotation.GridColumn
import com.ms.annotation.MSAction
import com.ms.annotation.MSActions
import com.ms.annotation.MSDomain
import com.ms.annotation.MSField
import com.ms.base.User
import com.ms.systemEnum.MSActionType

@MSActions(msAction = [
	@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
			@MSField(name = "testAName",label="testAName"  ),
			@MSField(name = "testP.testPName",label="testPName"  ),
			@MSField(name = "testP.testPInt",label="testPInt"  ),
			//@MSField(name = "testP.testCs",label="testCs"  )
	]),
	@MSAction(actionType = MSActionType.DELETE  ),
	@MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
			@MSField(name = "testP",label="testPName" ),
			@MSField(name = "testAName",label="testAName" ),
	])
])
@MSDomain(name = "A",controllerPackage = "com.ms.test",viewPackage = "com/ms/test")
class TestA {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	@GridColumn(name = "testAName")
	String testAName
	@GridColumn(name = "testP",visible = false)
	TestP testP
	@GridColumn(name = "testPName",target = "testP.testPName")
	def getTestPName(){
		testP?testP.testPName:""
	}
	//创建日期
	Date dateCreated
	Date lastUpdated
	User userCreated
	User userUpdated
    static constraints = {
    }
	static mapping = {
		testP cascade: "all"
	}
	def beforeInsert() {
		userCreated = springSecurityService?.getCurrentUser()
		userUpdated = springSecurityService?.getCurrentUser()
		TestP.withNewSession {
			testP?.save(flush: true)
		}
	}

	def beforeUpdate() {
		userUpdated = springSecurityService?.getCurrentUser()
	}
}
