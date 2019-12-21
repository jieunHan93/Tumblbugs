package com.tumblbugs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

		result = noticeDAO.notice_write(vo);
		
		return "/admin/admin_notice";
	}
	/** 공지사항 수정 **/
	@RequestMapping(value="/admin/notice_update", method=RequestMethod.GET)
	public String admin_notice_update() {
		
		return "/admin/admin_notice_update";
	}

	/** 공지사항 내용 **/
	@RequestMapping(value="/admin/notice_content", method=RequestMethod.GET)
	public String admin_notice_content() {
		
		return "/admin/admin_notice_content";
	}
	
	/** 공지사항 글쓰기 **/
	@RequestMapping(value="/admin/notice_write", method=RequestMethod.GET)
	public String admin_notice_write() {
		
		return "/admin/admin_notice_write";
	}
	
	/** 공지사항 메인 페이지 **/
	@RequestMapping(value="/admin/notice", method=RequestMethod.GET)
	public String admin_notice() {
		
		return "/admin/admin_notice";
	}
	
}
