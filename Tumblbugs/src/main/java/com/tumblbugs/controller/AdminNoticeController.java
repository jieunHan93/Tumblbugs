package com.tumblbugs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.AdminNoticeDAO;
import com.tumblbugs.vo.NoticeVO;

@Controller
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeDAO noticeDAO;
	
	/** 공지사항 작성 process **/
	@RequestMapping(value="/admin/notice_write_proc", method=RequestMethod.POST)
	public String admin_notice_write_proc(NoticeVO vo) {
		boolean result = false;

		result = noticeDAO.noticeWrite(vo);
		
		return "redirect:/admin/notice";
	}
	/** 공지사항 수정 **/
	@RequestMapping(value="/admin/notice_update", method=RequestMethod.GET)
	public ModelAndView admin_notice_update(String notice_id) {
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = new NoticeVO();
		vo = noticeDAO.getNoticeContent(notice_id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_notice_update");
		return mv;
	}

	/** 공지사항 내용 **/
	@RequestMapping(value="/admin/notice_content", method=RequestMethod.GET)
	public ModelAndView admin_notice_content(String notice_id) {
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = new NoticeVO();
		vo = noticeDAO.getNoticeContent(notice_id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_notice_content");
		
		return mv;
	}
	
	/** 공지사항 삭제 process**/
	@RequestMapping(value="/admin/notice_delete_proc", method=RequestMethod.GET)
	public String notice_delete_proc(String notice_id) {
		boolean result = false;
		String res ="";
		result = noticeDAO.noticeDelete(notice_id);
		
		if(result) {
			res = "redirect:/admin/notice";
		}else {
			res = "error_page";
		}
		
		return res;
	}
	
	/** 공지사항 삭제 **/
	@RequestMapping(value="/admin/notice_delete", method=RequestMethod.GET)
	public ModelAndView admin_notice_delete(String notice_id) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("notice_id", notice_id);
		mv.setViewName("/admin/admin_notice_delete");
		return mv;
	}
	
	/** 공지사항 수정 process**/
	@RequestMapping(value="/admin/notice_update_proc", method=RequestMethod.POST)
	public String notice_update_proc(NoticeVO vo) {
		boolean result = false;
		String res ="";
		result = noticeDAO.noticeUpdate(vo);
		
		if(result) {
			res = "redirect:/admin/notice";
		}else {
			res = "error_page";
		}
		
		return res;
	}
	
	/** 공지사항 글쓰기 **/
	@RequestMapping(value="/admin/notice_write", method=RequestMethod.GET)
	public String admin_notice_write() {
		
		return "/admin/admin_notice_write";
	}
	
	/** 공지사항 메인 페이지 **/
	@RequestMapping(value="/admin/notice", method=RequestMethod.GET)
	public ModelAndView admin_notice() {
		ModelAndView mv = new ModelAndView();
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		
		list = noticeDAO.getNoticeList();
		int allCount = noticeDAO.allCount();
		int noticeCount = noticeDAO.noticeCount();
		int eventCount = noticeDAO.eventCount();
	
		mv.addObject("list", list);
		mv.addObject("allCount", allCount);
		mv.addObject("noticeCount", noticeCount);
		mv.addObject("eventCount", eventCount);
		mv.setViewName("/admin/admin_notice");
		
		return mv;
	}
	

	
}
