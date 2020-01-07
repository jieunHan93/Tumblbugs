package com.tumblbugs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.FaqDAO;
import com.tumblbugs.dao.QuestionDAO;
import com.tumblbugs.vo.FaqVO;
import com.tumblbugs.vo.QuestionVO;

@Controller
public class AdminController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private FaqDAO faqDao;
	
	@Autowired
	private QuestionDAO quesDao;
	
	/** 관리자 페이지 **/
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView admin() {
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<QuestionVO> list = quesDao.getResultList();
		mv.addObject("list", list);
		mv.setViewName("/admin/admin");
		return mv;
	}
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String admin_login() {
		
		return "/admin/admin_login";
	}
	@RequestMapping(value="/admin/answer", method=RequestMethod.GET)
	public ModelAndView admin_answer(String question_num) {
		
		ModelAndView mv = new ModelAndView();
		QuestionVO vo = quesDao.getResultContent(question_num);
		
		mv.addObject("vo",vo);
		mv.setViewName("/admin/admin_answer");
		return mv;
	}
	@RequestMapping(value="/admin/answer_proc", method=RequestMethod.POST)
	public ModelAndView admin_answer_proc(QuestionVO vo) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		result = quesDao.getResultUpdate(vo);
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		messageHelper.setFrom("tumblbugs.service@gmail.com");
		messageHelper.setTo(vo.getQuestion_email());
		messageHelper.setSubject(vo.getQuestion_title());
		messageHelper.setText(vo.getQuestion_ans_content());

		mailSender.send(message);
		
		if(result) {
			mv.setViewName("redirect:/admin");
		}else {
			mv.setViewName("redirect:/error_Page");
		}
		return mv;
	}
	@RequestMapping(value="/admin/sidebar", method=RequestMethod.GET)
	public String admin_sidebar() {
		
		return "/admin/admin_sidebar";
	}
	@RequestMapping(value="/admin/faq", method=RequestMethod.GET)
	public ModelAndView admin_faq() {
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<FaqVO> list = faqDao.getResultList();
		mv.addObject("list", list);
		mv.setViewName("/admin/admin_FAQ_list");
		return mv;
	}
	@RequestMapping(value="/admin/faq_content", method=RequestMethod.GET)
	public ModelAndView admin_faq_content(String faq_num) {
		
		ModelAndView mv = new ModelAndView();
		
		FaqVO vo = faqDao.getResultContent_admin(faq_num);
		
		mv.addObject("vo",vo);
		mv.setViewName("/admin/admin_FAQ_content");
		return mv;
	}
	@RequestMapping(value="/admin/faq_delete", method=RequestMethod.GET)
	public ModelAndView admin_faq_delete(String faq_num) {
		
		ModelAndView mv = new ModelAndView();
		
		FaqVO vo = faqDao.getResultContent_admin(faq_num);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_FAQ_delete");
		return mv;
	}
	@RequestMapping(value="/admin/faq_delete_proc", method=RequestMethod.POST)
	public ModelAndView admin_faq_delete_proc(String faq_num) {
		
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		
		result = faqDao.getResultDelete(faq_num);

		if(result) {
			mv.setViewName("redirect:/admin/faq");
		}else {
			mv.setViewName("error_page");
		}
		return mv;
	}
	@RequestMapping(value="/admin/faq_update", method=RequestMethod.GET)
	public ModelAndView admin_faq_update(String faq_num) {
		
		ModelAndView mv = new ModelAndView();
		
		FaqVO vo = faqDao.getResultContent_admin(faq_num);
		
		mv.addObject("vo",vo);
		mv.setViewName("/admin/admin_FAQ_update");
		return mv;
	}
	@RequestMapping(value="/admin/faq_update_proc", method=RequestMethod.POST)
	public ModelAndView admin_faq_update_proc(FaqVO vo) {
		
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		
		result = faqDao.getResultUpdate(vo);

		if(result) {
			mv.setViewName("redirect:/admin/faq");
		}else {
			mv.setViewName("error_page");
		}
		return mv;
	}
	@RequestMapping(value="/admin/faq_write", method=RequestMethod.GET)
	public String admin_faq_insert() {
		return "/admin/admin_FAQ_write";
	}
	
	@RequestMapping(value="/admin/faq_write_proc", method=RequestMethod.POST)
	public String admin_faq_proc(FaqVO vo) {
		
		boolean result = faqDao.getResultWrite(vo);
		String resPage = "";
		
		if(result) {
			resPage = "redirect:/admin/faq";
		}else {
			resPage = "errorPage";
		}
		return resPage;
	} 
}
