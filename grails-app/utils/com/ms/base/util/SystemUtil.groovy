package com.ms.base.util

import grails.util.Holders;

import java.text.SimpleDateFormat
 

class SystemUtil {
	ConfigObject configObject = Holders.getConfig()
	
	def getRandName ={name->
		def sdf = new SimpleDateFormat("yyyyMMddHHmmssS")//格式化时间输出
		def rname = sdf.format(new Date())//取得当前时间，Date()是java.util包里的，这作为真实名称
		int i = name.lastIndexOf(".")//原名称里倒数第一个"."在哪里
		def ext = name.substring(i+1)//取得后缀，及"."后面的字符
		return rname+"."+ext//拼凑而成
	}
	
	def getUploadPath={ type ->
		
		if(type==null) type = "upload"
		
		def userPath
		if(configObject.getProperty("rostenFileConfig")){
			def webRootDir =configObject.getProperty("rostenFileConfig").fileUpload;
			userPath = webRootDir +"/" + type
		}else{
			userPath = "rostenFileUpload/" + type
		}
		def userDir = new File(userPath);
		userDir.mkdirs()
		return userPath
	}
	def getSizeLimit = {
		if(configObject.getProperty("rostenFileConfig")){
			return configObject.getProperty("rostenFileConfig").sizeLimit
		}else{
			return false
		}
	}
	def getUploadSize ={
		if(configObject.getProperty("rostenFileConfig")){
			return configObject.getProperty("rostenFileConfig").fileSize
		}else{
			return null
		}
	}
	def getDatabaseType ={
		//默认为mysql
		if(configObject.getProperty("rostenFileConfig")){
			return configObject.getProperty("rostenFileConfig").databaseType;
		}else{
			return "mysql"
		}
	}
	
}
