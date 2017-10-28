package com.ms.file

import com.ms.base.template.TemplateUtil
import com.ms.base.util.TreeUtil
import org.codehaus.groovy.grails.commons.GrailsDomainClass

import javax.servlet.http.HttpServletResponse

import com.ms.base.Ueditor
import com.ms.base.util.SystemUtil

import grails.converters.JSON

class PublicController {
	def grailsApplication
	//文件上传
	def fileView(){
		render view:'/file/fileupload'
	}
	//图片上传
	def pictureFile() {
		render view:'/file/pictureFile'
	}
	//富文本编辑器
	def simditor() {
		render view:'/file/simditor'
	}
	//日期选择器
	def datetimeView() {
		render view:'/file/datetimepicker'
	}
	def aa(){
		//println Date.msParse("1992 10 11")
		GrailsDomainClass a=grailsApplication.getDomainClass("com.ms.base.Depart")
		//println TemplateUtil.getFieldByList(['model','modelName'],a)
		def bb=TemplateUtil.getFieldByList("users".split("\\.") as List,a).referencedPropertyType
	}
    def fileUpload() {
		def json = [:]
		SystemUtil sysUtil = new SystemUtil()
		def file=params.file
		def realName = file.getOriginalFilename()
		def index=realName.lastIndexOf(".")
		def type=""
		if(index!=-1){
			type=realName.substring(index+1).toUpperCase()
		}
		def size=file.size
		def fileName =sysUtil.getRandName(realName) //获得文件原始的名称
		def uploadPath="D://file"
		def path = new File(uploadPath)
		if(!path.exists()){
			path.mkdirs()
		}
		def url="${uploadPath}/${fileName}"
		file.transferTo(new File("${uploadPath}",fileName))
		def ath=new AttachMent(name:fileName,url:url,realName:realName,attachMentSize:size,createUser:"金少波")
		if(ath.save(flush:true)) {
			json["ath"]=ath
		}
		render json as JSON
	}
	//保存富文本内容
	def editorSave() {
		def editor = new Ueditor()
		editor.properties=params
		if(editor.save(flush:true)) {
			println "文本保存成功"
			render view:'/file/simditor'
		}else {
			response.sendError (HttpServletResponse.SC_METHOD_NOT_ALLOWED, "服务器忙，请稍后再登录！")
		}
		
	}
	
	//获取富文本===测试
	def obtainEditor() {
		def model = [:]
		def editorList = Ueditor.list()
		
		def editor
		if(editorList.size>0) {
			editor=editorList.get(0)
		}
		model["editor"] = editor
		render view:'/file/editorShow' , model:model
	}

	def selectTree(){
		def domain =Class.forName(params.domain)
		def select=(params.select?params.select:"").split(",") as ArrayList
		render (TreeUtil.getTreeData(domain,params.id,select) as JSON)
	}
	def treeDataForDouble(){
		def domain =Class.forName(params.domain)
		def domain2 =Class.forName(params.domain2)
		def select=(params.select?params.select:"").split(",") as ArrayList
		render (TreeUtil.getTreeDataForDouble(domain,domain2,params.id,select) as JSON)
	}
	def select(){
		println params
		def domain =Class.forName(params.domain)
		def select=(params.select?params.select:"").split(",") as ArrayList
		render (TreeUtil.getSelectData(domain,params.id,select) as JSON)
	}

	def noneshow(){
		redirect (url:"http://www.jq22.com/demo/hAdmin20161102/index_v1.html")
	}
}
