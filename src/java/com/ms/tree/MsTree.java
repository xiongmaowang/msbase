package com.ms.tree;

import java.io.Serializable;

public class MsTree implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;	//节点id
	private String name;//节点名称
	private String pId;	//父节点id
	private int parent;//0：父节点(显示文件夹图标)，1：子节点(显示文件图标)
	private String iconClose;//关闭节点
	private String iconOpen;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getIconClose() {
		return iconClose;
	}
	public void setIconClose(String iconClose) {
		this.iconClose = iconClose;
	}
	public String getIconOpen() {
		return iconOpen;
	}
	public void setIconOpen(String iconOpen) {
		this.iconOpen = iconOpen;
	}
}