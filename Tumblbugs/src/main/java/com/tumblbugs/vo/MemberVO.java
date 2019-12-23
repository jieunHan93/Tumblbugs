package com.tumblbugs.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MemberVO {
	String email,name,pass,profile_img,profile_simg,intro,phone,website,reg_date,use_yn,signkey,certificate;
	
	int rno;
	CommonsMultipartFile profile_cimg;
	
	

	

	public CommonsMultipartFile getProfile_cimg() {
		return profile_cimg;
	}

	public void setProfile_cimg(CommonsMultipartFile profile_cimg) {
		this.profile_cimg = profile_cimg;
	}

	public String getSignkey() {
		return signkey;
	}

	public void setSignkey(String signkey) {
		this.signkey = signkey;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getProfile_img() {
		return profile_img;
	}
	
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
	public String getProfile_simg() {
		return profile_simg;
	}
	
	public void setProfile_simg(String profile_simg) {
		this.profile_simg = profile_simg;
	}
	
	public String getIntro() {
		return intro;
	}
	
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getWebsite() {
		return website;
	}
	
	public void setWebsite(String website) {
		this.website = website;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getUse_yn() {
		return use_yn;
	}
	
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}


}
