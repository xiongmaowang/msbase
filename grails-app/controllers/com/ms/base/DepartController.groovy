package com.ms.base

import com.ms.base.util.TreeUtil
import grails.converters.JSON

class DepartController {
	def departHandle(){
		def model=[:]
		model["controller"]="depart"
		render view:'/base/handle.gsp',model:model
	}
	def departEmb(){		
		def model = [:]
		def m = Depart.get(params.id)
		if(params.type && params.type=="add") {
			m = new Depart()
		}
		model["model"] = m
		render view:'/base/departEmbed.gsp',model:model
	}
	def getOperate(){
		render (TreeUtil.getOperTree(Depart.class, params.id, [], request.getContextPath()+"/depart/departEmb", "", request.getContextPath()+"/depart/departDel") as JSON);
	}
	//删除节点
	def departDel(){
		def resu = Depart.get(params.id)
		def mes = resu?.delete(flush:true)
		def message = [:]
		message.put("result",0)
		//处于安全考虑，请不要直接接收返回，该演示案例
		//实现效果
		message.put("treeId",params.treeId)
		render message as JSON
	}
	//保存节点
	def departSave() {
		withForm {
			boolean result =true
			def depart
			if(params.id){
				depart= Depart.get(params.id)
			}else{
				depart=new Depart()
				def parent = Depart.get(params.pid)
				depart.parent = parent
			}
			depart.properties = params
			depart.clearErrors()
			if(!depart.save()){
				result=false
			}
			render ([result:result] as JSON)
		}.invalidToken {
		// bad request
		}
	}
}
