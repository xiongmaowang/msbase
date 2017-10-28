package com.ms.base

import com.ms.annotation.GridColumn
class Ad {
	String id
	   
	//logo名称
	@GridColumn(name="广告名称",colIdx=1)
	String adName
	
	String imgFileName
	@GridColumn(name="图片地址",colIdx=4)
	String imgFilePath
	
	//链接
	@GridColumn(name="链接",colIdx=5)
	String url
	
	//创建日期
	Date createdDate = new Date()
	 
	
	
    static constraints = {
		adName nullable:false,blank:true
		imgFileName nullable:true,blank:true
		imgFilePath nullable:false,blank:true
    }
	static mapping = {
		cache : true
	}
	
}
