package com.ms.base.template

import com.ms.annotation.MSAction
import com.ms.annotation.MSDomain
import com.ms.systemEnum.MSActionType
import org.codehaus.groovy.grails.commons.GrailsDomainClass

import java.util.regex.Pattern

/**
 * Created by zmd on 2016/11/29.
 */
class NameUtil {
    //type为true 则大写首字母
    static String changeFirstName (String name,boolean type=true){
        if(name){
            char[] a =  name.toCharArray()
            if(type){
                a[0] = a[0].toUpperCase()
            }else{
                a[0] = a[0].toLowerCase()
            }
            String.valueOf(a)
        }else{
            ""
        }
    }
    static String actionName(MSAction msAction,GrailsDomainClass domainClass){
        actionName(msAction,TemplateUtil.getMSAction(domainClass.clazz),domainClass.propertyName)
    }
    static String actionName( msAction, msActionArray, propertyName){
        def name = ""
        if(msAction.actionName()){
            name = msAction.actionName()
        }else{
            def index=msActionArray.findAll {
                it.actionType()==msAction.actionType()
            }.indexOf(msAction)
            if(index==0){
                index=""
            }
            name = "${propertyName}${msAction.actionType().actionName}"+index
        }
        name
    }

    static String getPackage(GrailsDomainClass domainClass){
        String fullName = domainClass.getFullName();
        String pkg = "";
        int pos = fullName.lastIndexOf('.');
        if (pos != -1) {
            // Package name with trailing '.'
            pkg = fullName.substring(0, pos);
        }
        pkg
    }

    static def getControllerName(GrailsDomainClass domainClass){
        def msDomain = domainClass.clazz.getAnnotation(MSDomain)
        msDomain?."controllerName"()?changeFirstName(msDomain?."controllerName"()):domainClass.getShortName()
    }

    static def getControllerPackageAndName(GrailsDomainClass domainClass){
        def list=[]
        def msDomain = domainClass.clazz.getAnnotation(MSDomain)
        def pkg = getPackage(domainClass)
        list<<(msDomain?.controllerPackage()?msDomain.controllerPackage():pkg)
        list<<getControllerName(domainClass)+"Controller"
    }
    static def getViewerPackage(GrailsDomainClass domainClass){
        def msDomain = domainClass.clazz.getAnnotation(MSDomain)
        msDomain.viewPackage()?:changeFirstName(getControllerName(domainClass),false)
    }
    static def getViewerController(GrailsDomainClass domainClass){
        changeFirstName(getControllerName(domainClass),false)
    }
    static def getViewerFormatted(MSAction msAction,GrailsDomainClass domainClass){
        "/${getViewerPackage(domainClass)}/${actionName(msAction,domainClass)}"
    }
    static def getViewerNameAndPackage(MSAction msAction, GrailsDomainClass domainClass){
        [getViewerPackage(domainClass),getViewerName(msAction,domainClass)]
    }
    static def getViewerName(MSAction msAction, GrailsDomainClass domainClass){
        actionName(msAction,domainClass)
    }
    static def getMSDomainName(Class domainClass){
        def msDomain=domainClass.getAnnotation(MSDomain)
        if(msDomain){
            msDomain.name()
        }else{
            ""
        }
    }
    static def selectTaglibContext(input,htmlStr){
        def p_html;
        def m_html;
        def reg = "</*" + input + ">\\s*|\t|\r|\n";
        p_html = Pattern.compile(reg, Pattern.CASE_INSENSITIVE);  //根据reg去编译大小写不敏感
        m_html = p_html.matcher(htmlStr); //用p_html标准去匹配html
        htmlStr = m_html.replaceAll("");//用""去替代筛选出来的指定<>
        def htmlStr5 = new String[20];
        htmlStr5 = htmlStr.split("<.*?</.*?>"); //找出<></>特征的进行分割
        def st = "";
       def strlist = new ArrayList();
        for (def strings : htmlStr5) {
            strlist.add(strings);
        }
        for (def strs : strlist) {
            if (!strs.equals("")) {
                st+= strs + "";
            }
        }
        st=st.substring(0,st.length()).trim().replace(" {2,}"," ");
        //把多个空格合并成一个
        return st;
    }
    static String nameNoLast(String name){
        def nameArray=name.split("\\.")
        if(nameArray.length>1){
            name="."+nameArray[0..-2].join(".")
        }else{
            name=""
        }
        name
    }
    static String nameLast(String name){
        def nameArray=name.split("\\.")
        nameArray[-1]
    }
    //.变成?.
    static String addQuestionMark(String name){
        def nameArray=name.split("\\.")
        if(nameArray.length>1){
            name=nameArray.join("?.")
        }
        name
    }
}
