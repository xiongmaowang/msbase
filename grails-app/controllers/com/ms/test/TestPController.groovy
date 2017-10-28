/**
 * 创建自 zmd on 2017-02-22.
 */

package com.ms.test
import com.ms.base.util.GridDataUtil 
import grails.converters.JSON 
import com.ms.test.TestP 

class TestPController {

    static defaultAction ="testPTableS"


    //保存
    def testPSave(){
        withForm {
            boolean result =true
            def testP
            if(params.id){
                testP= TestP.get(params.id)

            }else{
                testP=new TestP()
            }
            testP.testCs?.clear()

            testP.properties['testPName','testPInt','testPBol','content','att','testCs'] = params
            testP.clearErrors()
            
            if(!testP.save(flush:true)){
                result=false
            }
            render([result:result] as JSON)
        }.invalidToken {
        // bad request
        }
    }
    //新增或编辑页面
    def testPSaveView(){
        def testP=new TestP()
        if(params.id){
            testP = TestP.get(params.id)
        }
        render(view:'/testP/testPSave', model:[testP:testP])
    }


    //删除
    def testPDelete(){
        def model=[:]
        def result=true
        params.ids.split(',').grep()?.each{
        def testP =TestP.get(it)
            if(testP){
                testP.delete(flush:true)
            }else{
                result=false
            }
        }
        model["result"]=result
        render( model as JSON)
    }

    //列表展示
    def testPTableS(){
        def model =[domainClass:TestP.class]
        withFormat{
            html {
                render(view:'/testP/testPTableS' , model:model)
            }
            json{
                def query={map->
					if(map.searchs["testPName"]){
						eq("testPName",map.searchs["testPName"])

					}
					if(map.searchs["testPInt"]){
						eq("testPInt",map.searchs["testPInt"].toInteger())

					}
					if(map.searchs["testPShort"]){
						eq("testPShort",map.searchs["testPShort"].toShort())

					}
					if(map.searchs["testPBigInteger"]){
						eq("testPBigInteger",map.searchs["testPBigInteger"].toBigInteger())

					}
					if(map.searchs["testPDouble"]){
						eq("testPDouble",map.searchs["testPDouble"].toDouble())

					}
					if(map.searchs["testPByte"]){
						eq("testPByte",Byte.parseByte(map.searchs["testPByte"]))

					}
					if(map.searchs["testPBol"]!=null){
						eq("testPBol",map.searchs["testPBol"].toBoolean())

					}
					if(map.searchs["content"]){
						like("content","%${map.searchs["content"]}%")

					}
					if(map.searchs["dateCreated"]){
						
						def dateCreated=Date.msParse(map.searchs["dateCreated"])
						between("dateCreated",dateCreated.msToDateStart(),dateCreated.msToDateEnd())

					}
					if(map.searchs["testCs"]){
						eq("testCs",map.searchs["testCs"])

					}
                }
                render(GridDataUtil.gridList(model['domainClass'],params,query,true) as JSON)
            }
        }
    }


}
