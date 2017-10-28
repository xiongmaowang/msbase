/**
 * 创建自 zmd on 2017-01-12.
 */

package com.ms.base

import com.ms.base.util.GridDataUtil
import grails.converters.JSON

class RoleController {

    static defaultAction ="roleTable"
    def roleSave(){
        withForm {
            boolean result =true
            def role
            if(params.id){
                role= Role.get(params.id)
            }else{
                role=new Role()
            }

            role.properties['roleName','resources','remark'] = params
            role.clearErrors()

            role.resources=params["resources"]?.split(",")?.grep()?.collect{
                com.ms.base.Resource.get(it)
            }
            if(!role.save()){
                result=false
            }else{
                
            }
            render ([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }

    def roleSaveView(){
        def role=new Role()
        if(params.id){
            role = Role.get(params.id)
        }
        render view:'/role/roleSave', model:[role:role]
    }


    def roleDelete(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
            def role=Role.get(it)
            if(role){
                role.delete()
            }else{
                result=false
            }
        }
        model["result"]=result
        render ( model as JSON)
    }

    def roleTable(){
        def model =[domainClass:Role.class]
        withFormat{
            html {
                render view:'/role/roleTable' , model:model
            }
            json{
                def query={map->

                }
                render GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON
            }
        }
    }


}
