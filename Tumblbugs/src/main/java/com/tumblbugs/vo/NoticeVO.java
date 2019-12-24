package com.tumblbugs.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class NoticeVO {
	
	String notice_id, notice_title, notice_content, notice_category, notice_reg_date, notice_event_start, notice_event_end, event_extra_date, event_waiting_date,
			notice_thumbnail, notice_sthumbnail;
	int rno;
	CommonsMultipartFile notice_cthumbnail;
	
	String next_title, next_id, prev_title, prev_id, next_category, prev_category;
	
	
	public String getNotice_thumbnail() {
		return notice_thumbnail;
	}

	public void setNotice_thumbnail(String notice_thumbnail) {
		this.notice_thumbnail = notice_thumbnail;
	}

	public String getNotice_sthumbnail() {
		return notice_sthumbnail;
	}

	public void setNotice_sthumbnail(String notice_sthumbnail) {
		this.notice_sthumbnail = notice_sthumbnail;
	}

	public CommonsMultipartFile getNotice_cthumbnail() {
		return notice_cthumbnail;
	}

	public void setNotice_cthumbnail(CommonsMultipartFile notice_cthumbnail) {
		this.notice_cthumbnail = notice_cthumbnail;
	}

	public String getNext_title() {
		return next_title;
	}

	public String getNext_category() {
		return next_category;
	}

	public void setNext_category(String next_category) {
		this.next_category = next_category;
	}

	public String getPrev_category() {
		return prev_category;
	}

	public void setPrev_category(String prev_category) {
		this.prev_category = prev_category;
	}

	public void setNext_title(String next_title) {
		this.next_title = next_title;
	}

	public String getNext_id() {
		return next_id;
	}

	public void setNext_id(String next_id) {
		this.next_id = next_id;
	}

	public String getPrev_title() {
		return prev_title;
	}

	public void setPrev_title(String prev_title) {
		this.prev_title = prev_title;
	}

	public String getPrev_id() {
		return prev_id;
	}

	public void setPrev_id(String prev_id) {
		this.prev_id = prev_id;
	}

	public String getEvent_waiting_date() {
		return event_waiting_date;
	}

	public void setEvent_waiting_date(String event_waiting_date) {
		this.event_waiting_date = event_waiting_date;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getNotice_event_end() {
		return notice_event_end;
	}

	public void setNotice_event_end(String notice_event_end) {
		this.notice_event_end = notice_event_end;
	}

	public String getEvent_extra_date() {
		return event_extra_date;
	}

	public void setEvent_extra_date(String event_extra_date) {
		this.event_extra_date = event_extra_date;
	}

	public String getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_category() {
		return notice_category;
	}

	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}

	public String getNotice_reg_date() {
		return notice_reg_date;
	}

	public void setNotice_reg_date(String notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}

	public String getNotice_event_start() {
		return notice_event_start;
	}

	public void setNotice_event_start(String notice_event_start) {
		this.notice_event_start = notice_event_start;
	}

	
	
}
