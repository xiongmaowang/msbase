package com.ms.base

import com.ms.annotation.GridColumn

class Model implements Comparable {
	def springSecurityService
	static transients = ["springSecurityService"]
	String id
	String modelUrl
	//模块名称
	@GridColumn(name="模块名称")
	String modelName

	//描述
	@GridColumn(name="描述")
	String description
	
	//显示顺序
	@GridColumn(name="显示顺序",colIdx=3)
	Integer serialNo =100
	//图标路径
	@GridColumn(name="图标路径",width="300px")
	String imgClass

	//上级model
	static belongsTo = [parent:Model]

	SortedSet  resources
	SortedSet  children
	static hasMany=[children:Model,resources:Resource]
	//创建日期
	Date dateCreated
	Date lastUpdated
	User userCreated
	User userUpdated

	def findFirsParent(){
		def parent
		def query
		query={
			if(it.parent){
				parent=it.parent
				query(it.parent)
			}
		}
		query(this)
		return parent
	}
	static constraints = {
		modelName blank: false  
	}
	static mapping = {
		children cascade: 'all-delete-orphan'
		resources cascade: 'all-delete-orphan'
		sort serialNo: "asc"
		cache : true
	}


	def beforeInsert() {
		userCreated = springSecurityService.getCurrentUser()
		userUpdated = springSecurityService.getCurrentUser()
	}

	def beforeUpdate() {
		userUpdated = springSecurityService.getCurrentUser()
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
