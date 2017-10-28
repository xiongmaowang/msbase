/**
 * 创建自 zmd on 2017-01-12.
 */

package com.ms
import com.ms.base.util.GridDataUtil 
import grails.converters.JSON 
import com.ms.base.User 

class UserController {

    static defaultAction ="userTableS"


    def userSave(){
        if(!params.id&&User.findByUsername(params.username)){
            render( [username:params.username] as JSON)
            return
        }
        withForm {
            boolean result =true
            def user
            if(params.id){
                user= User.get(params.id)
                
            }else{
                user=new User()
            }
            user.properties['username','password','chinaName','roles','departs'] = params
            user.clearErrors()
            if(!user.save()){
                result=false
            }else{
                			
			    user?.roles?.each{
			        it.users.removeAll(user)
			        it.save(flush:true)
			    }
			    params["roles"]?.split(",")?.grep()?.each{
			        def role =com.ms.base.Role.get(it)
			        role.addToUsers(user)
			        role.save(flush:true)
			    }
			
			
			    user?.departs?.each{
			        it.users.removeAll(user)
			        it.save(flush:true)
			    }
			    params["departs"]?.split(",")?.grep()?.each{
			        def depart =com.ms.base.Depart.get(it)
			        depart.addToUsers(user)
			        depart.save(flush:true)
			    }

            }
            render ([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }

    def userSaveView(){
        def user=new User()
        if(params.id){
            user = User.get(params.id)
        }
        render view:'/user/userSave', model:[user:user]
    }


    def userChange(){
        def model=[:]
        def result=true
        params.ids?.split(',')?.each{
            def user = User.get(it)
            user.enabled= !user.enabled
            if(!user.save()){
                result=false
            }
        }
        model["result"]=result
        render ( model as JSON)
    }

    def userTableS(){
        def model =[domainClass:User.class]
        println params
        withFormat{
            html {
                render view:'/user/userTableS' , model:model
            }
            json{
                def query={map->
					if(map.searchs["username"]){
						like("username","%${map.searchs["username"]}%")
					}
					if(map.searchs["chinaName"]){
						like("chinaName","%${map.searchs["chinaName"]}%")
					}
					if(map.searchs["dateCreated"]){
                        def dateCreated=Date.msParse(map.searchs["dateCreated"])
                        between("dateCreated",dateCreated.msToDateStart(),dateCreated.msToDateEnd())
					}
                }
                render GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON
            }
        }
    }


}
