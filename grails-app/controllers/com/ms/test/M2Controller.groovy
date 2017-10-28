/**
 * 创建自 xmw on 2017-02-05.
 */

package com.ms.test
import com.ms.base.util.GridDataUtil 
import grails.converters.JSON 
import com.ms.test.M2 

class M2Controller {

    static defaultAction ="m2TableS"


    def m2Save(){
        withForm {
            boolean result =true
            def m2
            if(params.id){
                m2= M2.get(params.id)

            }else{
                m2=new M2()
            }
            
            m2.properties['m1s','m2Name'] = params
            m2.clearErrors()
            			
			m2.m1s?.clear()
			params["m1s"]?.split(",")?.grep()?.each{
			    def m1 =com.ms.test.M1.get(it)
			    m2.addToM1s(m1) 
			}

            if(!m2.save(flush:true)){
                result=false
            }
            render ([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }

    def m2SaveView(){
        def m2=new M2()
        if(params.id){
            m2 = M2.get(params.id)
        }
        render view:'/m2/m2Save', model:[m2:m2]
    }


    def m2Delete(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
        def m2 =M2.get(it)
            if(m2){
                m2.delete()
            }else{
                result=false
            }
        }
        model["result"]=result
        render ( model as JSON)
    }

    def m2TableS(){
        def model =[domainClass:M2.class]
        withFormat{
            html {
                render view:'/m2/m2TableS' , model:model
            }
            json{
                def query={map->
					if(map.searchs["m2Name"]!=null){
						like("m2Name","%${map.searchs["m2Name"]}%")

					}
                }
                render GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON
            }
        }
    }


}
