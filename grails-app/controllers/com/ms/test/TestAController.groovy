/**
 * 创建自 xmw on 2017-10-30.
 */

package com.ms.test
import com.ms.base.util.GridDataUtil 
import grails.converters.JSON 
import com.ms.test.TestA 

class TestAController {

    static defaultAction ="testATableS"


    //保存
    def testASave(){
        withForm {
            boolean result =true
            def testA
            if(params.id){
                testA= TestA.get(params.id)

            }else{
                testA=new TestA()
            }
            
            testA.properties['testAName','testP'] = params
            testA.clearErrors()
            
            if(!testA.save(flush:true)){
                result=false
            }
            render([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }
    //新增或编辑页面
    def testASaveView(){
        def testA=new TestA()
        if(params.id){
            testA = TestA.get(params.id)
        }
        render(view:'/com/ms/test/testASave', model:[testA:testA])
    }


    //删除
    def testADelete(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
        def testA =TestA.get(it)
            if(testA){
                testA.delete(flush:true)
            }else{
                result=false
            }
        }
        model["result"]=result
        render( model as JSON)
    }

    //列表展示
    def testATableS(){
        def model =[domainClass:TestA.class]
        withFormat{
            html {
                render(view:'/com/ms/test/testATableS' , model:model)
            }
            json{
                def query={map->
					if(map.searchs["testP"]){
						eq("testP.id",map.searchs["testP"])

					}
					if(map.searchs["testAName"]){
						like("testAName","%${map.searchs["testAName"]}%")

					}
                }
                render(GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON)
            }
        }
    }


}
