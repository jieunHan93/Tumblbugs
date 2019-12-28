package com.tumblbugs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminBannerController {

	@RequestMapping(value="/admin/banner", method=RequestMethod.GET)
	public ModelAndView admin_banner() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_banner");
		return mv;
	}
}
