/**
 * 创建自 zmd on 2017-01-12.
 */

package com.ms.base

import com.ms.base.util.GridDataUtil
import grails.converters.JSON

class ResourceController {

    static defaultAction ="resourceTableS"

    def  springSecurityService
    def resourceSave(){
        withForm {
            boolean result =true
            def resource
            if(params.id){
                resource= Resource.get(params.id)

            }else{
                resource=new Resource()
            }
            resource.properties['resourceName','model','url','controllerName','serialNo','imgClass'] = params
            resource.clearErrors()
            if(resource.getAuthority()){
                if(resource.requestmap){
                    resource.requestmap.url="/${resource.controllerName}/**"
                    resource.requestmap.configAttribute=resource.getAuthority()
                }else{
                    resource.requestmap=new Requestmap("/${resource.controllerName}/**",resource.getAuthority())
                }
                springSecurityService.clearCachedRequestmaps()
            }
            if(!resource.save()){
                result=false
            }else{

            }
            render ([result:result] as JSON)
        }.invalidToken {
            // bad request
        }
    }

    def resourceSaveView(){
        def resource=new Resource()
        if(params.id){
            resource = Resource.get(params.id)
        }
        render view:'/resource/resourceSave', model:[resource:resource]
    }


    def resourceDelete(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
            def resource=Resource.get(it)
            if(resource){
                resource.delete()
            }else{
                result=false
            }
        }
        springSecurityService.clearCachedRequestmaps()
        model["result"]=result
        render ( model as JSON)
    }

    def resourceChange(){
        def model=[:]
        def result=true
        params.ids?.split(',')?.each{
            def resource = Resource.get(it)
            resource.enabled= !resource.enabled
            if(!resource.save()){
                result=false
            }
        }
        model["result"]=result
        render ( model as JSON)
    }

    def resourceTableS(){
        def map =[domainClass:Resource.class]
        withFormat{
            html {
                render view:'/resource/resourceTableS' , model:map
            }
            json{
                def query={mapping->
                    if(mapping.searchs["resourceName"]){
                        like("resourceName","%${mapping.searchs["resourceName"]}%")
                    }
                    if(mapping.searchs["model.modelName"]){
                        model{
                            like("modelName","%${mapping.searchs["model.modelName"]}%")
                        }
                    }
                }
                render GridDataUtil.gridList(map['domainClass'],params,query,true) as JSON
            }
        }
    }


}
