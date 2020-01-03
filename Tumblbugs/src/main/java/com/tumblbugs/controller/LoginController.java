package com.tumblbugs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	@RequestMapping(value="/found", method=RequestMethod.GET)
	public String found() {
		return "/login/found";
	}
	@ResponseBody
	@RequestMapping(value="/found_ajax", method=RequestMethod.GET)
	public int found_ajax(String email) {
		String result = logindao.getfound_ajax(email);	
		return Integer.parseInt(result);
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
	
	
	
	@RequestMapping(value="/found_proc", method=RequestMethod.GET)
	public String found(String email,HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	
		String resPage = "";
		String pass = logindao.getfound(email);
		if(pass != "" || pass != null) {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom("tumblbugs.service@gmail.com");
			messageHelper.setTo(email);
			messageHelper.setSubject("비밀번호찾기이메일");			
			messageHelper.setText("비밀번호는 : " + pass + "입니다.");
			
			
			mailSender.send(message);
			out.println("<script>alert('해당 이메일로 비밀번호가 전송되었습니다.');</script>");
			out.flush();
			resPage = "/login/found";
			
		}else {
			return "redirect:/index";
		}
		return resPage;
		
	}
	
	
}
