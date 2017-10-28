package com.ms.base.util

import grails.converters.JSON
import org.grails.datastore.mapping.query.api.BuildableCriteria
import org.hibernate.sql.JoinType

import java.lang.reflect.Method

class GridDataUtil {

	/*
	 * 获取GridData所需要的数据 三个
	 * @param domainClass 需要分析的实体类
	 * @param params
	 * @param query  搜索的query条件
	 * @param autoSort  是否启用自动排序功能
	 * 注意根据tableData这个值是否存在来判断是否是服务器端
	 * */
	static def gridList(Class domainClass,Map params,Closure query,autoSort=true){
		def(map,ajaxData,tableData)=parseTableData(params)
		if(tableData){
			query=query.curry(map)
			def finalQuery={
				query.setDelegate(delegate)
				query.resolveStrategy=1
				query()
				//排序 支持 resource.model.modelName 这样的写法
				if(autoSort){
					map.orders?.eachWithIndex{sortObj,orderIndex->
						def sortList=sortObj.sort.split("\\.")
						if(sortList.size()>1){
							def sortCloneList=sortList.clone()
							sortList[0..<-1].eachWithIndex{ sortString, i ->
								boolean hasAlias=hasAlias(criteria.subcriteriaList,sortList,sortCloneList,sortString,i)
								String path =sortString
								String alias=sortList[i]
								if(i>0){
									path="${sortList[i-1]}.$sortString"
								}
								if(!hasAlias){
									createAlias(path, alias, JoinType.LEFT_OUTER_JOIN)
								}
							}
							order(sortList[-2..-1].join("."),sortObj.order)
						}else{
							order(sortObj.sort,sortObj.order)
						}
					}
				}
			}
			def dataCount=domainClass.createCriteria().count(query)
			changeOffset(map,dataCount)
			def dataList=domainClass.createCriteria().list(map,finalQuery)
			buildTableDataByServerSide(dataList,dataCount,ajaxData,tableData)
		}else{
			def dataList=domainClass.createCriteria().list(query)
			def dataCount=dataList.size()
			buildTableDataNoServerSide(dataList,domainClass,ajaxData)
		}


	}
	/* 注意:总计路数是根据你的hql语句进行处理后想数据库获取的,如果总计路数有问题建议使用gridMain方法	 *  
	 * @param hql 需要一个hql语句例如
	 * def hql="from Dispatch"
	 * render GridDataUtil.HQLGridList(new Dispatch(),params,hql) as JSON
	 * 如果需要定位参数
	 * 	def hql="from Dispatch where drafterFormateId=?" 
		render GridDataUtil.HQLGridList(new Dispatch(),params,hql,[user.id]) as JSON
		如果需要根据一对多的那个多方的属性进行判断后查询一方
		def hql=" select di from Dispatch di right join  di.nextUsers n where n.id= ?" 
		render GridDataUtil.HQLGridList(new Dispatch(),params,hql,[user.id]) as JSON
	  */
/*	static def HQLGridList(domainClass,params,hql,listQuery=null){
		def trimHql=hql.trim()
		def upHql=trimHql.toUpperCase() 
		def countHql=trimHql
		if(upHql.startsWith("SELECT")){
			countHql=trimHql.substring(upHql.indexOf("FROM"))
		}
		countHql="select count(*) $countHql" 
		if(listQuery){
			return buildTableData(params,{domainClass.executeQuery(hql,listQuery,it)},{object.getClass().executeQuery(countHql,listQuery)[0]})
		}else{
			return buildTableData(params,{domainClass.executeQuery(hql,it)},{object.getClass().executeQuery(countHql)[0]})
		}
	}*/
	static def buildTableDataByServerSide(dataList,dataCount,ajaxData,tableData){
		def json=[
				"draw": tableData.draw,
				"recordsTotal": dataCount,
				//过滤后的总数 现在先不需要该数据
				"recordsFiltered": dataCount,
				"data" :buildData(tableData.columns,ajaxData,dataList)
		]
	}
	static def buildTableDataNoServerSide(dataList,domainClass,ajaxData){
		def datacount=dataList.size()
		def defaultMap =ajaxData["defaultMap"]
		def htmlEncode=ajaxData["htmlEncode"]
		def datas=buildDatas(defaultMap,dataList)
		def(fmList,gridColumns) = GridTableUtil.reflectClass(domainClass,ajaxData["tableId"])
		fmList.eachWithIndex{ fm,i ->
			if(fm instanceof Method){
				def methodName=fm.name
				dataList.eachWithIndex{it,index->
					def columnData=it.invokeMethod(methodName,null)
					columnData=columnData!=null?columnData.toString():""
					if(htmlEncode[i]){
						columnData=columnData.encodeAsHTML()
					}
					datas[index][methodName+"{}"]=columnData
				}
			}else{
				dataList.eachWithIndex{it,index->
					def columnData=it[fm.name]
					columnData=columnData!=null?columnData.toString():""
					if(htmlEncode[i]){
						columnData=columnData.encodeAsHTML()
					}
					datas[index][fm.name]=columnData
				}
			}
		}
		dataList.eachWithIndex{it,index->
			datas[index]["id"]=it.id
		}
		def json=[
				"data" :datas
		]
	}
	/*
	 * @param
	 * @param
	 *
	 **/
	//params 需要有名为tableData,ajaxData的JSON字符串
	static def parseTableData(Map params){
		def tableData=JSON.parse(params."tableData")
		def ajaxData = JSON.parse(params.ajaxData)
		def orderTarget = ajaxData["orderTarget"]
		def map=[max:5000]

		if(tableData){
			def start=tableData.start?tableData.start:0
			def length=tableData.length ? tableData.length : 500
			def offset = start
			def max = length
			def columns = tableData.columns
			map=[searchs:[:],orders:[],offset:offset,max:max]
			//处理orders
			tableData["order"].each{
				def order =[order:it.dir]
				if(orderTarget[it.column]){
					order["sort"]=orderTarget[it.column].toString()
				}else{
					order["sort"]=columns[it.column]["name"].toString()
				}
				if(order["sort"].lastIndexOf("()")==-1){
					map["orders"]<<order
				}
			}
			//处理searchs
			columns.each{
				if(it["searchable"]&&tableData["search"]["value"]){
					map["searchs"][it['name']]=tableData["search"]["value"]
				}
				if(it["search"]["value"]){
					map["searchs"][it['name']]=it["search"]["value"]
				}
			}
		}
		[map,ajaxData,tableData]

	}
/*	static private def buildData(columns,htmlEncode,dataList){
		def datas=[]
		dataList.each{
			def data =[:]
			columns.eachWithIndex{column,i ->
				def columnData=""
				if(column.name.indexOf("()")!=-1){
					columnData=it.invokeMethod(column.data,null)
				}else{
					columnData=it[column.data]
				}
				columnData?columnData.toString():""
				if(htmlEncode[i]){
					columnData=columnData.encodeAsHTML()
				}
				data[column["data"]]=columnData
			}
			datas<<data
		}
		datas
	}*/

