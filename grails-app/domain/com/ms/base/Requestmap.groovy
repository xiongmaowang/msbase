package com.ms.base

import com.ms.annotation.GridColumn
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import org.springframework.http.HttpMethod

@EqualsAndHashCode(includes=['configAttribute', 'httpMethod', 'url'])
@ToString(includes=['configAttribute', 'httpMethod', 'url'], cache=true, includeNames=true, includePackage=false)
class Requestmap implements Serializable {
	//用于SpringSecurity插件的url权限 
   private static final long serialVersionUID = 1
   String id
   /*配置属性 例如
    *  'IS_AUTHENTICATED_ANONYMOUSLY' 表示任何人都可以进入该url
    * 'ROLE_companyManage' 表示只有拥有权限名为 ROLE_companyManage的用户才可以进入 
    * */
   String configAttribute
   HttpMethod httpMethod
   String url
   static belongsTo = [resource:Resource]
   Requestmap(String url, String configAttribute,
			  HttpMethod httpMethod = null) {
	  this()
	  this.configAttribute = configAttribute
	  this.httpMethod = httpMethod
	  this.url = url
   }

   static constraints = {
	  configAttribute blank: false
	  httpMethod nullable: true
	  url blank: false, unique: 'httpMethod'
   }

   static mapping = {
	  cache true
   }
} 
