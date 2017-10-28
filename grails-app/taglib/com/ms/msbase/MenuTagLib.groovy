package com.ms.msbase
import org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsHibernateUtil

class MenuTagLib {
    static defaultEncodeAs = [taglib:'none']
    static namespace = "ms"
    def springSecurityService
    //有空重新写一下 前半段是不需要的
    def menu={attrs,body ->
        def user=springSecurityService.getCurrentUser()
        def getAllParent
        getAllParent={it,list->
            if(it){
                list<<it
                getAllParent(it.parent,list)
            }else{
                return list
            }
        }
        def resource= user.getAllAuthorities()
        def models =[] as Set
        TreeMap modPAndRes=new TreeMap()
        modPAndRes.keySet()
        resource.each{
            if(it.enabled){
                if(it.model){
                    if(!it.model.parent){
                        modPAndRes[it.model]=""
                    }else{
                        def fp=it.model.findFirsParent()
                        if(fp&&!(fp in modPAndRes.keySet())){
                            modPAndRes[fp]=""
                        }
                    }
                }else{
                    modPAndRes[it]=""
                }
                models+=getAllParent(it.model,[])
            }
        }
        def rsSet=(resource+models)*.id
        def query
        query={cMap->
            if(cMap){
                cMap.each{
                    if(GrailsHibernateUtil.unwrapIfProxy(it.key).getClass()==com.ms.base.Model){
                        def set=it.key.children + it.key.resources
                        set.removeAll {rs->
                            (!(rs.id in rsSet)||(!rs.enabled))
                        }
                        if(set){
                            TreeMap map =new TreeMap()
                            set.each{s->
                                map[s]=""
                            }
                            cMap[it.key]=map
                            query(map)
                        }
                    }
                }
            }
        }
        query(modPAndRes)
        modPAndRes
        def level=["second","third","fourth","Fifth"]
        def count=0
        def outQuery
        outQuery={cMap,index ->
            if(index<4){
                if(cMap){
                    cMap.each{
                        if(index==0){
                            out<<"<li class=\"text-flag\"> \n"
                        }else{
                            out<<"<li> \n"
                        }
                        def key=GrailsHibernateUtil.unwrapIfProxy(it.key)
                        def keyClass=key.getClass()
                        if(keyClass==com.ms.base.Model){
                            out<<"<a href=\"#\">\n"
                            if(index==0){
                                out<<"<i class=\"${key.imgClass}\"></i>\n"
                                out<<"<span class=\"nav-label nav-parent\">${key.modelName}</span>\n"
                            }else{
                                out<<key.modelName
                            }
                            out<<"<span class=\"fa arrow\"></span>\n"
                            out<<"</a>\n"
                            out<<"<ul class=\"nav nav-${level[index]}-level\">"
                            def map =it.value
                            outQuery(map,index+1)
                            out<<"</ul>"
                        }else if(keyClass==com.ms.base.Resource){
                            out<<"<a class=\"J_menuItem\" href=\"${key.url}\" data-iframe-btn=\"${key.defaultIndex?"none_show":"r${count++}"}\">\n"
                            if(index==0){
                                out<<"<i class='${key.imgClass}'></i>\n"
                                out<<"<span class='nav-label nav-parent'>${key.resourceName}</span>\n"
                            }else{
                                out<<key.resourceName
                            }
                            out<<"</a>\n"
                        }
                        out<<"</li>\n"
                    }
                }
            }

        }
        outQuery(modPAndRes,0)
    }
}
