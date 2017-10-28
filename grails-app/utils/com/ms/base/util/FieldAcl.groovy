package com.ms.base.util

class FieldAcl {
	def readOnly=[]
	
	def isReadOnly(String fieldname){
		if(fieldname in readOnly){
			"readOnly:true"
		}else{
			"readOnly:false"
		}
	}
}
