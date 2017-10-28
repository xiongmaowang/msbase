/**
 * 创建自 zmd on 2017-01-12.
 */

package com.ms.base

import com.ms.base.util.GridDataUtil
import grails.converters.JSON

class NewsController {

    static defaultAction ="newsTableS"


    def newsSave(){
        withForm {
            boolean result =true
            def news
            if(params.id){
                news= News.get(params.id)

            }else{
                news=new News()
            }
            news.properties['topic','content'] = params
            news.clearErrors()
            
            if(!news.save()){
                result=false
            }else{
                
            }
            render ([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }

    def newsSaveView(){
        def news=new News()
        if(params.id){
            news = News.get(params.id)
        }
        render view:'/news/newsSave', model:[news:news]
    }


    def newsDelete(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
        def news =News.get(it)
            if(news){
                news.delete()
            }else{
                result=false
            }
        }
        model["result"]=result
        render ( model as JSON)
    }

    def newsTableS(){
        def model =[domainClass:News.class]
        withFormat{
            html {
                render view:'/news/newsTableS' , model:model
            }
            json{
                def query={map->
					if(map.searchs["topic"]){
						like("topic","%${map.searchs["topic"]}%")
					}
					if(map.searchs["dateCreated"]){
						gt("dateCreated",Date.msParse(map.searchs["dateCreated"]).msToDateStart())
					}
                }
                render GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON
            }
        }
    }


}
