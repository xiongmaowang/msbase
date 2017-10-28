package com.ms.base.util

import com.ms.base.template.NameUtil
import com.ms.base.template.TemplateUtil
import com.ms.tree.MsTreeCheckbox
import com.ms.tree.MsTreeOperate
import grails.util.Holders

/**
 * Created by zmd on 2017/1/9.
 */
class TreeUtil {
    //复选框树
    static def getTreeData(Class domainClass,String id,List checkedList,String fieldName=""){
        def objList;
        //初始化时页面回向后台传入id、name。这里的演示案例
        //我只需要id所以只接收id
        String nodeId = id
        //判断传入id是否为空，为空加载根节点
        if(!nodeId){
            objList = domainClass.findAllByParent(null)
        }
        //不为空则加载该nodeId下的子节点。
        if(nodeId){
            objList = domainClass.findAllByParent(domainClass.get(nodeId))
        }
        if(!fieldName){
            fieldName=findNameField(domainClass)
        }
        def mtList = [];
        objList.each{
            MsTreeCheckbox mt = new MsTreeCheckbox()
            mt.setId(it.id)
            mt.setName(it."${fieldName}")
            mt.setpId(nodeId)
            if(it.children||!it.parent){
                mt.setParent(0)
            }else{
                mt.setParent(1)
            }
            if(checkedList){
                if(it.id in checkedList){
                    mt.setChked(0)
                }else{
                    mt.setChked(1)
                }
            }else{
                mt.setChked(1)
            }
            mtList<<mt
        }
        mtList
    }



    //domainClass父类节点(树形结构)
    static def getTreeDataForDouble(Class domainClass,Class domainClass2,String id,List checkedList=[],String fieldName="",String fieldName2="",String domain1Field=""){
        def objList;
        //初始化时页面回向后台传入id、name。这里的演示案例
        //我只需要id所以只接收id
        String nodeId = id
        //判断传入id是否为空，为空加载根节点

        if(!fieldName){
            fieldName=findNameField(domainClass)
        }
        if(!fieldName2){
            fieldName2=findNameField(domainClass2)
        }
        if(!domain1Field){
            domain1Field=NameUtil.changeFirstName(domainClass2.simpleName,false)+"s"
        }
        if(!nodeId){
            objList = domainClass.findAllByParent(null)
        }
        //不为空则加载该nodeId下的子节点。
        if(nodeId){
            def domainObj=domainClass.get(nodeId)
            objList = domainClass.findAllByParent(domainObj)
            objList += domainObj."${domain1Field}"
        }
        def mtList = [];
        objList.each{
            MsTreeCheckbox mt = new MsTreeCheckbox()
            mt.setId(it.id)
            if(it.class==domainClass){
                mt.setName(it."${fieldName}")
                mt.setpId(nodeId)
                mt.setParent(0)
            }else{
                mt.setName(it."${fieldName2}")
                mt.setpId(nodeId)
                mt.setParent(1)
            }
            if(checkedList){
                if(it.id in checkedList){
                    mt.setChked(0)
                }else{
                    mt.setChked(1)
                }
            }else{
                mt.setChked(1)
            }
            mtList<<mt
        }
        mtList
    }

    static def getSelectData(Class domainClass,String id,List checkedList,String fieldName=""){
        //初始化时页面回向后台传入id、name。这里的演示案例
        //我只需要id所以只接收id
        String nodeId = id
        //判断传入id是否为空，为空加载根节点
        if(!fieldName){
            fieldName=findNameField(domainClass)
        }
        def query={
            try {
                if(TemplateUtil.getField("enabled",Holders.grailsApplication.getDomainClass(domainClass.name))){
                    eq("enabled",true)
                }
            }catch (e){
                e.printStackTrace()
            }
        }
        def objList = domainClass.createCriteria().list(query)
        def mtList = [];
        objList.each{
            MsTreeCheckbox mt = new MsTreeCheckbox()
            mt.setId(it.id)
            mt.setName(it."${fieldName}")
            mt.setpId(null)
            mt.setParent(1)
            if(checkedList){
                if(it.id in checkedList){
                    mt.setChked(0)
                }else{
                    mt.setChked(1)
                }
            }else{
                mt.setChked(1)
            }
            mtList<<mt
        }
        mtList
    }

    //复选框树
    static def getOperTree(Class domainClass,String id,List checkedList,String loadUrl,String editUrl,String delUrl,String fieldName=""){
        def objList;
        //初始化时页面回向后台传入id、name。这里的演示案例
        //我只需要id所以只接收id
        String nodeId = id
        //判断传入id是否为空，为空加载根节点
        if(!nodeId){
            objList = domainClass.findAllByParent(null)
        }
        //不为空则加载该nodeId下的子节点。
        if(nodeId){
            objList = domainClass.findAllByParent(domainClass.get(nodeId))
        }
        if(!fieldName){
            fieldName=NameUtil.changeFirstName(domainClass.simpleName,false)+"Name"
        }
        def mtList = [];
        objList.each{
            MsTreeOperate mt = new MsTreeOperate()
            mt.setId(it.id)
            mt.setName(it."${fieldName}")
            mt.setpId(nodeId)
            if(it.children||!it.parent){
                mt.setParent(0)
            }else{
                mt.setParent(1)
            }
            mt.setLoadMsTreeNodeUrl(loadUrl)
            mt.setEditMsTreeNodeUrl(editUrl)
            mt.setDelMsTreeNodeUrl(delUrl)
            mtList<<mt
        }
        mtList
    }

    static def findNameField(domainClass){
        def simple=NameUtil.changeFirstName(domainClass.simpleName,false)
        def field=domainClass.metaClass.hasProperty(domainClass,simple+"Name")
        if(field){
            return field.name
        }
        field=domainClass.metaClass.hasProperty(domainClass,simple+"name")
        if(field){
            return field.name
        }
        return "id"
    }

}
