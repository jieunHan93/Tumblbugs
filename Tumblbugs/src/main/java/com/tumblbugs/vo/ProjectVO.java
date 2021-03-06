package com.tumblbugs.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ProjectVO {
	
	//project 테이블
	String pj_id, pj_title, pj_stitle, pj_img, pj_simg, pj_summary, pj_category, pj_addr, pj_tag, email, pj_reg_date, pj_start_date,
			pj_end_date, pj_class, pj_refund, pj_story, pj_account_type, pj_account_name, pj_bank, pj_check_request_date, pj_check_yn, pj_reject,
			pj_success_yn, pj_price, pj_account_number,
			pj_email, pj_phone, pj_account_id, editor_recommend;
	
	int rno, total_price, start_extra_date, pj_extra_date;
	
	CommonsMultipartFile pj_cimg;
	
	//추가 정보
	String total_funding_price, 		//모인 금액
			pay_complete_funding_price, //결제 완료된 후원 금액
			achievement_rate,			//달성률
			remaining_days,				//남은 기간
			total_sponsor_count,		//후원자 수
			pj_pay_date,				//결제 예정일
			pj_pay_end_date,			//결제 마감일
			pj_bill_date, 				//예상 정산일
			community_count,			//커뮤니티 게시글 수
			name, profile_simg, intro;	//창작자 이름, 프로필이미지, 소개
	
	String funding, status, progress;
	
	public String getPay_complete_funding_price() {
		return pay_complete_funding_price;
	}

	public void setPay_complete_funding_price(String pay_complete_funding_price) {
		this.pay_complete_funding_price = pay_complete_funding_price;
	}

	public String getEditor_recommend() {
		return editor_recommend;
	}

	public void setEditor_recommend(String editor_recommend) {
		this.editor_recommend = editor_recommend;
	}

	public int getStart_extra_date() {
		return start_extra_date;
	}

	public void setStart_extra_date(int start_extra_date) {
		this.start_extra_date = start_extra_date;
	}

	public String getPj_check_request_date() {
		return pj_check_request_date;
	}

	public void setPj_check_request_date(String pj_check_request_date) {
		this.pj_check_request_date = pj_check_request_date;
	}

	public int getPj_extra_date() {
		return pj_extra_date;
	}

	public void setPj_extra_date(int pj_extra_date) {
		this.pj_extra_date = pj_extra_date;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getFunding() {
		return funding;
	}

	public void setFunding(String funding) {
		this.funding = funding;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getPj_email() {
		return pj_email;
	}

	public void setPj_email(String pj_email) {
		this.pj_email = pj_email;
	}

	public String getPj_phone() {
		return pj_phone;
	}

	public void setPj_phone(String pj_phone) {
		this.pj_phone = pj_phone;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public CommonsMultipartFile getPj_cimg() {
		return pj_cimg;
	}

	public void setPj_cimg(CommonsMultipartFile pj_cimg) {
		this.pj_cimg = pj_cimg;
	}

	public String getPj_id() {
		return pj_id;
	}

	public void setPj_id(String pj_id) {
		this.pj_id = pj_id;
	}

	public String getPj_title() {
		return pj_title;
	}

	public void setPj_title(String pj_title) {
		this.pj_title = pj_title;
	}

	public String getPj_stitle() {
		return pj_stitle;
	}

	public void setPj_stitle(String pj_stitle) {
		this.pj_stitle = pj_stitle;
	}

	public String getPj_img() {
		return pj_img;
	}

	public void setPj_img(String pj_img) {
		this.pj_img = pj_img;
	}

	public String getPj_simg() {
		return pj_simg;
	}

	public void setPj_simg(String pj_simg) {
		this.pj_simg = pj_simg;
	}

	public String getPj_summary() {
		return pj_summary;
	}

	public void setPj_summary(String pj_summary) {
		this.pj_summary = pj_summary;
	}

	public String getPj_category() {
		return pj_category;
	}

	public void setPj_category(String pj_category) {
		this.pj_category = pj_category;
	}

	public String getPj_addr() {
		return pj_addr;
	}

	public void setPj_addr(String pj_addr) {
		this.pj_addr = pj_addr;
	}

	public String getPj_tag() {
		return pj_tag;
	}

	public void setPj_tag(String pj_tag) {
		this.pj_tag = pj_tag;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPj_reg_date() {
		return pj_reg_date;
	}

	public void setPj_reg_date(String pj_reg_date) {
		this.pj_reg_date = pj_reg_date;
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

	public String getPj_class() {
		return pj_class;
	}

	public void setPj_class(String pj_class) {
		this.pj_class = pj_class;
	}

	public String getPj_refund() {
		return pj_refund;
	}

	public void setPj_refund(String pj_refund) {
		this.pj_refund = pj_refund;
	}

	public String getPj_story() {
		return pj_story;
	}

	public void setPj_story(String pj_story) {
		this.pj_story = pj_story;
	}

	public String getPj_account_type() {
		return pj_account_type;
	}

	public void setPj_account_type(String pj_account_type) {
		this.pj_account_type = pj_account_type;
	}

	public String getPj_account_name() {
		return pj_account_name;
	}

	public void setPj_account_name(String pj_account_name) {
		this.pj_account_name = pj_account_name;
	}

	public String getPj_bank() {
		return pj_bank;
	}

	public void setPj_bank(String pj_bank) {
		this.pj_bank = pj_bank;
	}

	public String getPj_check_yn() {
		return pj_check_yn;
	}

	public void setPj_check_yn(String pj_check_yn) {
		this.pj_check_yn = pj_check_yn;
	}

	public String getPj_reject() {
		return pj_reject;
	}

	public void setPj_reject(String pj_reject) {
		this.pj_reject = pj_reject;
	}

	public String getPj_success_yn() {
		return pj_success_yn;
	}

	public void setPj_success_yn(String pj_success_yn) {
		this.pj_success_yn = pj_success_yn;
	}

	public String getPj_price() {
		return pj_price;
	}

	public void setPj_price(String pj_price) {
		this.pj_price = pj_price;
	}

	public String getPj_account_id() {
		return pj_account_id;
	}

	public void setPj_account_id(String pj_account_id) {
		this.pj_account_id = pj_account_id;
	}

	public String getPj_account_number() {
		return pj_account_number;
	}

	public void setPj_account_number(String pj_account_number) {
		this.pj_account_number = pj_account_number;
	}

	public String getTotal_funding_price() {
		return total_funding_price;
	}

	public void setTotal_funding_price(String total_funding_price) {
		this.total_funding_price = total_funding_price;
	}

	public String getAchievement_rate() {
		return achievement_rate;
	}

	public void setAchievement_rate(String achievement_rate) {
		this.achievement_rate = achievement_rate;
	}

	public String getRemaining_days() {
		return remaining_days;
	}

	public void setRemaining_days(String remaining_days) {
		this.remaining_days = remaining_days;
	}

	public String getTotal_sponsor_count() {
		return total_sponsor_count;
	}

	public void setTotal_sponsor_count(String total_sponsor_count) {
		this.total_sponsor_count = total_sponsor_count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getCommunity_count() {
		return community_count;
	}

	public void setCommunity_count(String community_count) {
		this.community_count = community_count;
	}

	public String getPj_pay_date() {
		return pj_pay_date;
	}

	public void setPj_pay_date(String pj_pay_date) {
		this.pj_pay_date = pj_pay_date;
	}

	public String getPj_pay_end_date() {
		return pj_pay_end_date;
	}

	public void setPj_pay_end_date(String pj_pay_end_date) {
		this.pj_pay_end_date = pj_pay_end_date;
	}

	public String getPj_bill_date() {
		return pj_bill_date;
	}

	public void setPj_bill_date(String pj_bill_date) {
		this.pj_bill_date = pj_bill_date;
	}
	
}
