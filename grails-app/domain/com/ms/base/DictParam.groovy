package com.ms.base

import java.util.SortedSet

import com.google.javascript.jscomp.parsing.parser.trees.ThisExpressionTree
import com.ms.annotation.GridColumn

/**
 * 系统字典表
 * @author King
 *
 */
class DictParam implements Comparable {
	def springSecurityService
	static transients = ["springSecurityService"]
	@GridColumn(name="代码",colIdx=1)
	String id
	//String dictParamName
//	@GridColumn(name="父代码",colIdx=2)
//	String parCodeNumer
	static belongsTo = [parent:DictParam]
	
	@GridColumn(name="中文名称",colIdx=3)
	String cnm
	@GridColumn(name="英文名称",colIdx=4)
	String enm
//	@GridColumn(name="失效标志(0有效,1失效)")
	boolean enabled = true
	
	@GridColumn(name="失效标志",colIdx=5)
	def getEnabledValue(){
		if(enabled)return "有效"
		else return "失效"
	}
	@GridColumn(name="备注")
	String remark

	@GridColumn(name="显示顺序",colIdx=3)
	Integer serialNo =100
	//是否为父节点 true为是   false为不是
	//boolean nodeFlag
	
	SortedSet  children
	static hasMany=[children:DictParam]
	
	Date dateCreated  //创建时间
	String createUser //创建人
	Date lastUpdated//最后修改时间
	String lastUpdatedUser//最后修改人
	
	
	static constraints = {
		id blank: false
	}
	static mapping = {
		id generator: 'assigned'
		sort serialNo: "asc"
		children cascade: 'all-delete-orphan'
		cache : true
	}
	
	def beforeInsert() {
		createUser = springSecurityService.getCurrentUser()
		lastUpdatedUser = springSecurityService.getCurrentUser()
	}

	def beforeUpdate() {
		lastUpdatedUser = springSecurityService.getCurrentUser()
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
