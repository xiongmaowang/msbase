package com.ms.tree;

import java.io.Serializable;

public class MsTreeOperate extends MsTree implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String loadMsTreeNodeUrl;//页面加载地址
	private String editMsTreeNodeUrl;//编辑时获取后台数据的url地址
	private String delMsTreeNodeUrl; //删除节点url地址
	
	public String getLoadMsTreeNodeUrl() {
		return loadMsTreeNodeUrl;
	}
	public void setLoadMsTreeNodeUrl(String loadMsTreeNodeUrl) {
		this.loadMsTreeNodeUrl = loadMsTreeNodeUrl;
	}
	public String getEditMsTreeNodeUrl() {
		return editMsTreeNodeUrl;
	}
	public void setEditMsTreeNodeUrl(String editMsTreeNodeUrl) {
		this.editMsTreeNodeUrl = editMsTreeNodeUrl;
	}
	public String getDelMsTreeNodeUrl() {
		return delMsTreeNodeUrl;
	}
	public void setDelMsTreeNodeUrl(String delMsTreeNodeUrl) {
		this.delMsTreeNodeUrl = delMsTreeNodeUrl;
	}
}