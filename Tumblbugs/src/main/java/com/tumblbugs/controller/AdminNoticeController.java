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
	
	/** �������� �ۼ� process **/
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
		//db������ ���� ���ϸ� set
		vo.setNotice_thumbnail(nfile);
		vo.setNotice_sthumbnail(nsfile);
		result = noticeDAO.noticeWrite(vo);

		if(result){
			if(vo.getNotice_cthumbnail().getOriginalFilename() != null && vo.getNotice_cthumbnail().getOriginalFilename() !=""){	//������ �ִ� ��츸 upload�� ���� ����
			//upload ������ ���� ����
			String upload_path=root_path + attach_path + nsfile;
			
			/** ������ ���� ��� ���� �߻��� �� �����Ƿ� ó�� **/
			File file = new File(upload_path);
			vo.getNotice_cthumbnail().transferTo(file);
			}
		}
		
		return "redirect:/admin/notice";
	}
	
	/** �������� ���� **/
	@RequestMapping(value="/admin/notice_update", method=RequestMethod.GET)
	public ModelAndView admin_notice_update(String notice_id) {
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = new NoticeVO();
		vo = noticeDAO.getNoticeContent(notice_id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_notice_update");
		return mv;
	}

	/** �������� ���� **/
	@RequestMapping(value="/admin/notice_content", method=RequestMethod.GET)
	public ModelAndView admin_notice_content(String notice_id) {
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = new NoticeVO();
		vo = noticeDAO.getNoticeContent(notice_id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_notice_content");
		
		return mv;
	}
	
	/** �������� ���� process**/
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
	
	/** �������� ���� **/
	@RequestMapping(value="/admin/notice_delete", method=RequestMethod.GET)
	public ModelAndView admin_notice_delete(String notice_id) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("notice_id", notice_id);
		mv.setViewName("/admin/admin_notice_delete");
		return mv;
	}
	
	/** �������� ���� process**/
	@RequestMapping(value="/admin/notice_update_proc", method=RequestMethod.POST)
	public String notice_update_proc(NoticeVO vo, HttpServletRequest request) throws Exception{
		boolean result = false;
		String res ="";
		String del_nsfile = noticeDAO.getNsfileName(vo.getNotice_id());
		
		if(vo.getNotice_cthumbnail().getOriginalFilename() != null && vo.getNotice_cthumbnail().getOriginalFilename() != ""){
			//���� ����
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\upload\\";
				
			//rfname �ߺ����� ó��
			UUID uuid = UUID.randomUUID();
			
			String nfile = vo.getNotice_cthumbnail().getOriginalFilename();
			String nsfile = uuid +"_"+vo.getNotice_cthumbnail().getOriginalFilename();
			String update_path = root_path + attach_path + nsfile;
		
			vo.setNotice_thumbnail(nfile);
			vo.setNotice_sthumbnail(nsfile);
			
			result = noticeDAO.noticeUpdate(vo);
			
			File file = new File(update_path);
			
			vo.getNotice_cthumbnail().transferTo(file);
			
			//���� ���� ����
			
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
	
	/** �������� �۾��� **/
	@RequestMapping(value="/admin/notice_write", method=RequestMethod.GET)
	public String admin_notice_write() {
		
		return "/admin/admin_notice_write";
	}
	
	/** �������� ���� ������ **/
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
