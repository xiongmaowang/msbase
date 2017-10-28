package com.ms.test

import com.ms.annotation.*
import com.ms.base.User
import com.ms.file.AttachMent
import com.ms.systemEnum.MSActionType
import com.ms.systemEnum.MSTemplate

@MSActions(msAction = [
		@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
				@MSField(name = "testPName",label="testPName" ,msTemplate = MSTemplate.DICTSELECT,value = "1" ),
				@MSField(name = "testPInt",label="testPInt"  ),
				@MSField(name = "testPBol",label="testPBol"  ),
				@MSField(name = "content",label="content"  ),
				@MSField(name = "att",label="att"  ),
				@MSField(name = "testCs",label="testCs",msTemplate = MSTemplate.DATATABLEEDIT  )
		]),
		@MSAction(actionType = MSActionType.DELETE  ),
		@MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
				@MSField(name = "testPName",label="testPName" ,msTemplate = MSTemplate.DICTSELECT,value = "1" ),
				@MSField(name = "testPInt",label="testPInt"  ),
				@MSField(name = "testPShort",label="testPShort"  ),
				@MSField(name = "testPBigInteger",label="testPBigInteger"  ),
				@MSField(name = "testPDouble",label="testPDouble"  ),
				@MSField(name = "testPByte",label="testPByte"  ),
				@MSField(name = "testPBol",label="testPBol"  ),
				@MSField(name = "content",label="content"  ),
				@MSField(name = "dateCreated",label="dateCreated"  ),
				@MSField(name = "testCs",label="testCs",msTemplate = MSTemplate.DATATABLEEDIT  )
		])
])
@MSDomain(name = "P")
class TestP {
	def springSecurityService
	static transients = ["springSecurityService"]
	//@GridColumn(name="登陆名",defaultOrder = true, defaultOrderType = "desc" )
	String id
	@GridColumn(name = "name")
	String testPName
	@GridColumn(name = "int")
	Integer testPInt
	short testPShort
	BigInteger testPBigInteger
	Double testPDouble
	Byte testPByte
	String content
	@GridColumn(name = "int")
	boolean testPBol
	AttachMent att
	//static belongsTo = [testA:TestA]
	static hasMany = [testCs:TestC]
	//创建日期
	@GridColumn(name = "dateCreated")
	Date dateCreated
	Date lastUpdated
	User userCreated
	User userUpdated
    static constraints = {
    }
	static mapping = {
		testCs cascade: 'all-delete-orphan'
	}
	def beforeInsert() {
		userCreated = springSecurityService?.getCurrentUser()
		userUpdated = springSecurityService?.getCurrentUser()
	}

	def beforeUpdate() {
		userUpdated = springSecurityService?.getCurrentUser()
	}
}
