package com.ms.system

import com.ms.base.Model
import com.ms.base.Requestmap
import com.ms.base.Resource
import com.ms.base.Role
import com.ms.base.User


class SystemService {
	def springSecurityService
	static transactional = true


	private def initData_system ={path->
		def model = new Model()
		model.modelName = "系统管理"
		model.modelUrl = path + "/system/navigation"
		model.serialNo = 2
		model.description ="系统配置文件管理模块"
		model.save(flush: true)
		def resource = new Resource()
		resource.resourceName = "模块管理"
		resource.url = "modelManage"
		resource.serialNo=1
		resource.requestmap=addRequestMap(resource)
		resource.model=model
		resource.save(flush: true)
		
		resource = new Resource()
		resource.resourceName = "账号管理"
		resource.url = "userManage"
		resource.serialNo=2
		resource.requestmap=addRequestMap(resource)
		resource.model=model
		resource.save(flush: true)
		
		resource = new Resource()
		resource.resourceName = "角色管理"
		resource.url = "roleManage"
		resource.serialNo=3
		resource.requestmap=addRequestMap(resource)
		model.addToResources(resource)
		
		resource = new Resource()
		resource.resourceName = "部门管理"
		resource.url = "departManage"
		resource.serialNo=4
		resource.requestmap=addRequestMap(resource)
		resource.model=model
		resource.save(flush: true)

		resource = new Resource()
		resource.resourceName = "资源管理"
		resource.url = "resourceManage"
		resource.serialNo=5
		resource.requestmap=addRequestMap(resource)
		resource.model=model
		resource.save(flush: true)
		
		resource = new Resource()
		resource.resourceName = "日志管理"
		resource.url = "systemLogManage"
		resource.serialNo=6
		resource.requestmap=addRequestMap(resource)
		resource.model=model
		resource.save(flush: true)

		resource = new Resource()
		resource.resourceName = "地区管理"
		resource.url = "areaManage"
		resource.serialNo=7
		resource.requestmap=addRequestMap(resource)
		resource.model=model
		resource.save(flush: true)
		

	}
	def initData_first ={path->
		try{

			//删除当前单位下面的所有模块信息（除系统管理等基础模块）
			/*			def modelCodes = [
			 "system",
			 "workflow",
			 "public",
			 "sms",
			 "question",
			 "personconfig"
			 ]
			 Model.findAllByCompany(company).each{
			 if(!modelCodes.contains(it.modelCode)){
			 it.delete()
			 }
			 }
			 */
			path = path?path:""

			//系统管理
			//initData_system(path)

			//流程管理-------2016-4-28-----去除流程管理
			//			initData_workFlow(path,company,5)

			//个人工作台
			//initData_person(path,6)

			//公共资源
			//	initData_public(path)


		}catch(Exception e){
			print e.message
			return false
		}
		return true
	}

