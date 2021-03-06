package com.tumblbugs.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.tumblbugs.dao.MessageDAO;
import com.tumblbugs.dao.ProjectDAO;
import com.tumblbugs.util.BeforeTimeUtil;
import com.tumblbugs.vo.MessageVO;

@Controller
public class ProjectMessageController {
	
	@Autowired
	private MessageDAO messageDAO;
	@Autowired
	private ProjectDAO projectDAO;
	
	/** 프로젝트 상세페이지에서 문의하기 **/
	@RequestMapping(value="/sendMessage", method=RequestMethod.GET)
	public ModelAndView send_message(String pj_id) {
		ModelAndView mv = new ModelAndView();
		String name = messageDAO.getResultCreatorName(pj_id);
		mv.addObject("pj_id", pj_id);
		mv.addObject("name", name);
		mv.setViewName("/project/send_message");
		return mv;
	}
	/** 문의 등록 **/
	@RequestMapping(value="/messageWrite_proc", method=RequestMethod.POST)
	public ModelAndView messagewrite_proc(MessageVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String email = (String)session.getAttribute("semail");
		vo.setEmail(email);
		boolean result = messageDAO.getResultWrite(vo);
		String pj_addr=projectDAO.getPj_addr(vo.getPj_id());
		if(result) {
			mv.addObject("pj_id", vo.getPj_id());
			mv.setViewName("redirect:/project/" + pj_addr);
		} else {
			mv.setViewName("/error");
		}
		return mv;
	}
	/** 마이페이지 메시지 호출 **/
	@RequestMapping(value="/mypage/message", method=RequestMethod.GET)
	public ModelAndView message() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/message");
		return mv;
	}
	/** 채팅방 가져오기 **/
	@RequestMapping(value="/mypage/message_proc", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String message_proc(String user, String sort, HttpSession session) throws Exception {
		String email = (String)session.getAttribute("semail");
		ArrayList<MessageVO> list = messageDAO.getResultChatroom(user, email, sort);
		
		BeforeTimeUtil util = new BeforeTimeUtil();
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(MessageVO vo : list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("chatroom_id", vo.getChatroom_id());
			obj.addProperty("pj_simg", vo.getPj_simg());
			obj.addProperty("pj_title", vo.getPj_title());
			obj.addProperty("name", vo.getName());
			obj.addProperty("msg_content", vo.getMsg_content());
			obj.addProperty("msg_date", util.beforeTime(vo.getMsg_date()));
			obj.addProperty("new_message", vo.getNew_message());
			jlist.add(obj);
		}
		
		jdata.add("result", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	
	/** 마이페이지 메시지 상세 호출 **/
	@RequestMapping(value="/mypage/message/content", method=RequestMethod.GET)
	public ModelAndView message_content(String chatroom_id) {
		ModelAndView mv = new ModelAndView();
		MessageVO vo = messageDAO.getResultProjectInfo(chatroom_id);
		mv.addObject("chatroom_id", chatroom_id);
		mv.addObject("vo", vo);
		mv.setViewName("/mypage/message_content");
		return mv;
	}
	/** 메시지 new 표시 소비자 **/
	@RequestMapping(value="/mypage/message/new_message_buyer", method=RequestMethod.GET)
	@ResponseBody
	public String new_message_b(HttpSession session) {
		String email = (String)session.getAttribute("semail");
		int val = messageDAO.getResultNewMessageCountB(email);
		return String.valueOf(val);
	}
	/** 메시지 new 표시 소비자 **/
	@RequestMapping(value="/mypage/message/new_message_creator", method=RequestMethod.GET)
	@ResponseBody
	public String new_message_y(HttpSession session) {
		String email = (String)session.getAttribute("semail");
		int val = messageDAO.getResultNewMessageCountC(email);
		return String.valueOf(val);
	}
	
	/** 메세지 상세목록 호출   **/
	@RequestMapping(value="/mypage/message/content_proc", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String content_proc(String chatroom_id, HttpSession session) throws Exception {
		String email = (String)session.getAttribute("semail");
		messageDAO.getResultCheck(chatroom_id, email);
		
		ArrayList<MessageVO> list = messageDAO.getResultMessage(chatroom_id);
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy년 MM월 dd일 HH시mm분ss초");
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(MessageVO vo : list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("name", vo.getName());
			obj.addProperty("profile", vo.getProfile_simg());
			obj.addProperty("msg_content", vo.getMsg_content());
			Date tempDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(vo.getMsg_date());		
			String time = format.format(tempDate);
			obj.addProperty("msg_date", time);
			obj.addProperty("msg_check", vo.getMsg_check());
			jlist.add(obj);
		}
		
		jdata.add("result", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	
	/** 마이페이지에서 메시지 등록하기 **/
	@RequestMapping(value="/mypage/message/content_insert_proc", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String content_insert_proc(String chatroom_id, String msg_content, HttpSession session) {
		MessageVO vo = new MessageVO();
		// 삭제 할것
		String email = (String)session.getAttribute("semail");
		vo.setChatroom_id(chatroom_id);
		vo.setEmail(email);
		vo.setMsg_content(msg_content);
		int val = messageDAO.getResultInsert(vo);
		return String.valueOf(val);
	}
}
