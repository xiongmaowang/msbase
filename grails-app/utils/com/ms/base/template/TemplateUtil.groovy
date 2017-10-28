package com.ms.base.template

import com.ms.annotation.MSAction
import com.ms.annotation.MSActions
import com.ms.annotation.MSField
import com.ms.base.User
import com.ms.systemEnum.MSActionType
import com.ms.systemEnum.MSTemplate
import grails.util.Holders
import org.codehaus.groovy.grails.commons.GrailsDomainClass
import org.codehaus.groovy.grails.commons.GrailsDomainClassProperty

import java.security.Timestamp

/**
 * Created by zmd on 2016/11/30.
 */
class TemplateUtil {
    //获取msFields 里面的name()里的对象有什么关联关系
    static def domainAssociation(GrailsDomainClass  domainClass, MSField[] msFileds){
        def map =[manyToOne : [:], oneToMany :[:], oneToOne : [:],manyToMany:[:]]

        msFileds.each {
/*            def field = it.name().split("\\.")[0]
            try {
                def property=domainClass.getPropertyByName(field)
                if(domainClass.isManyToOne(field)){
                    map.manyToOne<<it
                }else if(isDomain(property.type)){
                    map.oneToOne<<property
                }
            }catch (e){
                System.err.println( "MsField注解里的name:${field} 无法在${domainClass.getFullName()}里找到")
                throw new MissingFieldException("")
            }*/
            def fieldList=it.name().split("\\.")
            def map2 =[manyToOne : [:], oneToMany :[:], oneToOne : [:],manyToMany:[:]]
            def dmc=domainClass
            for (int i=0;i<fieldList.size();i++){
                def type = getField(fieldList[i],dmc)
/*                try {*/
                if(i+1==fieldList.size()){
                    def association=dmc.associations.find{
                        it.name==fieldList[i]
                    }
                    if(association){
                        if(association.manyToMany){
                            map2.manyToMany[it.name()]=association
                        }else if(association.manyToOne){
                            map2.manyToOne[it.name()]=association
                        }else if(association.oneToOne){
                            map2.oneToOne[it.name()]=association
                        }else if(association.oneToMany){
                            map2.oneToMany[it.name()]=association
                        }
                     }

                }

/*                }catch (e){
                    System.err.println( "MsField注解里的name:${fieldList[i]} 无法在${dmc.getFullName()}里找到")
                    throw new MissingFieldException("")
                }*/
                if(type&&type.referencedDomainClass&&isDomain(type.referencedDomainClass.clazz)){
                    dmc=type.referencedDomainClass
                }else{
                    break;
                }
            }
            map.manyToOne<<map2.manyToOne
            map.oneToMany<<map2.oneToMany
            map.oneToOne<<map2.oneToOne
            map.manyToMany<<map2.manyToMany
        }
/*        if(domainClass.clazz.metaClass.hasProperty(domainClass.clazz,"hasMany")){
            map["oneToMany"]= domainClass.clazz.hasMany.findAll{m->
                m.key in msFileds*.name()
            }
        }*/
        map.each {key,value->
            if(value instanceof List)
            value.unique()
        }
        map
    }
    //用于分析domain类里的关联关系 排除了和显示页面有关的type
    static def domainAssociation(GrailsDomainClass  domainClass){
        def msActions =getMSAction(domainClass.clazz)
        msActions.removeAll{
            it.actionType()==MSActionType.TABLEVIEWSEARCH||it.actionType()==MSActionType.TABLEVIEW
        }
        MSField[] msFileds=msActions*.msFileds().flatten()
        domainAssociation(domainClass,msFileds)
    }
    //判断是否为domain类
    static boolean isDomain(Class  domainClass){
        if(domainClass.isPrimitive())
            return false
        for (gd in Holders.grailsApplication.domainClasses){
            if(domainClass == gd.clazz){
                return true
            }
        }
        false
    }
    //验证有注解的字段是否存在
    static boolean vaildField(domainClass){
        def msActions =getMSAction(domainClass.clazz)
        def fileds=msActions*.msFileds().flatten()*.name()
        fileds.each{
            vaildField(it,domainClass)
        }
    }
    //
    static void vaildField(fieldName,domainClass){
        def fieldList = fieldName.split("\\.")
        def map=[domainClass:domainClass]
        for (int i=0;i<fieldList.length;i++){
            def type = getField(fieldList[i],map["domainClass"])
            if(!type){
                System.err.println("无法找到该属性: ${fieldList[i]} 在${map["domainClass"]}")
                throw new javax.el.PropertyNotFoundException()
            }
            if(type&&type.referencedDomainClass&&isDomain(type.referencedDomainClass.clazz)){
                map['domainClass']=type.referencedDomainClass
            }else{
                if(i!=fieldList.length-1){
                    System.err.println("属性 : ${fieldList[i]} 并不是一个Domain类的对象")
                    throw new javax.el.PropertyNotFoundException()
                }
            }
        }
    }


