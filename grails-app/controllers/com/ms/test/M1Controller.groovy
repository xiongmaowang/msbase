/**
 * 创建自 xmw on 2017-02-05.
 */

package com.ms.test
import com.ms.base.util.GridDataUtil
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import grails.converters.JSON 
import com.ms.test.M1 

class M1Controller {

    static defaultAction ="m1TableS"

    def aa(){
        println new Date().msToDateEnd()
    }
    def m1Save(){
        withForm {
            boolean result =true
            def m1
            if(params.id){
                m1= M1.get(params.id)

            }else{
                m1=new M1()
            }
            
            m1.properties['m2s','m1Name'] = params
            m1.clearErrors()
            
            if(!m1.save(flush:true)){
                result=false
            }else{
			
			    m1?.m2s?.each{
			        it.m1s?.removeAll(m1)
			        it.save(flush:true)
			    }
			    params["m2s"]?.split(",")?.grep()?.each{
			        def m2 =com.ms.test.M2.get(it)
			        m2.addToM1s(m1)
			        m2.save(flush:true)
			    }

			}
            render ([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }

    def m1SaveView(){
        def m1=new M1()
        if(params.id){
            m1 = M1.get(params.id)
        }
        render view:'/m1/m1Save', model:[m1:m1]
    }


    def m1Delete(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
        def m1 =M1.get(it)
            if(m1){
                m1.delete()
            }else{
                result=false
            }
        }
        model["result"]=result
        render ( model as JSON)
    }

    def m1TableS(){
        def model =[domainClass:M1.class]
        withFormat{
            html {
                render view:'/m1/m1TableS' , model:model
            }
            json{
                def query={map->
					if(map.searchs["m1Name"]!=null){
						like("m1Name","%${map.searchs["m1Name"]}%")

					}
                }
                render GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON
            }
        }
    }


}
