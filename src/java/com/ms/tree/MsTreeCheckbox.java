package com.ms.tree;

import java.io.Serializable;

public class MsTreeCheckbox extends MsTree implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int chked;//0：勾选复选框，1：不勾选
	
	public int getChked() {
		return chked;
	}
	public void setChked(int chked) {
		this.chked = chked;
	}
}
