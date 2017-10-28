package com.ms.tree

import java.io.Serializable

class BoatArea  {
	String areaCde //地区代码
	String areaName //地区名
	int areaLevel   //地区级别
	String snrArea  //上级地区代码
	int areaSeq		//地区排序值
	char status = '1'     //地区有效状态 1:有效 0:无效
	int parent = 0
	//创建时间
	Date dateCreated = new Date()
	//创建人
	String createUser
	//更新时间
	Date lastUpdated = new Date()
	String lastUpdatedUser
	static constraints = {
		areaName(nullable: true,blank:true)
		areaLevel(nullable: true,blank:true)
		snrArea(nullable: true,blank:true)
		areaSeq(nullable: true,blank:true)
		status(nullable: true,blank:true)
		createUser(nullable: true,blank:true)
		lastUpdated(nullable: true,blank:true)
		lastUpdatedUser(nullable: true,blank:true)
	}
	static mapping = {
		id generator: 'assigned', name: "areaCde", column: "area_cde"
		version false
	}
}