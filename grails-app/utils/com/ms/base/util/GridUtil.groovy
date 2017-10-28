package com.ms.base.util

import com.ms.annotation.GridColumn

import java.lang.annotation.IncompleteAnnotationException
import java.lang.reflect.Field
import java.lang.reflect.Method

class GridUtil {
	def items=[[]]

	def buildLayoutJSON = {Object->
		items[0]<<["name":"序号","width":"35px","colIdx":0,"field":"rowIndex"]
		Field[] fields = Object.class.getDeclaredFields()
		Method[] methods = Object.class.getDeclaredMethods()

		def _this = this
		int i=0
		fields.eachWithIndex{it,idx->
			GridColumn gcol = it.getAnnotation(GridColumn.class)
			if(_this.addItem(gcol, it.name, i)){
				i++
			}
		}
		
		int j=0
		methods.eachWithIndex{it,idx->
			GridColumn gcol = it.getAnnotation(GridColumn.class)
			if(_this.addItem(gcol,it.name,j+i)){
				j++
			}
		}

//		def initializer = new ConvertersConfigurationInitializer()
//		initializer.initialize()
		
		/*
		 * json
		 */
//		def builder = new JSONBuilder()
//		def result = builder.build {
//			[[type:"dojox.grid._CheckBoxSelector"],[cells:items]]
//		}
		def result = items[0]
		return result
	}

	def buildDataList = {identifier,label,dataList,offset->
		int i = 1;
		if(offset!=null) i=offset+1
		def tmp0 = []
		dataList.each{
			Field[] fields = it.class.getDeclaredFields()
			Method[] methods = it.class.getDeclaredMethods()
			def tmp1 = [:]
			fields.grep{field0->
				field0.getAnnotation(GridColumn.class)!=null || field0.name.equalsIgnoreCase("id")
			}.each{field->
				field.setAccessible(true)
				tmp1[field.name] = field.get(it)
			}
			tmp1["rowIndex"] = i
			i++
			
			methods.grep{method0->
				method0.getAnnotation(GridColumn.class)!=null
			}.each{method->
				tmp1[method.name] = method.invoke(it)
			}
			tmp0<<tmp1
		}
		def result = [identifier:identifier,label:label,items:tmp0]
		return result
	}

	boolean addItem(GridColumn gcol,String name,int idx){
		def item = [:]
		if(gcol!=null){
			boolean visible = true
			try{
				visible = gcol.visible()
			}catch(IncompleteAnnotationException iae0){
				//empty
			}

			if(!visible){
				return false
			}

			try{
				item<<["name":gcol.name()]
			}catch(IncompleteAnnotationException iae1){
				println iae0.message
			}

			item<<["field":name]

			try{
				item<<["width":gcol.width()]
			}catch(IncompleteAnnotationException iae2){
				item<<["width":"auto"]
			}

			try{
				item<<["colIdx":gcol.colIdx()]
			}catch(IncompleteAnnotationException iae3){
				item<<["colIdx":idx+1]
			}

			try{
				item<<["styles":gcol.styles()]
			}catch(IncompleteAnnotationException iae4){
				//empty
			}

			try{
				item<<["type":gcol.type()]
			}catch(IncompleteAnnotationException iae5){
				//empty
			}
			
			try{
				item<<["formatter":gcol.formatter()]
			}catch(IncompleteAnnotationException iae6){
				//empty
			}

			int i = item["colIdx"]
			
			if(i >= idx+1){
				items[0][idx+1] = item
			}else if(i<idx+1){
				items[0][idx+1]=[]
				for(int j=idx+1;j>i;j--){
					items[0][j] = items[0][j-1]
					if(items[0][j]!=null){
						items[0][j]["colIdx"] = j
					}
				}
				items[0][i] = item
			}
			return true
		}else{
			return false
		}
	}
}
