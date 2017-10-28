package com.ms.tree

import grails.converters.JSON
import grails.gorm.DetachedCriteria
class TestTreeDataController {
	//下拉选树
	def getInput(){
		def areaList1;
		//初始化时页面回向后台传入id、name。这里的演示案例
		//我只需要id所以只接收id
		String nodeId = request.getParameter("id")
		//判断传入id是否为空，为空加载根节点
		if(nodeId==null){
			areaList1 = BoatArea.findBySnrArea("")
		}
		//不为空则加载该nodeId下的子节点。
		if(nodeId!=null){
			areaList1 = BoatArea.findAllBySnrArea(nodeId)
		}
		def areaList = [];
		areaList1.each{
			MsTree mt = new MsTree()
			mt.setId(it.areaCde)
			mt.setName(it.areaName)
			mt.setpId(it.snrArea)
			mt.setParent(it.parent)
			areaList.add(mt)
		}
		render areaList as JSON;
	}
	
	//复选框树
	def getchbox(){
		println  params
		def areaList1;
		//初始化时页面回向后台传入id、name。这里的演示案例
		//我只需要id所以只接收id
		String nodeId = request.getParameter("id")
		//判断传入id是否为空，为空加载根节点
		if(nodeId==null){
			areaList1 = BoatArea.findBySnrArea("")
		}
		//不为空则加载该nodeId下的子节点。
		if(nodeId!=null){
			areaList1 = BoatArea.findAllBySnrArea(nodeId)
		}
		def areaList = [];
		areaList1.each{
			MsTreeCheckbox mt = new MsTreeCheckbox()
			mt.setId(it.areaCde)
			mt.setName(it.areaName)
			mt.setpId(it.snrArea)
			mt.setParent(it.parent)
			mt.setChked(1)
			areaList.add(mt)
		}
		render areaList as JSON;
	}
	def getOperate(){
		def areaList1;
		//初始化时页面回向后台传入id、name。这里的演示案例
		//我只需要id所以只接收id
		String nodeId = request.getParameter("id")
		//判断传入id是否为空，为空加载根节点
		if(nodeId==null){
			areaList1 = BoatArea.findBySnrArea("")
		}
		//不为空则加载该nodeId下的子节点。
		if(nodeId!=null){
			areaList1 = BoatArea.findAllBySnrArea(nodeId)
		}
		def areaList = [];
		areaList1.each{
			MsTreeOperate mt = new MsTreeOperate()
			mt.setId(it.areaCde)
			mt.setName(it.areaName)
			mt.setpId(it.snrArea)
			mt.setParent(it.parent)
			mt.setLoadMsTreeNodeUrl("emb")
			mt.setEditMsTreeNodeUrl("../testTreeData/testEdit")
			mt.setDelMsTreeNodeUrl("../testTreeData/testDel")
			areaList.add(mt)
		}
		render areaList as JSON;
	}
	//点击编辑时获取编辑几点的所有信息，并返回到前端
	def testEdit(){
		def query={
			//地区代码
			if(params.id){
				eq("areaCde",params.id)
			}
			//上级地区代码
			if(params.pId){
				eq("snrArea",params.pId)
			}
			//地区名称
			if(params.name){
				eq("areaName",params.name)
			}
		}
		def c = new DetachedCriteria(BoatArea.class).build(query)
		def res = c.list(params)
		def edit = [:]
		if(res.size() >= 1){
			edit.put("result","0")
		}else{
			edit.put("result","1")
		}
		res.each {
			edit.put("id",it.areaCde)
			edit.put("leve",it.areaLevel)
			edit.put("name",it.areaName)
			edit.put("sep",it.areaSeq)
			edit.put("pId",it.snrArea)
			if(it.status=='1'){
				edit.put("status", "有效")
			}else{
				edit.put("status", "无效")
			}
		}
		edit.put("treeId",params.treeId)
		render edit as JSON
	}
	//删除节点
	def testDel(){
		def resu = BoatArea.findByAreaCde(params.id)
		def mes = resu?.delete(flush:true)
		def message = [:]
		message.put("result",0)
		//处于安全考虑，请不要直接接收返回，该演示案例
		//实现效果
		message.put("treeId",params.treeId)
		render message as JSON
	}
	//保存节点
	def saveTree() {
		def message = [:]
		message.put("result",false)
		def boatArea = new BoatArea()  
		boatArea.properties = params
		if(params.areaCde=="" || params.areaCde==null) {
			boatArea.areaCde = UUID.randomUUID()
			boatArea.areaLevel = boatArea.areaLevel+1
			if(boatArea.save(flush:true)) {
				message.put("result",true)
			}
		}else {
			if(boatArea.save(flush:true)) {
				message.put("result",true)
			}
		}
		render message as JSON
	}
}