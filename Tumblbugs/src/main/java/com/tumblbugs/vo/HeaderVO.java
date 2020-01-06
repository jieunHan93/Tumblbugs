package com.tumblbugs.vo;

import java.io.Serializable;

public class HeaderVO implements Serializable {
	String col_id, col_name, col_addr, col_bcolor;
	
	public String getCol_id() {
		return col_id;
	}
	public void setCol_id(String col_id) {
		this.col_id = col_id;
	}
	public String getCol_name() {
		return col_name;
	}
	public void setCol_name(String col_name) {
		this.col_name = col_name;
	}
	public String getCol_addr() {
		return col_addr;
	}
	public void setCol_addr(String col_addr) {
		this.col_addr = col_addr;
	}
	public String getCol_bcolor() {
		return col_bcolor;
	}
	public void setCol_bcolor(String col_bcolor) {
		this.col_bcolor = col_bcolor;
	}
	
}
