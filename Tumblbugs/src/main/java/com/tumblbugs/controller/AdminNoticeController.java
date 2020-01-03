package com.tumblbugs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.NoticeDAO;
import com.tumblbugs.vo.NoticeVO;

@Controller
public class AdminNoticeController {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	/** 공지사항 작성 process **/
	@RequestMapping(value="/admin/notice_write_proc", method=RequestMethod.POST)
	public String admin_notice_write_proc(NoticeVO vo, HttpServletRequest request) throws Exception{
		boolean result = false;

		String root_path="", attach_path="", nfile="", nsfile="";
		
		if(vo.getNotice_cthumbnail().getOriginalFilename() != null && vo.getNotice_cthumbnail().getOriginalFilename() !=""){
			root_path = request.getSession().getServletContext().getRealPath("/");
			
			attach_path = "\\resources\\upload\\";
			
			UUID uuid = UUID.randomUUID();
			nfile = vo.getNotice_cthumbnail().getOriginalFilename();
			nsfile = uuid +"_"+vo.getNotice_cthumbnail().getOriginalFilename();
	
		}	
		//db연동을 위한 파일명 set
		vo.setNotice_thumbnail(nfile);
		vo.setNotice_sthumbnail(nsfile);
		result = noticeDAO.noticeWrite(vo);

		if(result){
			if(vo.getNotice_cthumbnail().getOriginalFilename() != null && vo.getNotice_cthumbnail().getOriginalFilename() !=""){	//파일이 있는 경우만 upload에 파일 저장
			//upload 폴더에 파일 저장
			String upload_path=root_path + attach_path + nsfile;
			
			/** 파일이 없는 경우 에러 발생할 수 있으므로 처리 **/
			File file = new File(upload_path);
			vo.getNotice_cthumbnail().transferTo(file);
			}
		}
		
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
	public String notice_delete_proc(String notice_id, HttpServletRequest request) {
		boolean result = false;
		String res ="";
		String nsfile = "";
		nsfile = noticeDAO.getNsfileName(notice_id);
		result = noticeDAO.noticeDelete(notice_id);
		
		if(result) {
			res = "redirect:/admin/notice";
			
			if(nsfile != null && nsfile != "") {
				String path = request.getSession().getServletContext().getRealPath("/");
				String attatch_path = "\\resources\\upload\\";
				String del_path = path + attatch_path + nsfile;
				File file = new File(del_path);
				file.delete();
			}
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
	public String notice_update_proc(NoticeVO vo, HttpServletRequest request) throws Exception{
		boolean result = false;
		String res ="";
		String del_nsfile = noticeDAO.getNsfileName(vo.getNotice_id());
		
		if(vo.getNotice_cthumbnail().getOriginalFilename() != null && vo.getNotice_cthumbnail().getOriginalFilename() != ""){
			//파일 존재
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\upload\\";
				
			//rfname 중복방지 처리
			UUID uuid = UUID.randomUUID();
			
			String nfile = vo.getNotice_cthumbnail().getOriginalFilename();
			String nsfile = uuid +"_"+vo.getNotice_cthumbnail().getOriginalFilename();
			String update_path = root_path + attach_path + nsfile;
		
			vo.setNotice_thumbnail(nfile);
			vo.setNotice_sthumbnail(nsfile);
			
			result = noticeDAO.noticeUpdate(vo);
			
			File file = new File(update_path);
			
			vo.getNotice_cthumbnail().transferTo(file);
			
			//기존 파일 삭제
			
			if(del_nsfile != null && del_nsfile != "") {
				String del_path = root_path + attach_path + del_nsfile;
				File delfile = new File(del_path);
				
				if(delfile.exists()) delfile.delete();
			}
			
		}else {
			result = noticeDAO.noticeNofileUpdate(vo);
		}
		
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
