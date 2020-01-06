package com.tumblbugs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.RegDAO;

@Controller
public class AdminMemberController {
	
	@Autowired
	private RegDAO regDAO;
	
	/**
	 * ȸ�� ���� ���� ȭ�� & �� ȭ��
	 * @param email
	 * @return
	 */
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public ModelAndView admin_member(String email, String unreg) {
		ModelAndView mv = new ModelAndView();
		
		if(email == null) {
			mv.setViewName("admin/admin_member");
			mv.addObject("list", regDAO.getMemberList());
		} else {
			mv.setViewName("admin/admin_member_content");
			mv.addObject("vo", regDAO.getMemberInfo(email));
		}
		
		return mv;
	}
	
	/**
	 * ȸ�� Ż�� ó��
	 * @param email
	 * @return
	 */
	@RequestMapping(value="/admin/member_unreg_proc", method=RequestMethod.GET)
	@ResponseBody
	public String member_unregister_proc(String email) {
		return String.valueOf(regDAO.getResultUnreg(email));
	}
}
