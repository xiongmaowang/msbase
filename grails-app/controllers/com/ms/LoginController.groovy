/* Copyright 2013 SpringSource.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.ms

import com.ms.base.User
import com.ms.base.util.LogUtil
import com.ms.systemEnum.SystemLogAction
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.web.WebAttributes

import javax.servlet.http.HttpServletResponse
import java.util.concurrent.ConcurrentSkipListMap

class LoginController {
	def mobileLogin={
		def model =[:]
		render(view:'/login/mobileLogin',model:model)
	}
	
	def mobileIndex ={
		if (springSecurityService.isLoggedIn()) {
			def model =[:]
			def user = springSecurityService.getCurrentUser()
			
			model["user"] = user
			render (view: "/mobile/main",model:model)
			
		}else{
			redirect action: 'mobileLogin'
		}
	}
	private def addLoginInformation = {user->
		if(!"admin".equals(user.username)){
			LogUtil.createSystemLog(user, SystemLogAction.LOG, "用户登录",this.controllerName, request)
		}
		
	}
	/**
	 * Dependency injection for the authenticationTrustResolver.
	 */
	def authenticationTrustResolver

	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService
	
	def serialNoService 
	
	/**
	 * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
	 */
	def index() {
		if(session.logintype && "mobile".equals(session.logintype)){
			redirect action: 'mobileIndex', params: params
			return;
		}
		if (springSecurityService.isLoggedIn()) {
			User user = springSecurityService.getCurrentUser()
			//添加用户登录记录信息 
			addLoginInformation(user)
			def model =[:]
			model["user"] = user
			//-----------------------------------------------------
			//首页工作计划日历展示
			Calendar calendar = Calendar.getInstance()
			model["nowDay"] = calendar.get(Calendar.DAY_OF_WEEK)
			calendar.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY)
			model["firstDay"] = calendar.getTime()
			model["weekNum"] = calendar.get(Calendar.DAY_OF_WEEK_IN_MONTH)
/*			def resource= user.getAuthorities()
			def models =[] as Set
			ConcurrentSkipListMap modPAndRes=new ConcurrentSkipListMap()
			resource.each{
				if(it.enabled){
					if(it.model&&!it.model.parent){
						modPAndRes[it.model]=""
					}else if(!it.model){
						modPAndRes[it]=""
					}
					models<<it.model
				}
			}
			def rsSet=resource+models
			def query
			query={cMap->
				if(cMap){
					cMap.each{
						if(it.key.getClass()==com.ms.base.Model){
							def set=it.key.children + it.key.resources
							set.removeAll {a-> !(a in rsSet)}
							if(set){
								def map =new ConcurrentSkipListMap()
								set.each{s->
									map[s]=""
								}
								cMap[it.key]=map
								query.trampoline(map)
							}
						}
					}
				}
			}.trampoline()
			query(modPAndRes)
			model["modPAndRes"]=modPAndRes*/
			render (view:SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl + "index",model:model)
		}
		else {
			redirect action: 'auth', params: params
		}
	}
	def addSerialNo ={
		if(params.j_username){
			def user = User.findByUsername(params.j_username)
			if(user){
				if("rostenadmin".equals(user.username) || user.sysFlag){
					serialNoService.addOrChangeSerial(params.serialNo.replaceAll(" ", "").trim())
				}
			}
		}
		redirect controller: 'j_spring_security_logout'
	}
	def dlgauth = {
		def config = SpringSecurityUtils.securityConfig
		
		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}
		String view = "dlgauth"
		render view:view
	}
	
	//判断是否手机客户端
	def boolean JudgeIsMobile(String requestHeader) {
		boolean isMoblie = false;
		def mobileAgents = [ "iphone", "android", "phone",  "wap", "netfront", "java", "opera mobi",
				"opera mini", "ucweb", "windows ce", "symbian", "series", "webos", "sony", "blackberry", "dopod",
				"nokia", "samsung", "palmsource", "xda", "pieplus", "meizu", "midp", "cldc", "motorola", "foma",
				"docomo", "up.browser", "up.link", "blazer", "helio", "hosin", "huawei", "novarra", "coolpad", "webos",
				"techfaith", "palmsource", "alcatel", "amoi", "ktouch", "nexian", "ericsson", "philips", "sagem",
				"wellcom", "bunjalloo", "maui", "smartphone", "iemobile", "spice", "bird", "zte-", "longcos",
				"pantech", "gionee", "portalmmm", "jig browser", "hiptop", "benq", "haier", "^lct", "320x320",
				"240x320", "176x220", "w3c ", "acs-", "alav", "alca", "amoi", "audi", "avan", "benq", "bird", "blac",
				"blaz", "brew", "cell", "cldc", "cmd-", "dang", "doco", "eric", "hipt", "inno", "ipaq", "java", "jigs",
				"kddi", "keji", "leno", "lg-c", "lg-d", "lg-g", "lge-", "maui", "maxo", "midp", "mits", "mmef",
				"mot-", "moto", "mwbp", "nec-", "newt", "noki", "oper", "palm", "pana", "pant", "phil", "play", "port",
				"prox", "qwap", "sage", "sams", "sany", "sch-", "sec-", "send", "seri", "sgh-", "shar", "sie-", "siem",
				"smal", "smar", "sony", "sph-", "symb", "t-mo", "teli", "tim-", "tosh", "tsm-", "upg1", "upsi", "vk-v",
				"voda", "wap-", "wapa", "wapi", "wapp", "wapr", "webc", "winw", "winw", "xda", "xda-",
				"Googlebot-Mobile" ]
		if (requestHeader != null) {
			for (String mobileAgent : mobileAgents) {
				if (requestHeader.toLowerCase().indexOf(mobileAgent) >= 0) {
					isMoblie = true;
					break;
				}
			}
		}
		return isMoblie;
		
	}
	
	/**
	 * Show the login page.
	 */
	def auth() {
		if(session.logintype && "mobile".equals(session.logintype)){
			redirect action: 'mobileIndex', params: params
			return;
		}
		def config = SpringSecurityUtils.securityConfig

		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}

		String view = 'auth'
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view: view, model: [postUrl: postUrl,
		                           rememberMeParameter: config.rememberMe.parameter]

	}

