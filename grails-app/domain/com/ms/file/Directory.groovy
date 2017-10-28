package com.ms.file

/***
 * 文档目录
 *
 */
class Directory {
	
	String id
	
	//文档类别名
	String docName
	
	//显示顺序
	Integer serialNo
	
	
	//内容描述
	String description
	 
	//上级目录
	Directory parent
	
	//创建/发布时间
	Date dateCreated
	
	//创建人
	String createUser
	
	//更新时间
	Date lastUpdated
	def getFormattedDateCreated(){
		if(lastUpdated){
			return this.lastUpdated.format("yyyy-MM-dd")
		}else{
			return ""
		}
	}
	
	//最后更新人
	String lastUpdatedUser

	
	//按排序号顺序获取部门
	def getSortArea(){
		return this.children?.sort{e1,e2->
			def _1 = e1.serialNo?e1.serialNo:100
			def _2 = e2.serialNo?e2.serialNo:100
			return _1 - _2
		}
	}
	//获取地区详细名称 比如 浙江省舟山市定海区
	def formattedDirName(){
		def sb=new StringBuffer()
		formattedDir().each {sb.append("/${it.docName}")}
		sb.toString()
	}
	//获取该地区的父类数组[浙江省的Area对象,舟山市的Area对象,定海区的Area对象]
	def formattedDir(){
		def list=[]
		list<<this
		recursionDir(this.parent,list)
		list.reverse()
	}
	def recursionDir(areaP,list){
		if(areaP){
			list<< areaP
			recursionDir(areaP.parent,list)
		}
	}

	//获取所有子类
	def allChildren(){
		def list=[]
		list<<this
		recursionChildDir(this.children,list)
		list.removeAll([null])
		list
	}

	def recursionChildDir(node ,list){
		if(node){
			node.each{
				list<<it
				recursionChildDir(it.children,list)
			}
		}
	}
	//所属单位
	
	
	static hasMany = [children:Directory,attachMents:AttachMent]
	
	static transients = ["allUser"]
	
    static constraints = {
		
    } 
	static mapping = {
		cache : true
		children cascade : 'all-delete-orphan'
		attachMents cascade : 'all-delete-orphan'
	}
	def beforeDelete(){
	}
}
