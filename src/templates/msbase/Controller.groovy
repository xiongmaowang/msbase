/**
 * 创建自 ${System.getProperty("user.name")} on ${new Date().format("yyyy-MM-dd")}.
 */
<%

import com.ms.annotation.MSAction
import com.ms.annotation.MSField
import com.ms.base.User
import com.ms.systemEnum.MSActionType
import com.ms.base.template.*
import com.ms.systemEnum.MSTemplate
import org.codehaus.groovy.grails.commons.GrailsDomainClass

%>
package ${packageName}
<%
importList.each{
    print "import $it \n"
}
    def defaultAction =""
    def actionNames =msActionArray.collect {
        if(it.actionType() in MSActionType.getAllViewsAction()){
            return NameUtil.actionName(it,msActionArray,propertyName)
        }
    }.grep()
    if(actionNames&&actionNames[0]){
        defaultAction=actionNames[0]
    }
%>
class ${fileName} {
<%
    if(defaultAction){
 %>
    static defaultAction ="${defaultAction}"
<%}%>
<%
msActionArray.each{
    getActionCode(it)
}
%>
<%
    def getActionCode(msAction){
        def text = ""
        switch (msAction.actionType()){
            case MSActionType.SAVEORUPDATE:
                def treeAction
                text = saveOrUpdateAction(msAction)
                break
            case MSActionType.CHANGEOFSTATE:
                text = changeOfStateAction(msAction)
                break
            case MSActionType.DELETE:
                text = deleteAction(msAction)
                break
            case MSActionType.TABLEVIEW:
                text = tableView(msAction)
                break
            case MSActionType.TABLEVIEWSEARCH:
                text = tableView(msAction,true)
                break
        }
        print text
    }



    def saveOrUpdateAction(msAction){
        def actionName=NameUtil.actionName(msAction,msActionArray,propertyName)
        def (f0,f1,f2,f3)=formattedAssBySave(3,msAction)
        if(!f3){
            f3 ="${propertyName}"
        }
"""
    //保存
    def ${actionName}(){
        withForm {
            boolean result =true
            def ${propertyName}
            if(params.id){
                ${propertyName}= ${className}.get(params.id)

            }else{
                ${propertyName}=new ${className}()
            }
            ${f2}
            ${propertyName}.properties${fieldStringList(msAction)} = params
            ${propertyName}.clearErrors()
            ${f1}
            if(!${f3}.save(flush:true)){
                result=false
            }${f0 ? "else{\n" + f0 + "\n\t\t\t}" : ""}
            render([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }
    //新增或编辑页面
    def ${actionName}View(){
        def ${propertyName}=new ${className}()
        if(params.id){
            ${propertyName} = ${className}.get(params.id)
        }
        render(view:'${NameUtil.getViewerFormatted(msAction,domainClass)}', model:[${propertyName}:${propertyName}])
    }

"""
    }

    def changeOfStateAction(msAction){
        def actionName=NameUtil.actionName(msAction,msActionArray,propertyName)
        def stateString = msAction.msFileds()?.collect {
            /${propertyName}.${it.name()}= ${it.value()}/
        }?.join("\n\t\t\t")
"""
    //修改状态
    def ${actionName}(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
            def ${propertyName} = ${className}.get(it)
            ${stateString?stateString:""}
            if(!${propertyName}.save(flush:true)){
                result=false
            }
        }
        model["result"]=result
        render( model as JSON)
    }
"""
    }

    def deleteAction(msAction){
        def actionName=NameUtil.actionName(msAction,msActionArray,propertyName)
"""
    //删除
    def ${actionName}(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
        def ${propertyName} =${className}.get(it)
            if(${propertyName}){
                ${propertyName}.delete(flush:true)
            }else{
                result=false
            }
        }
        model["result"]=result
        render( model as JSON)
    }
"""
    }
    def tableView(msAction,flag=false){
        def actionName=NameUtil.actionName(msAction,msActionArray,propertyName)
"""
    //列表展示
    def ${actionName}(){
        def model =[domainClass:${className}.class]
        withFormat{
            html {
                render(view:'${NameUtil.getViewerFormatted(msAction,domainClass)}' , model:model)
            }
            json{
                def query={map->
${getQuery(msAction)}
                }
                render(GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON)
            }
        }
    }
"""
    }


