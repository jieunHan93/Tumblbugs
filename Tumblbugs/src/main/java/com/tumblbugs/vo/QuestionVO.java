package com.tumblbugs.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class QuestionVO {
	
	//Field
	int question_num,rno;
	String question_category, question_email, question_title, question_ques_content, question_spon_number, question_qfile, question_qsfile,
	question_ques_reg_date, question_ans_content, question_ans_reg_date, question_ans_check;
	CommonsMultipartFile question_qcfile;
	
	//Method
	public CommonsMultipartFile getQuestion_qcfile() {
		return question_qcfile;
	}
	public void setQuestion_qcfile(CommonsMultipartFile question_qcfile) {
		this.question_qcfile = question_qcfile;
	}
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getQuestion_category() {
		return question_category;
	}
	public void setQuestion_category(String question_category) {
		this.question_category = question_category;
	}
	public String getQuestion_email() {
		return question_email;
	}
	public void setQuestion_email(String question_email) {
		this.question_email = question_email;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_ques_content() {
		return question_ques_content;
	}
	public void setQuestion_ques_content(String question_ques_content) {
		this.question_ques_content = question_ques_content;
	}
	public String getQuestion_spon_number() {
		return question_spon_number;
	}
	public void setQuestion_spon_number(String question_spon_number) {
		this.question_spon_number = question_spon_number;
	}
	public String getQuestion_qfile() {
		return question_qfile;
	}
	public void setQuestion_qfile(String question_qfile) {
		this.question_qfile = question_qfile;
	}
	public String getQuestion_qsfile() {
		return question_qsfile;
	}
	public void setQuestion_qsfile(String question_qsfile) {
		this.question_qsfile = question_qsfile;
	}
	public String getQuestion_ques_reg_date() {
		return question_ques_reg_date;
	}
	public void setQuestion_ques_reg_date(String question_ques_reg_date) {
		this.question_ques_reg_date = question_ques_reg_date;
	}
	public String getQuestion_ans_content() {
		return question_ans_content;
	}
	public void setQuestion_ans_content(String question_ans_content) {
		this.question_ans_content = question_ans_content;
	}
	public String getQuestion_ans_reg_date() {
		return question_ans_reg_date;
	}
	public void setQuestion_ans_reg_date(String question_ans_reg_date) {
		this.question_ans_reg_date = question_ans_reg_date;
	}
	public String getQuestion_ans_check() {
		return question_ans_check;
	}
	public void setQuestion_ans_check(String question_ans_check) {
		this.question_ans_check = question_ans_check;
	}

}