	def systemInit = { path ->

		if (User.findByUsername('admin')) {
			return
		}
		def admin = new User(
				username: 'admin',
				password: '1',
				chinaName: '系统管理员'
		)
		admin.save(flush: true)

		def systemModel = new Model(modelName: "系统管理", description: "系统管理", serialNo: 2, imgClass: "fa fa fa-bar-chart-o")
		systemModel.addToResources(beforeInsertResource(new Resource(resourceName:"用户管理",url:"user",controllerName:"user",serialNo: 1)))
		systemModel.addToResources(beforeInsertResource(new Resource(resourceName:"资源管理",url:"resource",controllerName:"resource",serialNo: 2)))
		systemModel.addToResources(beforeInsertResource(new Resource(resourceName:"模块管理",url:"model/modelHandle",controllerName:"model",serialNo: 3)))
		systemModel.addToResources(beforeInsertResource(new Resource(resourceName:"部门管理",url:"depart/departHandle",controllerName:"depart",serialNo: 4)))
		systemModel.addToResources(beforeInsertResource(new Resource(resourceName:"角色管理",url:"role",controllerName:"role",serialNo: 5)))
		systemModel.save(flush: true)
		new Resource(resourceName:"首页",url:"public/noneshow",serialNo: 1,defaultIndex: true,imgClass: "fa fa-home").save(flush: true)

		//2016-4-7---------------------去除电子邮件模块-------------------------------------------------
		//			model = new Model(modelName:"电子邮件",description:"电子邮件",serialNo:2,modelCode:"person")
		//			model.modelUrl = "/mail/navigation@tree"
		//			model.save(fialOnError:true)
		//---------------------------------------------------------------------------------------------

/*		model = new Model(modelName:"平台管理",description:"超级管理员系统平台配置文件管理模块",serialNo:3,modelCode:"plat")
		model.modelUrl = "/system/navigation"
*/
		/*	def resource = new Resource()
            resource.resourceName = "组织机构管理"
            resource.url = "companyManage"
            resource.imgUrl = "images/rosten/navigation/Organize.gif"
            resource.requestmap=addRequestMap(resource)
            model.addToResources(resource)

            resource = new Resource()
            resource.resourceName = "应用管理员"
            resource.url = "adminManage"
            resource.imgUrl = "images/rosten/navigation/Administrator.gif"
            resource.requestmap=addRequestMap(resource)
            model.addToResources(resource)

            resource = new Resource()
            resource.resourceName = "组织机构初始化"
            resource.url = "systemToolManage"
            resource.imgUrl = "images/rosten/navigation/OrganizeInit.gif"
            resource.requestmap=addRequestMap(resource)
            model.addToResources(resource)

            resource = new Resource()
            resource.resourceName = "广告管理"
            resource.url = "advertiseManage"
            resource.imgUrl = "images/rosten/navigation/Advertise.gif"
            resource.requestmap=addRequestMap(resource)
            model.addToResources(resource)

            resource = new Resource()
            resource.resourceName = "你问我答"
            resource.url = "questionManage"
            resource.imgUrl = "images/rosten/navigation/Question.gif"
            resource.requestmap=addRequestMap(resource)
            model.addToResources(resource)

            resource = new Resource()
            resource.resourceName = "短信管理"
            resource.url = "smsManage"
            resource.imgUrl = "images/rosten/navigation/Resource.gif"
            resource.requestmap=addRequestMap(resource)
            model.addToResources(resource)

            resource = new Resource()
            resource.resourceName = "日志管理"
            resource.url = "systemLogManage"
            resource.imgUrl = "images/rosten/navigation/log.gif"
            resource.requestmap=addRequestMap(resource)
            model.addToResources(resource)
            model.save(flush: true)*/
		def role = new Role(authority: '测试')
		initData_first(path)    //初始化模块资源
//		def test = new User(
//				username:'test',
//				password:'1',
//				chinaName:'测试人员'
//				)
//		test.save(flush: true)
		def rList = Resource.list()
		rList.each {
			role.addToResources(it)
			//UserResource.create(admin,it,true)
		}
		role.save(flush: true)
		//UserRole.create(test, role, true)
		//工作流的限制初始化
/*		def workFLowStringList = ["analyse","document","emailEventReceiverJob","extendedProcessManagement","grailsFlowSecure"
			,"processActionDef","process","processDef","processDetails","processList","processManagement","processNodeDef","processTransitionDef"
			,"processVarDef","schedulerDetails","userProcessList","userRole","worklist"]
		workFLowStringList.each{
			def r=new Requestmap("/${it}*//**","ROLE_${it}")
		 r.save()
		 }*/
		//系统基本
		def r1 = new Requestmap('/js/**', 'IS_AUTHENTICATED_ANONYMOUSLY')
		r1.save()
		r1 = new Requestmap('/css/**', 'IS_AUTHENTICATED_ANONYMOUSLY')
		r1.save()
		r1 = new Requestmap('/images/**', 'IS_AUTHENTICATED_ANONYMOUSLY')
		r1.save()
		r1 = new Requestmap('/login/**', 'IS_AUTHENTICATED_ANONYMOUSLY')
		r1.save()
		r1 = new Requestmap('/logout/**', 'IS_AUTHENTICATED_ANONYMOUSLY')
		r1.save()
		r1 = new Requestmap('/**', 'IS_AUTHENTICATED_REMEMBERED')//IS_AUTHENTICATED_REMEMBERED
		r1.save(flush: true)
		springSecurityService.clearCachedRequestmaps()

	}

	def addRequestMap(Resource r){
		def index=r.url.indexOf("Manage")
		if(index!=-1){
			return new Requestmap("/${r.url.substring(0,index)}/**","ROLE_$r.url")
		}
		return null
	}

	def utilInit(){
		//字符串转化为日期
		Date.metaClass.'static'.msParse = { str ->
			com.mdimension.jchronic.Chronic.parse(str)?.beginCalendar?.time
		}
		Date.metaClass.msToDateStart={
			Calendar c =delegate.toCalendar()
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			c.set(Calendar.MILLISECOND, 0);
			c.getTime()
		}
		Date.metaClass.msToDateEnd={
			Calendar c =delegate.toCalendar()
			c.set(Calendar.HOUR_OF_DAY, 23);
			c.set(Calendar.MINUTE, 59);
			c.set(Calendar.SECOND, 59);
			c.set(Calendar.MILLISECOND, 0);
			c.getTime()
		}
	}
	def beforeInsertResource(resource){
		if(resource.getAuthority()){
			if(resource.requestmap){
				resource.requestmap.url="/${resource.controllerName}/**"
				resource.requestmap.configAttribute=resource.getAuthority()
			}else{
				resource.requestmap=new Requestmap("/${resource.controllerName}/**",resource.getAuthority())
			}
		}
		return resource
	}


}
