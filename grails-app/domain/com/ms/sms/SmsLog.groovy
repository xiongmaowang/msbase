package com.ms.sms

import com.ms.annotation.GridColumn
import com.ms.base.util.SystemUtil

class SmsLog {
	String id
	
	//手机号码
	@GridColumn(name="手机号码" ,width="80px", colIdx=1)
	String phone
	
	//短信类型
	String smsType
	
	@GridColumn(name="短信类型" ,width="80px", colIdx=2)
	def getSmsTypeText(){
		if("0".equals(smsType)){
			return "校验类"
		}else if("1".equals(smsType)){
			return "触发类"
		}else if("2".equals(smsType)){
			return "群发类"
		}
	}
	//短信内容
	@GridColumn(name="短信内容" , width="300px",colIdx=3)
	String smsContent
	
	
	//ip地址
	@GridColumn(name="ip地址" , width="100px",colIdx=4)
	String ipAddress

	//mac地址
	@GridColumn(name="mac地址", width="100px",colIdx=5)
	String macAddress
	
	Date smsSendTm = new Date()
	@GridColumn(name="发送时间",width="150px",colIdx=6)
	def getSmsSendTmText(){
		if(smsSendTm) {
			return smsSendTm.format("yyyy-MM-dd HH:mm:ss")
		}else{
			return ""
		}
	}
	
    static constraints = {
		phone nullable:false,blank:false
		smsType nullable:false,blank:false
		smsContent nullable:false,blank:false
		smsSendTm nullable:false,blank:false
    }
	
	static mapping = {
		//兼容mysql与oracle
		def systemUtil = new SystemUtil()
		if(systemUtil.getDatabaseType().equals("oracle")){
			smsContent sqlType:"clob"
		}else{
			smsContent sqlType:"text"
		}
	}
}
