package com.ms.file
import com.ms.base.util.SystemUtil

import grails.converters.JSON

class FileService {
	def grailsApplication
	//获取上传路径 并进行路径测试
	def getUploadPath={ type,json->
		def userPath="${grailsApplication.config.msFileConfig.fileUploadPath}$type"
		def userDir = new File(userPath)
		userDir.mkdirs()
		if(!userDir.exists()){
			json["result"] = "diskError"
			return userPath
		}
		return userPath
	}
	//适用于多文件上传,需要一个json["list"]=[] 的map  和一个def files = request.getFiles("uploadFiles[]")  的files对象  ,一个上传路径 和 当前用户
	def fileUpload(json,file,uploadPath,currentUser){		
		SystemUtil sysUtil = new SystemUtil() 
			def realName=""
			if(file. getOriginalFilename()){
				realName=file. getOriginalFilename()
			}
			def index=realName.lastIndexOf(".")
			def type=""
			if(index!=-1){
				type=realName.substring(index+1).toUpperCase()
			}
			def size=file.size
			String fileName =sysUtil.getRandName(realName) //获得文件原始的名称
			def url="${uploadPath}/${fileName}"			
			def ath=new AttachMent(name:fileName,url:url,realName:realName,attachMentSize:size,userName:currentUser?.chinaName)
			ath.save()
			def fileObject=['realName':file. getOriginalFilename(),'type':type,'attachMentSize':size,'id':ath?.id]
			json["list"]<<fileObject
			file.transferTo(new File("${uploadPath}",fileName)) 
	}
	def attachDeletOne={id,json->
		try {
			AttachMent.get(id).delete()
		} catch (Exception e) {
			log.error("删除attach错误")
			json['result']='error'
		}
	}
	
	
	//单文件上传并获取上传后的路径、文件名 add by wei 2016-11-23
	def uploadFile(f,cuser){
		def json = [:]
		try {
			SystemUtil sysUtil = new SystemUtil()
			def uploadPath
			if(cuser){
				uploadPath = getUploadPath(cuser?.type,json)
			}else{
				uploadPath = getUploadPath("cuser",json)
			}
			if(json["result"]=="diskError"){
				return json
			}
//			def f = request.getFile("myfile")
			if (f.empty) {
				json["result"] = "blank"
				return json
			}
			
			json["sizes"] = f.size
			def realName = ""
			if(f?.getOriginalFilename()){
				realName = f.getOriginalFilename()//获得文件原始的名称
			}
			json["realName"] = realName
			
			def fileName = sysUtil.getRandName(realName)
			json["fileName"] = fileName
			
			//判断上传的路径是否有重名文件
			def imageUrl = "${uploadPath}/${fileName}"
			println "imageUrl"+imageUrl
			f.transferTo(new File("${uploadPath}",fileName))
			if(!json["result"]){
				json["result"] = "true"
			}
			json["fileUrl"] = imageUrl
			
		} catch (Exception e) {
			e.printStackTrace()
			json["result"] = "false"
		}
		return json
	}
	
	
}
