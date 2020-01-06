package com.tumblbugs.vo;

public class ProjectBillVO {
	String bill_id, pj_id, bill_complete_yn, bill_complete_date;
	int total_pay_price, card_pay_price, card_sponsor_count, account_pay_price, account_sponsor_count, total_comm,
		tumblbugs_comm, pay_comm, card_comm, account_comm, transfer_comm, total_receipts;
	
	public String getBill_id() {
		return bill_id;
	}
	public void setBill_id(String bill_id) {
		this.bill_id = bill_id;
	}
	public String getPj_id() {
		return pj_id;
	}
	public void setPj_id(String pj_id) {
		this.pj_id = pj_id;
	}
	public String getBill_complete_yn() {
		return bill_complete_yn;
	}
	public void setBill_complete_yn(String bill_complete_yn) {
		this.bill_complete_yn = bill_complete_yn;
	}
	public String getBill_complete_date() {
		return bill_complete_date;
	}
	public void setBill_complete_date(String bill_complete_date) {
		this.bill_complete_date = bill_complete_date;
	}
	public int getTotal_pay_price() {
		return total_pay_price;
	}
	public void setTotal_pay_price(int total_pay_price) {
		this.total_pay_price = total_pay_price;
	}
	public int getCard_pay_price() {
		return card_pay_price;
	}
	public void setCard_pay_price(int card_pay_price) {
		this.card_pay_price = card_pay_price;
	}
	public int getCard_sponsor_count() {
		return card_sponsor_count;
	}
	public void setCard_sponsor_count(int card_sponsor_count) {
		this.card_sponsor_count = card_sponsor_count;
	}
	public int getAccount_pay_price() {
		return account_pay_price;
	}
	public void setAccount_pay_price(int account_pay_price) {
		this.account_pay_price = account_pay_price;
	}
	public int getAccount_sponsor_count() {
		return account_sponsor_count;
	}
	public void setAccount_sponsor_count(int account_sponsor_count) {
		this.account_sponsor_count = account_sponsor_count;
	}
	public int getTotal_comm() {
		return total_comm;
	}
	public void setTotal_comm(int total_comm) {
		this.total_comm = total_comm;
	}
	public int getTumblbugs_comm() {
		return tumblbugs_comm;
	}
	public void setTumblbugs_comm(int tumblbugs_comm) {
		this.tumblbugs_comm = tumblbugs_comm;
	}
	public int getPay_comm() {
		return pay_comm;
	}
	public void setPay_comm(int pay_comm) {
		this.pay_comm = pay_comm;
	}
	public int getCard_comm() {
		return card_comm;
	}
	public void setCard_comm(int card_comm) {
		this.card_comm = card_comm;
	}
	public int getAccount_comm() {
		return account_comm;
	}
	public void setAccount_comm(int account_comm) {
		this.account_comm = account_comm;
	}
	public int getTransfer_comm() {
		return transfer_comm;
	}
	public void setTransfer_comm(int transfer_comm) {
		this.transfer_comm = transfer_comm;
	}
	public int getTotal_receipts() {
		return total_receipts;
	}
	public void setTotal_receipts(int total_receipts) {
		this.total_receipts = total_receipts;
	}
	
	
}
