package com.ms.base

import com.ms.base.util.TreeUtil

import grails.converters.JSON
import grails.gorm.DetachedCriteria

import java.text.DecimalFormat

class DictParamController {
	def dictParamHandle(){
		def model=[:]
		model["controller"]="dictParam"
		render view:'/base/handle.gsp',model:model
	}
	def dictParamEmb(){		
		def model = [:]
		def d=new DecimalFormat("000")
		def dictParam = DictParam.get(params.id) ? DictParam.get(params.id):new DictParam()
		//根节点 添加 判断
		if(params.type && params.type=="parent") {
			def dpList = new DetachedCriteria(DictParam.class).build({ like("id","___") order("id","desc") }).list()
			if(dpList.size()==0) {
				dictParam.id = "001"
			}else {
				dictParam.id = d.format(Integer.valueOf(dpList[0].id)+1)
			}
		}else {
			if(params.type && params.type=="add") {
				dictParam = new DictParam()
				def c = new DetachedCriteria(DictParam.class).build({ like("id",params.id+"___") order("id","desc") }).list()
				if(c.size()==0) {
					dictParam.id = params.id+"001"
				}else {
					def node = c[0].id
					def front = node.substring(0,node.length()-3)//前
					def back =node.substring(node.length()-3)//后3位
					back = d.format(Integer.valueOf(back)+1)
					dictParam.id = front+back
				}
			}
		}
		model["model"] = dictParam
		render view:'/base/dictParamEmbed.gsp',model:model
	}
	def getOperate(){
		render (TreeUtil.getOperTree(DictParam.class, params.id, [], request.getContextPath()+"/dictParam/dictParamEmb", "", request.getContextPath()+"/dictParam/dictParamDel","id") as JSON);
	}
	//删除节点
	def dictParamDel(){
		def resu = DictParam.get(params.id)
		def mes = resu?.delete(flush:true)
		def message = [:]
		message.put("result",0)
		//处于安全考虑，请不要直接接收返回，该演示案例
		//实现效果
		message.put("treeId",params.treeId)
		render message as JSON
	}
	//保存节点
	def dictParamSave() {
		withForm {
			boolean result =true
			def dictParam
				dictParam= DictParam.get(params.id) ? DictParam.get(params.id) : new DictParam()
				if(dictParam) {
					if(params.pid) {
						def parent = DictParam.get(params.pid)
						if(parent) {
							dictParam.parent = parent
						}
					}
					dictParam.dateCreated = new Date()
				}
			dictParam.properties = params
			dictParam.clearErrors()
			dictParam.id=params.id
			if(!dictParam.save()){
				result=false
			}
			render ([result:result] as JSON)
		}.invalidToken {
		// bad request
		}
	}
}
