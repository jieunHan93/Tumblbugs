package com.tumblbugs.vo;

import java.util.List;

public class FundingVO {
	String funding_id, pj_id, email, funding_date, extra_funding_price, total_funding_price, payment_id, payment_info, payment_complete_yn,
			recipient_name, recipient_addr, recipient_phone, recipient_request, delivery_start_date, courier, invoice_number, delivery_complete_yn,
			pj_title, pj_simg, remaining_days, name, pj_end_date, pj_pay_date, payment,
			project_status, payment_status;	//db에서 가져온 뒤 dao에서 가공해 set해주는 필드
	int achievement_rate;
	List<FundingGiftVO> giftList;
	
	public List<FundingGiftVO> getGiftList() {
		return giftList;
	}

	public void setGiftList(List<FundingGiftVO> giftList) {
		this.giftList = giftList;
	}

	public String getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(String funding_id) {
		this.funding_id = funding_id;
	}

	public String getPj_id() {
		return pj_id;
	}

	public void setPj_id(String pj_id) {
		this.pj_id = pj_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFunding_date() {
		return funding_date;
	}

	public void setFunding_date(String funding_date) {
		this.funding_date = funding_date;
	}

	public String getExtra_funding_price() {
		return extra_funding_price;
	}

	public void setExtra_funding_price(String extra_funding_price) {
		this.extra_funding_price = extra_funding_price;
	}

	public String getTotal_funding_price() {
		return total_funding_price;
	}

	public void setTotal_funding_price(String total_funding_price) {
		this.total_funding_price = total_funding_price;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	
	public String getPayment_info() {
		return payment_info;
	}

	public void setPayment_info(String payment_info) {
		this.payment_info = payment_info;
	}

	public String getPayment_complete_yn() {
		return payment_complete_yn;
	}

	public void setPayment_complete_yn(String payment_complete_yn) {
		this.payment_complete_yn = payment_complete_yn;
	}

	public String getRecipient_name() {
		return recipient_name;
	}

	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}

	public String getRecipient_addr() {
		return recipient_addr;
	}

	public void setRecipient_addr(String recipient_addr) {
		this.recipient_addr = recipient_addr;
	}

	public String getRecipient_phone() {
		return recipient_phone;
	}

	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}

	public String getRecipient_request() {
		return recipient_request;
	}

	public void setRecipient_request(String recipient_request) {
		this.recipient_request = recipient_request;
	}

	public String getDelivery_start_date() {
		return delivery_start_date;
	}

	public void setDelivery_start_date(String delivery_start_date) {
		this.delivery_start_date = delivery_start_date;
	}

	public String getCourier() {
		return courier;
	}

	public void setCourier(String courier) {
		this.courier = courier;
	}

	public String getInvoice_number() {
		return invoice_number;
	}

	public void setInvoice_number(String invoice_number) {
		this.invoice_number = invoice_number;
	}

	public String getDelivery_complete_yn() {
		return delivery_complete_yn;
	}

	public void setDelivery_complete_yn(String delivery_complete_yn) {
		this.delivery_complete_yn = delivery_complete_yn;
	}

	public String getPj_title() {
		return pj_title;
	}

	public void setPj_title(String pj_title) {
		this.pj_title = pj_title;
	}

	public String getPj_simg() {
		return pj_simg;
	}

	public void setPj_simg(String pj_simg) {
		this.pj_simg = pj_simg;
	}

	public String getRemaining_days() {
		return remaining_days;
	}

	public void setRemaining_days(String remaining_days) {
		this.remaining_days = remaining_days;
	}

	public int getAchievement_rate() {
		return achievement_rate;
	}

	public void setAchievement_rate(int achievement_rate) {
		this.achievement_rate = achievement_rate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPj_end_date() {
		return pj_end_date;
	}

	public void setPj_end_date(String pj_end_date) {
		this.pj_end_date = pj_end_date;
	}
	
	public String getPayment() {
		return payment;
	}
	
	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getPj_pay_date() {
		return pj_pay_date;
	}

	public void setPj_pay_date(String pj_pay_date) {
		this.pj_pay_date = pj_pay_date;
	}

	public String getProject_status() {
		return project_status;
	}

	public void setProject_status(String project_status) {
		this.project_status = project_status;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	
	
}