    //获取mSAction的list
    static def getMSAction(Class domainClass){
        def list=[]
        def msActions=domainClass.getAnnotation(MSActions)
        if(msActions){
            list=msActions.msAction()
        }
        def msAction=domainClass.getAnnotation(MSAction)
        if(msAction){
            list<<msAction
        }
        list as List
    }

    static def switchFieldType(GrailsDomainClassProperty field){
        def fieldClass=field.type
        def result
        switch (field.name){
            case ["content","remark"]:
                result=MSTemplate.STRINGCONTENT
                break
            case "password":
                result=MSTemplate.PASSWORD
                break
        }
        if(result){
            return result
        }
        switch(fieldClass){
            case [ BigInteger,Long,Integer,Short,Byte,long, int,short,byte]:
                result = MSTemplate.INTEGERINPUT
                break
            case [BigDecimal,Double,Float,double,float]:
                result = MSTemplate.NUMBERINPUT
                break
            case [Boolean,boolean]:
                result = MSTemplate.BOOLEANRADIO
                break
            case [String]:
                result = MSTemplate.STRINGINPUT
                break
            case [Set,List,Map]:
                result = MSTemplate.MULTISELECT
                break
            case [Date, Timestamp]:
                result = MSTemplate.DATEPICKER
                break
            case  Holders.grailsApplication.getDomainClasses()*.clazz:
                result = MSTemplate.SINGLESELECT
                break
            default:
                result = MSTemplate.DEFAULT
                break
        }
        result
    }
    //获取一个msField的msTemplate
    static def getMSTemplate(MSField msField , GrailsDomainClass domainClass){
        def msTemplate=msField.msTemplate()
        if(msTemplate==MSTemplate.DEFAULT){
            def field = getFieldByList(msField.name().split("\\.") as List,domainClass)
            if(field){
                msTemplate = switchFieldType(field)
            }
        }
        msTemplate
    }

    static GrailsDomainClassProperty getField(String fieldName, GrailsDomainClass domainClass){
        try {
            domainClass.getPropertyByName(fieldName)
        }catch (e){
        }
    }

