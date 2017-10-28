package com.ms.base.util

import com.ms.annotation.GridColumn
import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.codecs.HTMLCodec

import java.lang.reflect.Method
import java.lang.reflect.Modifier

/**
 * Created by zmd on 2016/12/6.
 */
class GridTableUtil {

    //生成ColumnDefs和Sort对象 第一个
    static def buildColumnDefs(List fmList,List gridColumns,boolean serverSide){
        //加个默认值 id
        def columdefs = [[data:"id",name:"id",visible:false,searchable:false,orderable:false]]
        def defaultSort = []
        //如果某个注解返回的是function或者JSONObj 需要传到前台做循环赋值
        def functionData =[:]
        //用来避免方法都指向name值重复
        def nameList=fmList*.name as Set
        def ajaxData=[htmlEncode:[true],orderTarget:[""]]
        fmList.eachWithIndex{it,i ->
            def name=""
            def gridColumn =gridColumns[i]
            def exIdIndex=i+1
            //target给id让位
            def column = [:]
            def orderTarget =""
            if(it instanceof Method){
                if(gridColumn.target()&&!(gridColumn.target() in nameList)){
                    name=gridColumn.target()
                }else{
                    name="${it.name}()"
                }
                column["data"]="${it.name}{}"
                column["orderable"] = gridColumn.orderable()
                if(gridColumn.orderable()&&gridColumn.target()) {
                    orderTarget = gridColumn.target()
                }else{
                    if(serverSide){
                        column["orderable"]=false
                    }
                }
            }else{
                column["data"]=it.name
                name=it.name
                column["orderable"] = gridColumn.orderable()
            }
            column["name"]=name
            column["visible"]=gridColumn.visible()
            column["searchable"]=gridColumn.searchable()
            if(gridColumn.defaultContent()){
                column["defaultContent"]=gridColumn.defaultContent()
            }
            if(gridColumn.defaultOrder() && column["orderable"]){
                defaultSort<<[column["data"],gridColumn.defaultOrderType(),gridColumn.defaultOrderIndex()]
            }
            if(gridColumn.width()){
                column["width"]=gridColumn.width()
            }
            if(gridColumn.orderData()){
                column["orderData"]=gridColumn.orderData()
            }
            if(gridColumn.orderDataType()){
                column["orderDataType"]=gridColumn.orderDataType()
            }
            if(gridColumn.orderSequence()){
                column["orderSequence"]=gridColumn.orderSequence()
            }
            if(gridColumn.className()){
                column["className"]=gridColumn.className()
            }
            if(gridColumn.cellType()){
                column["cellType"]=gridColumn.cellType()
            }
            if(gridColumn.contentPadding()){
                column["contentPadding"]=gridColumn.contentPadding()
            }
            if(gridColumn.createdCell()){
                functionData[[exIdIndex,"createdCell"]]=gridColumn.createdCell()
            }
            column["type"] = gridColumn.type()
            ajaxData.orderTarget<<orderTarget
            ajaxData.htmlEncode<<gridColumn.htmlEncode()
            columdefs<<column
            nameList<<name
        }
        defaultSort.sort{a,b->
                a[2]<=>b[2]
        }
        [columdefs,defaultSort,functionData,ajaxData]
    }
    static def buildColumnDefs(List fmList,List gridColumns,Map defaultMap,serverSide){
        def (columdefs,defaultSort,functionData,ajaxData)=buildColumnDefs(fmList,gridColumns,serverSide)
        if(defaultMap["orderNumber"]){
            columdefs.add(1,[data:"orderNumber",name:"orderNumber",className:"ms_align_center",searchable:false,orderable:false])
            ajaxData["htmlEncode"].add(1,true)
            ajaxData["orderTarget"].add(1,"")
        }
        if(defaultMap["multiSelect"]){
            columdefs.add(1,[data:"multiSelect",name:"multiSelect",searchable:false,orderable:false])
            ajaxData["htmlEncode"].add(1,true)
            ajaxData["orderTarget"].add(1,"")
        }
        if(defaultMap["actionList"]){
            columdefs<<[data:"actionList",name:"actionList",className:"ding_control",searchable:false,orderable:false]
            ajaxData["htmlEncode"]<<true
            ajaxData["orderTarget"]<<""
        }
        ajaxData["defaultMap"]=defaultMap
        [columdefs,getIndexDefaultSort(defaultSort,columdefs),functionData,ajaxData]
    }

    static def buildColumnDefs(Class domainClass ,tableId){
        def (fmList,gridColumns) = reflectClass(domainClass,tableId)
        buildColumnDefs(fmList,gridColumns)
    }

    //获取排序完后的所有有注解的方法和field
    static def reflectClass(domainClass ,tableId){

        def fmList=(grepField(domainClass.getDeclaredFields(),tableId)+grepMethod(domainClass.getDeclaredMethods(),tableId)).sort { a, b ->
            a.getAnnotation(GridColumn.class).colIdx() <=> b.getAnnotation(GridColumn.class).colIdx()
        }
        [fmList,fmList*.getAnnotation(GridColumn.class)]
    }

    static private def grepField(array,tableId){
       array?array.grep{it.getAnnotation(GridColumn.class)&&(!tableId||!(tableId in it.getAnnotation(GridColumn.class).unusableTableIds()))} : []
    }
    static private def grepMethod(array,tableId){
        //排除所有静态方法 避免domain类自动生成的方法在修改domain类后报错的问题
        array?array.grep{!Modifier.isStatic(it.getModifiers())&&it.getAnnotation(GridColumn.class)&&(!tableId||!(tableId in it.getAnnotation(GridColumn.class).unusableTableIds()))} : []
    }
    static private def getIndexDefaultSort(defaultSort,columdefs){
        def indexDefaultSort =[]
        defaultSort.each{
            indexDefaultSort<<[columdefs.findIndexOf { column->     column["data"]==it[0]},it[1]]
        }
        indexDefaultSort
    }

}
