package com.tumblbugs.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BannerVO {
	/*BA_ID        NOT NULL VARCHAR2(100)  
	BA_TITLE     NOT NULL VARCHAR2(1000) 
	BA_CONTENT   NOT NULL VARCHAR2(1000) 
	PJ_ID                 VARCHAR2(1000) 
	BA_IMG       NOT NULL VARCHAR2(1000) 
	BA_SIMG               VARCHAR2(1000) 
	BA_STARTDATE NOT NULL DATE           
	BA_ENDDATE   NOT NULL DATE           
	BA_ORDER              NUMBER(2)      
	BA_CONTROLL  NOT NULL VARCHAR2(1)    
	BA_STATUS    NOT NULL VARCHAR2(100)  */
	
	String ba_id, ba_content, pj_id, ba_img, ba_simg, ba_startdate, ba_enddate, ba_controll, ba_status;
	int ba_order;
	CommonsMultipartFile ba_cimg;
	
	public CommonsMultipartFile getBa_cimg() {
		return ba_cimg;
	}
	public void setBa_cimg(CommonsMultipartFile ba_cimg) {
		this.ba_cimg = ba_cimg;
	}
	public String getBa_id() {
		return ba_id;
	}
	public void setBa_id(String ba_id) {
		this.ba_id = ba_id;
	}
	public String getBa_content() {
		return ba_content;
	}
	public void setBa_content(String ba_content) {
		this.ba_content = ba_content;
	}
	public String getPj_id() {
		return pj_id;
	}
	public void setPj_id(String pj_id) {
		this.pj_id = pj_id;
	}
	public String getBa_img() {
		return ba_img;
	}
	public void setBa_img(String ba_img) {
		this.ba_img = ba_img;
	}
	public String getBa_simg() {
		return ba_simg;
	}
	public void setBa_simg(String ba_simg) {
		this.ba_simg = ba_simg;
	}
	public String getBa_startdate() {
		return ba_startdate;
	}
	public void setBa_startdate(String ba_startdate) {
		this.ba_startdate = ba_startdate;
	}
	public String getBa_enddate() {
		return ba_enddate;
	}
	public void setBa_enddate(String ba_enddate) {
		this.ba_enddate = ba_enddate;
	}
	public String getBa_controll() {
		return ba_controll;
	}
	public void setBa_controll(String ba_controll) {
		this.ba_controll = ba_controll;
	}
	public String getBa_status() {
		return ba_status;
	}
	public void setBa_status(String ba_status) {
		this.ba_status = ba_status;
	}
	public int getBa_order() {
		return ba_order;
	}
	public void setBa_order(int ba_order) {
		this.ba_order = ba_order;
	}
	
	
}
