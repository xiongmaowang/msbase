package com.ms.test


import com.ms.base.User
class TestD {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	String testDName
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
