package com.ms.base.util

import com.ms.base.User
import com.ms.sms.SmsLog
import com.ms.sms.SystemLog
import com.ms.systemEnum.SystemLogAction

import javax.servlet.http.HttpServletRequest

class LogUtil {

	/*日志记录
	 * @param user 用户对象
	 * @param action SystemLogAction的枚举类型
	 * @param content 注释
	 * @param controName 控制器名称
	 * @param request
	 * */
	static def createSystemLog(User user, SystemLogAction action, String content, String controName, HttpServletRequest  request){
		def macAddress = Util.getMacAddress()
		def ipAddress = Util.getIpAddress(request)
		def systemLog = new SystemLog()
		systemLog.user = user
		systemLog.ipAddress= ipAddress
		systemLog.macAddress= macAddress
		systemLog.action= action
		systemLog.content=content
		systemLog.controllerName=controName
		systemLog.save()
	} 
	/*发送信息记录
	* @param phone 手机号码
	* @param smsType 短信类型 0:校验类 1:触发类 2：群发类
	* @param smsContent 短信内容
	* @param request
	* @return
	* */ 
	static def createSmsLog(String phone,String smsType,String smsContent,HttpServletRequest  request){
		def macAddress = Util.getMacAddress()
		def ipAddress = Util.getIpAddress(request)
		def smsLog = new SmsLog()
		
		smsLog.phone= phone
		smsLog.smsType= smsType
		smsLog.smsContent=smsContent
		smsLog.ipAddress= ipAddress
		smsLog.macAddress= macAddress
		smsLog.save()
	} 
}
