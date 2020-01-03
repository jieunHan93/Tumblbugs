package com.tumblbugs.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.NoticeDAO;
import com.tumblbugs.vo.NoticeVO;

import net.sf.json.JSONObject;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO noticeDAO;
	
	/** �������� ����Ʈ **/
	@RequestMapping(value="/notice/list", method=RequestMethod.GET)
	public ModelAndView list(String category, String searchVal, String rpage) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		ModelAndView mv = new ModelAndView();
		
		if(category=="" || category == null) {
			category = "all";
		}
		
		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = 0;
		
		if(searchVal != null && searchVal != "") {
			dbCount = noticeDAO.searchCount(searchVal);
		}else if(category.equals("all")) {
			dbCount = noticeDAO.allCount();
			
		}else if(category.equals("notice")) {
			category="��������";
			dbCount = noticeDAO.noticeCount();
			
		}else if(category.equals("event")) {
			category="�̺�Ʈ";
			dbCount = noticeDAO.eventCount();
		}
				
		//�� ������ �� ���
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//��û ������ ���
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 10;
		}
		if(searchVal != null && searchVal != "") {
			list = noticeDAO.getNoticeSearchList(startCount, endCount, searchVal);
		}else if(category.equals("all")) {
			list = noticeDAO.getNoticeAllList(startCount, endCount);
		}else {
			list = noticeDAO.getNoticeCategoryList(startCount, endCount, category);
		}
		
		if(category.equals("��������")) {
			category="notice";
		}else if(category.equals("�̺�Ʈ")) {
			category="event";
		}
		 
		mv.addObject("category",category);
		mv.setViewName("/notice/notice_list");
		mv.addObject("list", list);
		mv.addObject("dbcount", dbCount);
		mv.addObject("pagesize", pageSize);
		mv.addObject("rpage", reqPage);
		return mv;
	}
	
	@RequestMapping(value="/notice/content", method=RequestMethod.GET)
	public ModelAndView content(String notice_id, String category) {
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = new NoticeVO();
		if(category=="" || category == null) category = "all";
		
		vo = noticeDAO.getNoticeContent(notice_id);
		
		mv.addObject("vo",vo);
		mv.addObject("category",category);
		mv.setViewName("/notice/notice_content");
		return mv;
	}
}
