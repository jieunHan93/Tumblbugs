package com.tumblbugs.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class CollectionVO {
	/*이름            널        유형             tum_collection
	------------- -------- -------------- 
	COL_ID        NOT NULL VARCHAR2(100)  
	COL_NAME      NOT NULL VARCHAR2(300)  
	COL_CONTANT   NOT NULL VARCHAR2(700)  
	COL_REGDATE   NOT NULL DATE           
	COL_STARTDATE NOT NULL DATE           
	COL_ENDDATE   NOT NULL DATE           
	COL_CONTROLL  NOT NULL VARCHAR2(100)  
	COL_STATUS    NOT NULL VARCHAR2(100)  
	COL_IMG       NOT NULL VARCHAR2(1000) 
	COL_SIMG               VARCHAR2(1000) 
	COL_BCOLOR    NOT NULL VARCHAR2(100)  
	COL_CCOLOR    NOT NULL VARCHAR2(100)  */
	int rno, count1, count2, count3, pcount;
	String col_id, col_name, col_content, col_regdate, col_startdate, col_enddate, col_controll, col_status, col_img, col_simg, col_bcolor, col_ccolor, col_addr;
	CommonsMultipartFile cofile;
	
	// 컬렉션에 프로젝트 추가를 위한 필드
	String pj_id, pj_category, pj_title, name, pj_start_date, pj_end_date, col_pj_regdate;
	
	
	public String getCol_addr() {
		return col_addr;
	}
	public void setCol_addr(String col_addr) {
		this.col_addr = col_addr;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getPj_id() {
		return pj_id;
	}
	public void setPj_id(String pj_id) {
		this.pj_id = pj_id;
	}
	public String getPj_category() {
		return pj_category;
	}
	public void setPj_category(String pj_category) {
		this.pj_category = pj_category;
	}
	public String getPj_title() {
		return pj_title;
	}
	public void setPj_title(String pj_title) {
		this.pj_title = pj_title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPj_start_date() {
		return pj_start_date;
	}
	public void setPj_start_date(String pj_start_date) {
		this.pj_start_date = pj_start_date;
	}
	public String getPj_end_date() {
		return pj_end_date;
	}
	public void setPj_end_date(String pj_end_date) {
		this.pj_end_date = pj_end_date;
	}
	public String getCol_pj_regdate() {
		return col_pj_regdate;
	}
	public void setCol_pj_regdate(String col_pj_regdate) {
		this.col_pj_regdate = col_pj_regdate;
	}
	public int getCount1() {
		return count1;
	}
	public void setCount1(int count1) {
		this.count1 = count1;
	}
	public int getCount2() {
		return count2;
	}
	public void setCount2(int count2) {
		this.count2 = count2;
	}
	public int getCount3() {
		return count3;
	}
	public void setCount3(int count3) {
		this.count3 = count3;
	}
	public CommonsMultipartFile getCofile() {
		return cofile;
	}
	public void setCofile(CommonsMultipartFile cofile) {
		this.cofile = cofile;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
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
	public String getCol_content() {
		return col_content;
	}
	public void setCol_content(String col_content) {
		this.col_content = col_content;
	}
	public String getCol_regdate() {
		return col_regdate;
	}
	public void setCol_regdate(String col_regdate) {
		this.col_regdate = col_regdate;
	}
	public String getCol_startdate() {
		return col_startdate;
	}
	public void setCol_startdate(String col_startdate) {
		this.col_startdate = col_startdate;
	}
	public String getCol_enddate() {
		return col_enddate;
	}
	public void setCol_enddate(String col_enddate) {
		this.col_enddate = col_enddate;
	}
	public String getCol_controll() {
		return col_controll;
	}
	public void setCol_controll(String col_controll) {
		this.col_controll = col_controll;
	}
	public String getCol_status() {
		return col_status;
	}
	public void setCol_status(String col_status) {
		this.col_status = col_status;
	}
	public String getCol_img() {
		return col_img;
	}
	public void setCol_img(String col_img) {
		this.col_img = col_img;
	}
	public String getCol_simg() {
		return col_simg;
	}
	public void setCol_simg(String col_simg) {
		this.col_simg = col_simg;
	}
	public String getCol_bcolor() {
		return col_bcolor;
	}
	public void setCol_bcolor(String col_bcolor) {
		this.col_bcolor = col_bcolor;
	}
	public String getCol_ccolor() {
		return col_ccolor;
	}
	public void setCol_ccolor(String col_ccolor) {
		this.col_ccolor = col_ccolor;
	}
	
}
