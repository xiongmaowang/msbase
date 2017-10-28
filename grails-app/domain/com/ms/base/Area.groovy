package com.ms.base

import com.ms.annotation.GridColumn

class Area {
	
	String id
	
	//地区编号
	@GridColumn(name="地区编号",colIdx=1)
	String areaCode
	
	//地区名称
	@GridColumn(name="地区名称",colIdx=2)
	String areaName
	
	//显示顺序
	Integer serialNo
	
	
	//内容描述
	@GridColumn(name="描述",colIdx=5)
	String description
	
	//创建日期
	Date createdDate = new Date()
	
	
	//上级地区
	Area parent
	
	

	
	//按排序号顺序获取部门
	def getSortArea(){
		return this.children?.sort{e1,e2->
			def _1 = Integer.parseInt(e1.areaCode)?Integer.parseInt(e1.areaCode):100
			def _2 = Integer.parseInt(e2.areaCode)?Integer.parseInt(e2.areaCode):100
			return _1 - _2
		}
	}
	//获取地区详细名称 比如 浙江省舟山市定海区
	def formattedAreaName(){
		def sb=new StringBuffer()
		formattedArea().each {sb.append(it.areaName)}
		sb.toString()
	}
	//获取该地区的父类数组[浙江省的Area对象,舟山市的Area对象,定海区的Area对象]
	def formattedArea(){
		def list=[]
		list<<this
		recursionArea(this.parent,list)
		list.reverse()
	}
	def recursionArea(areaP,list){
		if(areaP){
			list<< areaP
			recursionArea(areaP.parent,list)
		}
	}
	//所属单位
	
	
	static hasMany = [children:Area]
	
	static transients = ["allUser"]
	
    static constraints = {
		
    } 
	static mapping = {
		cache : true
		sort areaCode: "asc"
	}
	def beforeDelete(){
		
	}
}
