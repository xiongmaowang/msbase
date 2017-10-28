package com.ms.base

import com.ms.base.util.SystemUtil
/**
 *	富文本编辑器
 * @author Lin
 *
 */
class Ueditor {
	String id
	
	//富文本内容
	String editorValue
	
	//创建/发布时间
	Date dateCreated
	
	//更新时间
	Date lastUpdated
	
	static mapping = {
		//兼容mysql与oracle
		def systemUtil = new SystemUtil()
		if(systemUtil.getDatabaseType().equals("oracle")){
			editorValue sqlType:"clob"
		}else{
			editorValue sqlType:"longtext"
		}
	}
}
