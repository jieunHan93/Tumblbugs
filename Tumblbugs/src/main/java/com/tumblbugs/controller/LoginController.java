package com.tumblbugs.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.LoginDAO;
import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.SessionVO;

@Controller
public class LoginController {
	@Autowired
	private LoginDAO logindao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	/**
	 * 로그인 화면
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/login");
		
		if(session.getAttribute("requestUrl") != null && session.getAttribute("requestUrl") != "") {
			mv.addObject("requestUrl", session.getAttribute("requestUrl"));
			session.invalidate();
		}
		
		return mv;
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
		//System.out.println(email+"controll");
		int result = logindao.getemailchk(email);	
		return String.valueOf(result);

	}
	
	/*@ResponseBody	
	@RequestMapping(value="/pass_chk", method=RequestMethod.GET)
	public String pass_chk(String pass,String email,HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");	
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		vo.setPass(pass);
		SessionVO svo = logindao.getResultLogin(vo);
		int result = logindao.getpass_chk(pass,email);
		if(result != 0) {
			session.setAttribute("svo", svo);
			session.setAttribute("email", email);
		}
		
		return String.valueOf(result);
		
	}*/
	
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
	
	/**
	 * 로그인 처리
	 * @param session
	 * @param email
	 * @param pass
	 * @return
	 */
	@RequestMapping(value="/login_proc", method=RequestMethod.GET)
	@ResponseBody
	public String login_proc(HttpSession session, String email, String pass) {
		SessionVO svo = logindao.getResultLogin(email, pass);
		String result = "";
		if(svo != null && svo.isResult()) {
			//로그인 성공
			session.setAttribute("svo", svo);
			session.setAttribute("semail", email);
			result = logindao.getMemberUseyn(email);
		}else {
			result = "false";
		}
		
		return result;
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
			resPage = "/login/login";
		}else {
			return "redirect:/index";
		}
		return resPage;
		
	}
	
	
}
