package com.ms.msbase

import com.lowagie.text.html.HtmlParser
import com.ms.base.util.GridTableUtil



//参数 id domainClass width cellspacing serverSide (multiSelect actionList) ,customTable,URL,defaultScript
class DataTableTagLib {
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static defaultEncodeAs = [taglib:'none']
    static namespace = "ms"
    def dataTable={attrs,body ->
        if (!(attrs.domainClass instanceof Class)){
            throwTagError("标签 [ms:dataTable] 缺乏必须的属性 [domainClass] 且该属性必须为Class对象")
        }
        if (!attrs.id){
            throwTagError("标签 [ms:dataTable] 缺乏必须的属性 [id]")
        }
        if(attrs.actionList&& !(attrs.actionList instanceof List)){
            throwTagError("标签 [ms:dataTable] 属性actionList必须为List对象")
        }
/*        def customTable=attrs.customTable
        if(customTable){
            if(!(customTable instanceof List)){
                throwTagError("标签 [ms:dataTable] 属性customTable必须为List对象")
            }
            try {
                customTable.each{
                    if(it["getMethod"]&&it["field"]){
                        throwTagError("标签 [ms:dataTable] 属性customTable这个list里的对象必须有个getMethod属性或者field属性")
                    }else if(!it["getMethod"]&&it["field"]){
                        it["getMethod"]="get$field"
                    }
                }
            }catch (e){
                throwTagError("标签 [ms:dataTable] 属性customTable这个list里的对象必须为map")
            }

        }*/
        boolean defaultScript=attrs.defaultScript?attrs.boolean("defaultScript"):false
        if(defaultScript&&!attrs.url){
            throwTagError("标签 [ms:dataTable] 属性defaultScript为true 的话必须指定url")
        }
        def model =[:]
        def tableFieldStringList = []
        tableFieldStringList<<"id='${attrs.id}'"
        tableFieldStringList<<"class='${attrs.class?attrs.class:"table table-striped table-bordered table-hover dataTables-example"}'"
        tableFieldStringList<<"width='${attrs.width?attrs.width:"100%"}'"
        tableFieldStringList<<"cellspacing='${attrs.cellspacing?attrs.cellspacing:"0"}'"
        def tableField=tableFieldStringList.join(" ")
        boolean serverSide=attrs.serverSide?attrs.boolean("serverSide"):true
        model["serverSide"]=serverSide
        model["defaultScript"]=defaultScript
        model["url"]=attrs.url
        //用于存放 数据封装时判断的依据
        def defaultMap=[:]
        defaultMap<<["multiSelect":attrs.multiSelect?attrs.boolean("multiSelect"):true]
        defaultMap<<["orderNumber":attrs["orderNumber"]?attrs.boolean("orderNumber"):true]
        defaultMap<<["actionList":attrs.actionList]
        model<<[tableField:tableField,attrs:attrs,body:body]
        def (fmList,gridColumns) = GridTableUtil.reflectClass(attrs.domainClass,attrs.id)
        def (columdefs,defaultSort,functionData,ajaxData) = GridTableUtil.buildColumnDefs(fmList,gridColumns,defaultMap,serverSide)
        ajaxData["tableId"]=attrs.id
        model<<[fmList:fmList,gridColumns:gridColumns,columdefs:columdefs,defaultSort:defaultSort,functionData:functionData,ajaxData:ajaxData]
        out<<render(template:"/template/dataTable",model: model, plugin:"msbase")
/*        if(!attrs.customTable){

        }else{
            model["customTable"]=attrs.customTable
            model<<defaultMap
            model["actionString"]=""
            if(defaultMap["actionList"]){
                model["actionString"]= GridDataUtil.actionListToString(defaultMap["actionList"])
            }
            out<<render(template:"/template/customDataTable",model: model, plugin:"msbase")
        }*/


    }

}