/*	def  aaaa(){
		redirect(uri:"/j_spring_security_check",params: [j_username:"admin",j_password:"1"])
	}
	def bbb(){
		println 22222222
		println params
	}*/
	/**
	 * The redirect action for Ajax requests.
	 */
	def authAjax() {
		response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
		response.sendError HttpServletResponse.SC_UNAUTHORIZED
	}

	/**
	 * Show denied page.
	 */
	def denied() {
		if (springSecurityService.isLoggedIn() &&
				authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
			// have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
			redirect action: 'full', params: params
		}
	}

	/**
	 * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
	 */
	def full() {
		def config = SpringSecurityUtils.securityConfig
		render view: 'auth', params: params,
			model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
			        postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
	}

	/**
	 * Callback after a failed login. Redirects to the auth page with a warning message.
	 */
	def authfail() {

		String msg = ''
		def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
		if (exception) {
			if (exception instanceof AccountExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.expired")
			}
			else if (exception instanceof CredentialsExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.passwordExpired")
			}
			else if (exception instanceof DisabledException) {
				msg = g.message(code: "springSecurity.errors.login.disabled")
			}
			else if (exception instanceof LockedException) {
				msg = g.message(code: "springSecurity.errors.login.locked")
			}
			else {
				msg = g.message(code: "springSecurity.errors.login.fail")
			}
		}

		if (springSecurityService.isAjax(request)) {
			render([error: msg] as JSON)
		}
		else {
			flash.message = msg
			redirect action: 'auth', params: params
		}
	}

	/**
	 * The Ajax success redirect url.
	 */
	def ajaxSuccess() {
		render([success: true, username: springSecurityService.authentication.name] as JSON)
	}

	/**
	 * The Ajax denied redirect url.
	 */
	def ajaxDenied() {
		render([error: 'access denied'] as JSON)
	}
}
