package com.tumblbugs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	//업데이트22
	/** 관리자 페이지 **/
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin() {
		
		return "/admin/admin";
	}
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String admin_login() {
		
		return "/admin/admin_login";
	}
	@RequestMapping(value="/admin/answer", method=RequestMethod.GET)
	public String admin_answer() {
		
		return "/admin/admin_answer";
	}
	@RequestMapping(value="/admin/sidebar", method=RequestMethod.GET)
	public String admin_sidebar() {
		
		return "/admin/admin_sidebar";
	}
}
