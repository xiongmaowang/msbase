package com.ms.test

import com.ms.annotation.MSAction
import com.ms.annotation.MSActions
import com.ms.annotation.MSDomain
import com.ms.annotation.MSField
import com.ms.base.User
import com.ms.systemEnum.MSActionType

@MSActions(msAction = [
		@MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
				@MSField(name = "m2s",label="m2s"  ),
				@MSField(name = "m1Name",label="m1Name"  )
		]),
		@MSAction(actionType = MSActionType.DELETE  ),
		@MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
				@MSField(name = "m1Name",label="m1Name" ),
		])
])
@MSDomain(name = "m1")
class M1 {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	String m1Name
	static hasMany = [m2s:M2]

	static belongsTo = [M2]

	//创建日期
	Date dateCreated
	Date lastUpdated
	User userCreated
	User userUpdated
    static constraints = {
    }
	static mapping = {
		m2s joinTable: [name: "tb_m1_m2", key: 'm1_id']
	}
	def beforeInsert() {
		userCreated = springSecurityService?.getCurrentUser()
		userUpdated = springSecurityService?.getCurrentUser()
	}

	def beforeUpdate() {
		userUpdated = springSecurityService?.getCurrentUser()
	}
	def beforeDelete(){
		M2.withNewSession {
			M2.createCriteria().list{m1s{eq("id",id)}}?.each { M2 m2->
				m2.m1s.removeAll {m1->
					m1.id==id
				}
				println m2.m1s
				m2.save(flush:true)
			}
		}
	}

}
