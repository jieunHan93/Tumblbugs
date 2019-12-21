package com.tumblbugs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@RequestMapping(value="/notice/list", method=RequestMethod.GET)
	public ModelAndView list(String category) {
		ModelAndView mv = new ModelAndView();
		if(category=="" || category == null) category = "all";
		mv.addObject("category",category);
		mv.setViewName("/notice/notice_list");
		return mv;
	}
	
	@RequestMapping(value="/notice/content", method=RequestMethod.GET)
	public ModelAndView content(String category) {
		ModelAndView mv = new ModelAndView();
		if(category=="" || category == null) category = "all";
		mv.addObject("category",category);
		mv.setViewName("/notice/notice_content");
		return mv;
	}
}
