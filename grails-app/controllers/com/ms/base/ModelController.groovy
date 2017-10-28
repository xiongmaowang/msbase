package com.ms.base

import com.ms.base.util.TreeUtil
import grails.converters.JSON

class ModelController {
	def modelHandle(){
		def model=[:]
		model["controller"]="model"
		render view:'/base/handle.gsp',model:model
	}
	def modelEmb(){		
		def model = [:]
		def m = Model.get(params.id)
		if(params.type && params.type=="add") {
			m = new Model()
		}
		model["model"] = m
		render view:'/base/modelEmbed.gsp',model:model
	}
	def getOperate(){
		render (TreeUtil.getOperTree(Model.class, params.id, [], request.getContextPath()+"/model/modelEmb", "", request.getContextPath()+"/model/modelDel") as JSON);
	}
	//删除节点
	def modelDel(){
		def resu = Model.get(params.id)
		def mes = resu?.delete(flush:true)
		def message = [:]
		message.put("result",0)
		//处于安全考虑，请不要直接接收返回，该演示案例
		//实现效果
		message.put("treeId",params.treeId)
		render message as JSON
	}
	//保存节点
	def modelSave() {
		withForm {
			boolean result =true
			def model
			if(params.id){
				model= Model.get(params.id)
			}else{
				model=new Model()
				def parent = Model.get(params.pid)
				model.dateCreated = new Date()
				model.parent = parent
			}
			model.properties = params
			model.clearErrors()
			if(!model.save()){
				result=false
			}
			render ([result:result] as JSON)
		}.invalidToken {
		// bad request
		}
	}
}