	//defaultStrings 默认的table字段名(不写就不会添加该数据)
	static private def buildData(columns,ajaxData,dataList){
 		def htmlEncode=ajaxData["htmlEncode"]
		def defaultMap=ajaxData["defaultMap"]
		def datas=buildDatas(defaultMap,dataList)
		columns.eachWithIndex{column,i ->
			if(!defaultMap[column.name]){
				dataList.eachWithIndex{it,index->
					def columnData
					if(column.data.indexOf("{}")==-1){
						columnData=it[column.data]
					}else{
						columnData=it.invokeMethod(column.data.replaceFirst("\\{\\}",""),null)
					}
					columnData=columnData!=null?columnData.toString():""
					if(htmlEncode[i]){
						columnData=columnData.encodeAsHTML()
					}
					datas[index][column["data"]]=columnData
				}
			}
		}
		datas
	}
	//判断这个alias是否已经存在
	static private  def hasAlias(subcriteriaList,sortList,sortCloneList,sortString,index){
		if(index>0){
			sortString="${sortCloneList[index-1]}.$sortString"
		}
		for(def c in subcriteriaList){
			if(c.path==sortString){
				sortList[index]=c.alias
				return true
			}
		}
		false
	}
	static private def buildDatas(defaultMap,dataList){
		def size = dataList.size()
		def datas=[]
		def data=[:]
		if(defaultMap["multiSelect"]){
			data["multiSelect"]=" <input style=\"width: 30px;text-align: center;\" type=\"checkbox\" name=\"checkbox_name[]\">"
		}
		for (int i=0;i<size;i++){
			datas<<data.clone()
		}


		for (int i=0;i<size;i++){
			if(defaultMap["orderNumber"]){
				datas[i]["orderNumber"]=i+1
			}
			if(defaultMap["actionList"]){
				datas[i]["actionList"]=actionListToString(defaultMap["actionList"],dataList[i])
			}
		}

		datas
	}
	static def actionListToString(actionList,data){
/*		GrailsWebRequest webUtils = WebUtils.retrieveGrailsWebRequest()
		def request = webUtils.getCurrentRequest()*/
		StringBuffer acl=new StringBuffer()
		if(actionList){
			acl.append("<div>")
			actionList.each{
				if(it.method){
					def method=it.method.replace("()","")
					def result = data."$method"()
					if(result){
						switch(result.getClass()){
							case [Boolean,boolean]:
									acl.append("<a  class=\"${it.class}\" ${it.url?"msHref=\"${it.url}\"":""}>${it.action}</a>")
								break;
							default:
									acl.append("<a  class=\"${it.class}\" ${it.url?"msHref=\"${it.url}\"":""}>${result}</a>")
								break;
						}
					}
				}else{
					acl.append("<a  class=\"${it.class}\" ${it.url?"msHref=\"${it.url}\"":""}>${it.action}</a>")
				}
			}
			acl.append("</div>")
		}
		acl.toString()
	}
	//避免offset大于dataCount
	static private def changeOffset(map,dataCount){
		if(map.offset>=dataCount){
			map.offset=(dataCount%map.max)==0?(dataCount-map.max<0?0:dataCount-map.max):dataCount-(dataCount%map.max)
		}
	}


}
