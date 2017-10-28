/**
 * 创建自 zmd on 2017-02-22.
 */

package com.ms.test
import com.ms.base.util.GridDataUtil 
import grails.converters.JSON 
import com.ms.test.TestC 

class TestCController {

    static defaultAction ="testCTableS"


    //保存
    def testCSave(){
        withForm {
            boolean result =true
            def testC
            if(params.id){
                testC= TestC.get(params.id)

            }else{
                testC=new TestC()
            }
            
            testC.properties['testP','testCName'] = params
            testC.clearErrors()
            
            if(!testC.save(flush:true)){
                result=false
            }
            render([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }
    //新增或编辑页面
    def testCSaveView(){
        def testC=new TestC()
        if(params.id){
            testC = TestC.get(params.id)
        }
        render(view:'/testC/testCSave', model:[testC:testC])
    }


    //删除
    def testCDelete(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
        def testC =TestC.get(it)
            if(testC){
                testC.delete(flush:true)
            }else{
                result=false
            }
        }
        model["result"]=result
        render( model as JSON)
    }

    //列表展示
    def testCTableS(){
        def model =[domainClass:TestC.class]
        withFormat{
            html {
                render(view:'/testC/testCTableS' , model:model)
            }
            json{
                def query={map->

                }
                render(GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON)
            }
        }
    }


}
