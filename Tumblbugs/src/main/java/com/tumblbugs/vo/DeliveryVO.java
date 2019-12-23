package com.tumblbugs.vo;

import java.util.ArrayList;

public class DeliveryVO {
	String funding_id, name, funding_date, recipient_name,recipient_addr,recipient_phone, recipient_request;
	String gift_title, gift_option, extra_funding_price, courier, invoice_number, delivery_start_date, delivery_complete_yn;
	int rno, gift_quantity, funding_gift_price;
	ArrayList<DeliveryVO> list;
	
	public ArrayList<DeliveryVO> getList() {
		return list;
	}
	public void setList(ArrayList<DeliveryVO> list) {
		this.list = list;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getFunding_id() {
		return funding_id;
	}
	public void setFunding_id(String funding_id) {
		this.funding_id = funding_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFunding_date() {
		return funding_date;
	}
	public void setFunding_date(String funding_date) {
		this.funding_date = funding_date;
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
	public String getGift_title() {
		return gift_title;
	}
	public void setGift_title(String gift_title) {
		this.gift_title = gift_title;
	}
	public String getGift_option() {
		return gift_option;
	}
	public void setGift_option(String gift_option) {
		this.gift_option = gift_option;
	}
	public String getExtra_funding_price() {
		return extra_funding_price;
	}
	public void setExtra_funding_price(String extra_funding_price) {
		this.extra_funding_price = extra_funding_price;
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
	public String getDelivery_start_date() {
		return delivery_start_date;
	}
	public void setDelivery_start_date(String delivery_start_date) {
		this.delivery_start_date = delivery_start_date;
	}
	public String getDelivery_complete_yn() {
		return delivery_complete_yn;
	}
	public void setDelivery_complete_yn(String delivery_complete_yn) {
		this.delivery_complete_yn = delivery_complete_yn;
	}
	public int getGift_quantity() {
		return gift_quantity;
	}
	public void setGift_quantity(int gift_quantity) {
		this.gift_quantity = gift_quantity;
	}
	public int getFunding_gift_price() {
		return funding_gift_price;
	}
	public void setFunding_gift_price(int funding_gift_price) {
		this.funding_gift_price = funding_gift_price;
	}
	
	
}
