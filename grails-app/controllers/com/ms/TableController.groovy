package com.ms

import com.ms.base.Requestmap
import com.ms.base.util.GridDataUtil
import grails.converters.JSON

class TableController {
    def springSecurityService
    def grailsApplication
    def index() {
        withFormat{
            html {
                render (view:'/zmd/dataTable')
            }
            json{
                def tableData = JSON.parse(params.tableData)
                println tableData
                def json=[
                        "draw": tableData.draw,
                        "recordsTotal": 56,
                        //过滤后的总数
                        "recordsFiltered": 54,
                        "data": [
                                [
                                        "re":new Date(),
                                        "br": "Satou",
                                        "pl": "Accountant",
                                        "ev": "Tokyo",
                                        "cg": "28th Nov 08",
                                        "ag": "0"
                                ],
                                [
                                        "re":   new Date()+1,
                                        "br":    "Ramos",
                                        "pl":   "Chief Executive Officer (CEO)",
                                        "ev":    "London",
                                        "cg":    "9th Oct 09",
                                        "ag": "0"
                                ],
                                [
                                        "re":   new Date()+3,
                                        "br":    "Cox",
                                        "pl":    "Junior Technical Author",
                                        "ev":    "San Francisco",
                                        "cg":   "12th Jan 09",
                                        "ag": "0"
                                ],
                                [
                                        "re":  new Date()+1,
                                        "br":   "Greer",
                                        "pl":   "Software Engineer",
                                        "ev":   "London",
                                        "cg":   "13th Oct 12",
                                        "ag": "0"
                                ],
                                [
                                        "re":   "<a onclick='alert(1)'>233</a>",
                                        "br":   "Wagner",
                                        "pl":   "Software Engineer",
                                        "ev":   "San Francisco",
                                        "cg":   "7th Jun 11",
                                        "ag": "0"
                                ],
                                [
                                        "re":   new Date(),
                                        "br":   "Williamson",
                                        "pl":   "Integration Specialist",
                                        "ev":   "New York",
                                        "cg":    "2nd Dec 12",
                                        "ag": "0"
                                ],
                                [
                                        "re":  new Date(),
                                        "br":  "Nash",
                                        "pl":  "Software Engineer",
                                        "ev":  "London",
                                        "cg":  "3rd May 11",
                                        "ag": "0"
                                ],
                                [
                                        "re": new Date(),
                                        "br": "Vance",
                                        "pl": "Pre-Sales Support",
                                        "ev": "New York",
                                        "cg":  "12th Dec 11",
                                        "ag": "0"
                                ],
                                [
                                        "re":   new Date(),
                                        "br":   "Stevens",
                                        "pl":   "Sales Assistant",
                                        "ev":   "New York",
                                        "cg":   "6th Dec 11",
                                        "ag": "0"
                                ],
                                [
                                        "re": new Date(),
                                        "br": "Kelly",
                                        "pl": "Senior Javascript Developer",
                                        "ev": "Edinburgh",
                                        "cg": "29th Mar 12",
                                        "ag": "0"
                                ]
                        ]
                ]
                //response.setHeader("Access-Control-Allow-Origin", "*")
                render json as JSON
            }
        }

    }
    def dt(){
        Class domainClass=Requestmap.class
        withFormat{
            html {
                render view:'/dataTableTest' , model:[domainClass:domainClass]
            }
            json{
                println params
                def query={map->
                    if(map.searchs?.url){
                        like("url","%${map.searchs.url}%")
                    }

                }
                def aa=  GridDataUtil.gridList(domainClass,params,query,true)
                render aa as JSON
            }
        }
    }
    def dtAdd(){
        Class domainClass=Requestmap.class
        withFormat{
            html {
                render view:'/dataTableTestAdd' , model:[domainClass:domainClass]
            }
            json{
                def query={
                }
                def aa=  GridDataUtil.gridList(Requestmap,params,query,true)
                render aa as JSON
            }
        }

    }
    def tableAdd(){
        Class domainClass=Requestmap.class
        withFormat{
            html {
                render view:'/zmd/tableAdd' , model:[domainClass:domainClass]
            }
            json{
                def query={
                }
                def aa=  GridDataUtil.gridList(Requestmap,params,query,true)
                render aa as JSON
            }
        }
    }
    def addUser(){
        render view:'/add_user1'
    }
    def edit(){
        render view:'/zmd/tableAdd' , model:[domainClass:domainClass,result:true]
    }
    def deleteAll(){
        def ids=params.ids?.split(",")
        ids.each {
             Requestmap.get(it)?.delete()
        }
        render( ["result":true] as JSON)
    }
    def xAdd(){
        render view:'/zmd/xAdd'
    }


}