    def formattedSetFieldClear(msField){
            def field = msField.name().split("\\.")[0]
            if(domainClass.getPropertyByName(field).type in [Set,SortedSet]){
                "${propertyName}.${field}?.clear()"
            }
    }
    def formattedAssBySave(times,msAction){
        def result=""
        def map =TemplateUtil.domainAssociation(domainClass,msAction.msFileds())
        def manyToMany=map["manyToMany"]
        def formmatted=[]
        manyToMany?.each{otm->
            def msField=msAction.msFileds().find{it.name()==otm.key}
            if(!msField){
                return null
            }
            def fieldName = msField.name()
            def fieldNameNoLast = NameUtil.nameNoLast(fieldName)
            def fieldNameLast = NameUtil.nameLast(fieldName)
            def msT=TemplateUtil.getMSTemplate(msField,domainClass)
            //获取关联对象的类型
            //def otmClass=domainClass.getRelatedClassType(fieldName)
            if((msT==MSTemplate.MULTISELECT)||(msT==MSTemplate.TREEMULTISELECT)){
                if(!(otm.value.owningSide)){
                    result=
"""
    ${propertyName}?.${fieldName}?.each{
        it.${propertyName}s?.removeAll(${propertyName})
        it.save(flush:true)
    }
    params["${fieldNameLast}"]?.split(",")?.grep()?.each{
        def ${otm.value.name[0..-2]} =${otm.value.referencedPropertyType.name}.get(it)
        ${otm.value.name[0..-2]}.addTo${className}s(${propertyName})
        ${otm.value.name[0..-2]}.save(flush:true)
    }
"""
                    formmatted<<[0,result]
                }else{
                    result=
"""
${propertyName}.${fieldName}?.clear()
params["${fieldNameLast}"]?.split(",")?.grep()?.each{
    def ${otm.value.name[0..-2]} =${otm.value.referencedPropertyType.name}.get(it)
    ${propertyName}${fieldNameNoLast}.addTo${NameUtil.changeFirstName(otm.value.name)}(${otm.value.name[0..-2]}) 
}
"""
                    formmatted<<[1,result]
                }
            }
        }

        //一对多
        map["oneToMany"]?.each{otm->
            def msField=msAction.msFileds().find{it.name()==otm.key}
            if(!msField){
                return null
            }
            def fieldName = msField.name()
            def fieldNameNoLast = NameUtil.nameNoLast(fieldName)
            def fieldNameLast = NameUtil.nameLast(fieldName)
            def msT=TemplateUtil.getMSTemplate(msField,domainClass)
            //获取关联对象的类型
            //def otmClass=otm.value.referencedPropertyType
            if((msT==MSTemplate.MULTISELECT)||(msT==MSTemplate.TREEMULTISELECT)){
                    result=
"""
${propertyName}.${fieldName}?.clear()
params["${fieldNameLast}"]?.split(",")?.grep()?.each{
    def ${otm.value.name[0..-2]} =${otm.value.referencedPropertyType.name}.get(it)
    ${propertyName}${fieldNameNoLast}.addTo${NameUtil.changeFirstName(otm.value.name)}(${otm.value.name[0..-2]}) 
}
"""
                    formmatted<<[1,result]
                }else if(msT==MSTemplate.DATATABLEEDIT){
                    result=formattedSetFieldClear(msField)
                    formmatted<<[2,result]
                }
        }


        //一对一
        map["oneToOne"]?.each{otm->
            def msField=msAction.msFileds().find{it.name()==otm.key}
            if(!msField){
                return null
            }
            def fieldName = msField.name()
            def fieldNameNoLast = NameUtil.nameNoLast(fieldName)
            def fieldNameLast = NameUtil.nameLast(fieldName)
            def msT=TemplateUtil.getMSTemplate(msField,domainClass)
            if((!otm.value.owningSide)&&otm.value.otherSide&&otm.value.otherSide.owningSide&&(otm.value.otherSide.referencedDomainClass==domainClass)){
                def valuation=
"""
def saveObj=${propertyName}
if(${propertyName}.${otm.value.name}){
    ${propertyName}.${otm.value.name}.${otm.value.otherSide.name}=${propertyName}
    saveObj=${propertyName}.${otm.value.name}
}
"""
                def saveP="saveObj"
                formmatted<<[1,valuation]
                formmatted<<[3,saveP]
            }
        }


        def f0=TemplateUtil.addTag(times,formmatted.collect{
            if(it[0]==0){
                return it[1]
            }
        }?.grep()?.join("\n")).toString()

        def f1=TemplateUtil.addTag(times,formmatted.collect{
            if(it[0]==1){
                return it[1]
            }
        }?.grep()?.join("\n")).toString()

    def f2=TemplateUtil.addTag(0,formmatted.collect{
        if(it[0]==2){
            return it[1]
        }
    }?.grep()?.join("\n")).toString()

    def f3=formmatted.collect{
        if(it[0]==3){
            return it[1]
        }
    }?.grep()?.join("\n")?.toString()

        [f0?:"",f1?:"",f2?:"",f3?:""]
    }


    def fieldList(msAction){
       msAction.msFileds().collect{"'${it.name().split("\\.")[0]}'"}.grep().unique()
    }
    def fieldStringList(msAction){
        def stringList = fieldList(msAction)?.join(",")
        if(stringList){
            "[${stringList}]"
        }else{
            ""
        }
    }

    def getQuery(MSAction msAction){
        def sb= new StringBuffer()
        msAction.msFileds().eachWithIndex {it,i->
            def sb2=new StringBuffer()
            if(i!=0)
                sb2.append("\n")
            List split=it.name().split("\\.")
            def tempString=""
            def field
            if(split.size()>1){
                field=TemplateUtil.getFieldByList(split as List,domainClass)
                tempString=TemplateUtil.queryStringUtil(split[0..-2],"\t"*6,TemplateUtil.switchFieldQuery(it,it.name(),field))
            }else{
                field=TemplateUtil.getField(split[0],domainClass)
                tempString=TemplateUtil.addTag(6,TemplateUtil.switchFieldQuery(it,it.name(),field))
            }
            sb2.append("\t"*5)
            if(field.type in [Boolean,boolean]){
                sb2.append("if(map.searchs[\"${it.name()}\"]!=null){")
            }else{
                sb2.append("if(map.searchs[\"${it.name()}\"]){")
            }
            sb2.append("\n")
            sb2.append(tempString)
            sb2.append("\n")
            sb2.append("\t"*5)
            sb2.append("}")
            sb.append(sb2)
        }
        sb
    }

    def formattedSelectParse(MSAction msAction){
        def fields=msAction.msFileds()
        def sb = new StringBuffer()
        fields.each{
            MSTemplate msTemplate =TemplateUtil.getMSTemplate(it,domainClass)
            if((msTemplate==MSTemplate.TREEMULTISELECT)||(msTemplate==MSTemplate.MULTISELECT)){
                sb.append("${propertyName},${className}\n")
                sb.append("")
            }
        }
        sb
    }
    def getBelongsToClass(belongsTo){
        if(belongsTo instanceof Map){
            return belongsTo*.value
        }else{
            return belongsTo
        }

    }

%>
}
