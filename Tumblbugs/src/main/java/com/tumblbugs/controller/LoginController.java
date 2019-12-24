package com.tumblbugs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tumblbugs.dao.LoginDAO;
import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.SessionVO;

@Controller
public class LoginController {
	@Autowired
	private LoginDAO logindao;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/email_chk", method=RequestMethod.GET)
	public String email_chk(String email) {
		System.out.println(email+"controll");
		int result = logindao.getemailchk(email);	
		return String.valueOf(result);

	}
	@ResponseBody	
	@RequestMapping(value="/pass_chk", method=RequestMethod.GET)
	public String pass_chk(String pass,HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");	
		int result = logindao.getpass_chk(pass,svo.getEmail());
		return String.valueOf(result);
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		String respage = "";
		SessionVO svo = new SessionVO();
		if(svo != null) {
			session.invalidate();
			respage = "redirect:/index";
		}
		return respage;
	}
	
	@RequestMapping(value="/reg_chk_page", method=RequestMethod.GET)
	public String reg_chk_page() {
		return "/login/reg_chk_page";
	}
	
	@RequestMapping(value="/login_proc", method=RequestMethod.POST)
	public String login_proc(MemberVO vo, HttpSession session , HttpServletResponse response) {
		String resPage = "";
		SessionVO svo = logindao.getResultLogin(vo);	

		if(svo != null) {
			
			if(svo.isResult()) {	
				
				session.setAttribute("svo", svo);
				session.setAttribute("semail", vo.getEmail());
				resPage = "redirect:/index";
			}
			
		}else{
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('잘못된 계정입니다.'); location.href='/tumblbugs/index';</script>");			 
				out.flush();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			 
		

			resPage = "redirect:/login";
		}
		
		return resPage;		
	}
	
	
	
	@RequestMapping(value="/idfound", method=RequestMethod.GET)
	public String idfound() {
		return "/login/idfound";
	}
	
	
}