    static GrailsDomainClassProperty getFieldByList(List fieldList,GrailsDomainClass domainClass){
        def map=[domainClass:domainClass]
        def type
        for (int i=0;i<fieldList.size();i++){
            type = getField(fieldList[i],map["domainClass"])
            if(type&&type.referencedDomainClass&&isDomain(type.referencedDomainClass.clazz)){
                map['domainClass']=type.referencedDomainClass
            }else{
                return type
            }
        }
        type
    }
    /*    static def getFieldClass(MSField msField , GrailsDomainClass domainClass){
        def msTemplate=msField.msTemplate()
        def field = getFieldByList(msField.name().split("\\.") as List,domainClass)
        def fieldClass
        if(field){
            fieldClass=field.type
            switch(fieldClass){
                case [ Set,List,Map,SortedSet]:
                    fieldClass = getFieldHasManyClass(msField.name().split("\\.") as List,domainClass)
                    break
            }
        }
        fieldClass?:Object
    }*/
/*    static GrailsDomainClassProperty getFieldHasManyClass(List fieldList,GrailsDomainClass domainClass){
        def map=[domainClass:domainClass]
        def fieldClass
        for (int i=0;i<fieldList.size();i++){
            if(map['domainClass'].clazz.metaClass.hasProperty(domainClass.clazz,"hasMany")){
                fieldClass =(domainClass.clazz.hasMany.find{m->
                    m.key == fieldList[i]
                }?.value)
            }
            def type = getField(fieldList[i],map["domainClass"])
            if(type&&type.referencedDomainClass&&isDomain(type.referencedDomainClass.clazz)){
                map['domainClass']=type.referencedDomainClass
            }else{
                return fieldClass?:Object
            }
        }
        fieldClass?:Object
    }*/
    //搜索的query条件
    static def switchFieldQuery(MSField msField,String name ,GrailsDomainClassProperty field){
        def fieldClass=field.getType()
        def fieldName =field.name
        def result
        switch(fieldClass){
            case [Integer,int]:
                result = /eq("${fieldName}",map.searchs["${name}"].toInteger())/
                break
            case [Long,long]:
                result = /eq("${fieldName}",map.searchs["${name}"].toLong())/
                break
            case [Short,short]:
                result = /eq("${fieldName}",map.searchs["${name}"].toShort())/
                break
            case [Byte,byte]:
                result = /eq("${fieldName}",Byte.parseByte(map.searchs["${name}"]))/
                break
            case [ BigInteger]:
                result = /eq("${fieldName}",map.searchs["${name}"].toBigInteger())/
                break
            case [BigDecimal]:
                result =/eq("${fieldName}",map.searchs["${name}"].toBigDecimal())/
                break
            case [Double,double]:
                result =/eq("${fieldName}",map.searchs["${name}"].toDouble())/
                break
            case [Float,float]:
                result =/eq("${fieldName}",map.searchs["${name}"].toFloat())/
                break
            case [Boolean,boolean]:
                result = /eq("${fieldName}",map.searchs["${name}"].toBoolean())/
                break
            case [String]:
                if(msField.msTemplate()==MSTemplate.DICTSELECT){
                    result = /eq("${fieldName}",map.searchs["${name}"])/
                }else{
                    result = "like(\"${fieldName}\",\"%\${map.searchs[\"${name}\"]}%\")"
                }
                break
            case [Date, Timestamp]:
                result =
"""
def ${fieldName}=Date.msParse(map.searchs["${name}"])
between("${fieldName}",${fieldName}.msToDateStart(),${fieldName}.msToDateEnd())
"""
                break
            case  Holders.grailsApplication.getDomainClasses()*.clazz:
                result = /eq("${fieldName}.id",map.searchs["${name}"])/
                break
            default:
                result = /eq("${fieldName}",map.searchs["${name}"])/
                break
        }
        result
    }
    //搜索的html代码
    static def switchSearchInput(MSField msField,def field,String name,String label){
        def times= 10
        def fieldClass=field.getType()
        def fieldName =field.name
        def result =new StringBuffer()
        switch(fieldClass){
            case [ BigInteger,Long,Integer,Short,Byte,long, int,short,byte]:
                result.append("<input type=\"number\" class=\"form-control search-input\" target=\"${name}\" placeholder=\"请输入${label}\"/>\n")
                break
            case [BigDecimal,Double,Float,double,float]:
                result.append("<input type=\"number\" class=\"form-control search-input\" target=\"${name}\" placeholder=\"请输入${label}\"/>\n")
                break
            case [Boolean,boolean]:
                result.append(
"""
<span class="radio-1">
    <input type="radio" class="search-input" id="${name}-1" name="${name}-1" value="true"  target="${name}" />
    <label for="${name}-1"></label>
    <span class="user_radio">是</span>

    <input type="radio" class="search-input" id="${name}-2" name="${name}-1" value="false" target="${name}"/>
    <label for="${name}-2"></label>
    <span class="user_radio">否</span>
</span>
""")
                break
            case [String]:
                if(msField.msTemplate()==MSTemplate.DICTSELECT){
                    result.append(
"""
<g:select  name="${name}" optionKey="id" optionValue="cnm" class="form-control search-input" target="${name}" style="width:196px;"
   from="\${com.ms.base.DictParam.createCriteria().list{eq("parent.id","${msField.value()}") eq("enabled",true)}}"  noSelection="['':'--请选择--']"/>
""")
                }else{
                    result.append("<input type=\"text\" class=\"form-control search-input\" target=\"${name}\"  placeholder=\"请输入${label}\"/>\n")
                }
                break
            case [Date, Timestamp]:
                result.append(
"""
<input  type="text" placeholder="请输入${label}" readonly  class="date-picker form-control search-input" target="${name}"/>
""")
                break
            case  Holders.grailsApplication.getDomainClasses()*.clazz:
                result.append(
"""
<g:select name="${name}"  optionKey="id" optionValue="id" class="chosen-select form-control search-input " target="${name}" style="width:196px;"
   from="\${${ fieldClass.name }.list()}"  noSelection="['':'--请选择--']"/>
"""

)
                break
            default:
                result.append("<input type=\"text\" class=\"form-control search-input\" target=\"${name}\"  placeholder=\"请输入${label}\"/>\n")
                break
        }
        addTag(times,result).toString()
    }




    static String queryStringUtil(list,joinString,text){
        def size=list.size()-1
        def sb = new StringBuffer()
        list.reverse().eachWithIndex{ def entry, int i ->
            def sb2 =new StringBuffer()
            sb2.append(joinString)
            sb2.append("\t"*(size-i))
            sb2.append("${entry}{\n")
            if(i==0){
                sb2.append("\t"*(size-i+1))
                sb2.append(addTag(size-i+1,text,joinString))
            }
            sb.insert(0,sb2)

            sb.append("\n")
            sb.append("\t"*(size-i))
            sb.append(joinString+"}")
        }
        return sb.toString()
    }
    static StringBuffer addTag(times, sb,joinString=""){
        def sb2=new StringBuffer()
        sb.eachLine {
            sb2.append("\t"*times)
            sb2.append(joinString)
            sb2.append(it)
            sb2.append("\n")
        }
        sb2
    }

}
