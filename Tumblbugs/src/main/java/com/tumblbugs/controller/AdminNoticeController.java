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
	
	/** �������� �ۼ� process **/
	@RequestMapping(value="/admin/notice_write_proc", method=RequestMethod.POST)
	public String admin_notice_write_proc(NoticeVO vo) {
		boolean result = false;

		result = noticeDAO.notice_write(vo);
		
		return "/admin/admin_notice";
	}
	/** �������� ���� **/
	@RequestMapping(value="/admin/notice_update", method=RequestMethod.GET)
	public String admin_notice_update() {
		
		return "/admin/admin_notice_update";
	}

	/** �������� ���� **/
	@RequestMapping(value="/admin/notice_content", method=RequestMethod.GET)
	public String admin_notice_content() {
		
		return "/admin/admin_notice_content";
	}
	
	/** �������� �۾��� **/
	@RequestMapping(value="/admin/notice_write", method=RequestMethod.GET)
	public String admin_notice_write() {
		
		return "/admin/admin_notice_write";
	}
	
	/** �������� ���� ������ **/
	@RequestMapping(value="/admin/notice", method=RequestMethod.GET)
	public String admin_notice() {
		
		return "/admin/admin_notice";
	}
	
}
