package com.tumblbugs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tumblbugs.dao.PJUploadDAO;
import com.tumblbugs.vo.FileVO;
import com.tumblbugs.vo.GiftVO;
import com.tumblbugs.vo.ItemVO;
import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.ProjectVO;

@Controller
public class ProjectUploadController {

	@Autowired
	private PJUploadDAO PJUploadDao;
	
	

	/**
	 * Member 프로필 이미지 file upload
	 * @return
	 */
	@RequestMapping(value="/project_edit_memberFile_proc", method=RequestMethod.POST)
	@ResponseBody
	public String project_edit_memberFile_proc(MemberVO vo, HttpSession session, HttpServletRequest request) throws Exception{
		String semail = (String)session.getAttribute("semail");
		String file_name = "";
		file_name = PJUploadDao.getMemberfileName(semail);
		
		//파일 전송 및 복사
				if(vo.getProfile_cimg().getOriginalFilename() != null && vo.getProfile_cimg().getOriginalFilename() != ""){
					
					String root_path = request.getSession().getServletContext().getRealPath("/");
					String attach_path = "\\resources\\upload\\";
					
					UUID uuid = UUID.randomUUID();
					
					/*vo.setPj_id(session_id);*/
					vo.setProfile_img(vo.getProfile_cimg().getOriginalFilename());
					vo.setProfile_simg(uuid+"_"+vo.getProfile_cimg().getOriginalFilename());
					vo.setEmail(semail);
					int val = PJUploadDao.resultInsertMemberFile(vo);
					
					if(val != 0) {

						File file = new File(root_path + attach_path + uuid +"_"+vo.getProfile_cimg().getOriginalFilename());
						vo.getProfile_cimg().transferTo(file);
						
						if(file_name != null && file_name != "") {
							String del_path = root_path + attach_path + file_name;
							File delfile = new File(del_path);
							
							if(delfile.exists()) delfile.delete();
						}
					}
				}
		
		return "success";
	}
	
	
	/**
	 * 프로젝트 이미지 file upload
	 * @return
	 */
	@RequestMapping(value="/project_edit_file_proc", method=RequestMethod.POST)
	@ResponseBody
	public String project_edit_file_proc(FileVO vo, HttpSession session, HttpServletRequest request) throws Exception{

		String session_id = (String)session.getAttribute("pj_id");
		String semail = (String)session.getAttribute("semail");
		
		//프로젝트 없다면 프로젝트 생성
		if(session_id == null){
			session_id = "null";
		}
		
		if(session_id.equals("null")){
			String pj_id = PJUploadDao.resultAddProject(semail);	
			session.setAttribute("pj_id", pj_id);
			session_id = pj_id;
		}
		
		//파일 전송 및 저장
		if(vo.getPj_cimg().getOriginalFilename() != null && vo.getPj_cimg().getOriginalFilename() != ""){
			
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\upload\\";
				
			UUID uuid = UUID.randomUUID();
			
			vo.setPj_id(session_id);
			vo.setPj_img(vo.getPj_cimg().getOriginalFilename());
			vo.setPj_simg(uuid+"_"+vo.getPj_cimg().getOriginalFilename());
			
			int val = PJUploadDao.resultInsertFile(vo);
			
			if(val != 0) {

				File file = new File(root_path + attach_path + uuid +"_"+vo.getPj_cimg().getOriginalFilename());
				vo.getPj_cimg().transferTo(file);
			}
		}else{
			System.out.println("선택 파일 없음~");
		}
		
		return "success";
	}
	
	
	/**
	 * gift update -> item_check update
	 * @return
	 */
	@RequestMapping(value="/project_update_item_check_proc", method=RequestMethod.POST)
	@ResponseBody
	public String project_update_item_check_proc(@RequestBody Map<String, String> params) {
		String res="";
		int val = PJUploadDao.resultUpdateItemCheck(params);
		
		if(val != 0) {
			res = "success";
		}else {
			res ="fail";
		}
		
		return res;
	}
	
	/**
	 * gift update
	 * @return
	 */
	@RequestMapping(value="/project_update_gift_proc", method=RequestMethod.POST)
	@ResponseBody
	public String project_update_gift_proc(@RequestBody Map<String, String> params) {
		String res="";
		int val = PJUploadDao.resultUpdateGift(params);
		
		if(val != 0) {
			res = "success";
		}else {
			res ="fail";
		}
		
		return res;
	}
	
	
	/**
	 * item delete
	 * @return
	 */
	@RequestMapping(value="/project_delete_item_proc", method=RequestMethod.GET)
	@ResponseBody
	public String project_delete_item_proc(String item_id) {
		String res="";
		int val = PJUploadDao.resultDeleteItem(item_id);
		
		if(val != 0) {
			res = "success";
		}else {
			res ="fail";
		}
		
		return res;
	}
	
	
	/**
	 * gift delete
	 * @return
	 */
	@RequestMapping(value="/project_delete_gift_proc", method=RequestMethod.GET)
	@ResponseBody
	public String project_delete_gift_proc(String gift_id) {
		String res="";
		int val = PJUploadDao.resultDeleteGift(gift_id);
		
		if(val != 0) {
			res = "success";
		}else {
			res ="fail";
		}
		
		return res;
	}
	
	/**
	 * 프로젝트 address check process
	 * @return
	 */
	@RequestMapping(value="/project_check_addr_proc", method=RequestMethod.GET)
	@ResponseBody
	public boolean project_check_addr_proc(String pj_addr) {
		boolean result = false;
		result = PJUploadDao.getResultAddrCheck(pj_addr);
			
		return result;
	}
	
	
	/**
	 * 프로젝트 update process
	 * @return
	 */
	@RequestMapping(value="/project_update_proc", method=RequestMethod.GET)
	public ModelAndView project_update_proc() {
		ModelAndView mv = new ModelAndView();
			
		mv.setViewName("/project/project_start_upload");
		
		return mv;
	}
	
	/**
	 * 프로젝트 업로드 페이지
	 * @param pj_id
	 * @return
	 */
	@RequestMapping(value="/project_start_upload", method=RequestMethod.GET)
	public ModelAndView project_start_upload(HttpSession session, String pj_id, @RequestParam("pj_id") String reqId) {
		ModelAndView mv = new ModelAndView();
		if(reqId != null && reqId != "") {
			pj_id = reqId;
		}
		
		String semail = (String)session.getAttribute("semail");
		MemberVO mvo = new MemberVO();
		mvo = PJUploadDao.getMemberContent(semail);
		session.setAttribute("pj_id", pj_id);
		
		if(pj_id != null && pj_id != ""){
			ProjectVO vo = new ProjectVO();
			
			ArrayList<GiftVO> glist = new ArrayList<GiftVO>();
			vo = PJUploadDao.getProjectContent(pj_id);
			glist = PJUploadDao.getGiftContent(pj_id);
			
			for(GiftVO gvo : glist) {
				ArrayList<ItemVO> ilist = new ArrayList<ItemVO>();
				ilist = PJUploadDao.getItemContent(gvo.getGift_id());
				gvo.setItemList(ilist);
			}
			
			mv.addObject("vo", vo);
			mv.addObject("glist", glist);
		}
			mv.addObject("mvo", mvo);
			mv.setViewName("/project/project_start_upload");
			
		return mv;
	}
	
	/**
	 * 프로젝트 업로드 페이지 -> member 테이블 정보 수정
	 * @param pj_colname, pj_val
	 * @return
	 */
	@RequestMapping(value="/project_member_proc", method=RequestMethod.GET)
	@ResponseBody
	public void project_member_proc(String pj_colname, String pj_val, HttpSession session) {
		boolean result = false;
		String semail = (String)session.getAttribute("semail");
		result = PJUploadDao.resultUpdateMember(pj_colname, pj_val, semail);

		/*if(result) {
			
		}else {
			res="redirect:/error_page";
		}*/
		
	}
	
	/**
	 * 프로젝트 item insert
	 * @param json
	 * @return
	 */
	@RequestMapping(value="/project_edit_item_proc", method=RequestMethod.POST)
	@ResponseBody
	public String project_edit_item_proc(@RequestBody Map<String, String> params, HttpSession session) {
		String res = "";	
		res = PJUploadDao.resultInsertItem(params);
		
		return res;
	}
	
	
	/**
	 * 프로젝트 선물 gift insert
	 * @param json
	 * @return
	 */
	@RequestMapping(value="/project_edit_gift_proc", method=RequestMethod.POST)
	@ResponseBody
	public String project_edit_gift_proc(@RequestBody Map<String, String> params, HttpSession session) {
		String res = "";	

		String session_id = (String)session.getAttribute("pj_id");

		res = PJUploadDao.resultInsertGift(session_id, params);
		
		return res;
	}
	
	
	/**
	 * 프로젝트 업로드 페이지 -> 계좌 정보 업데이트
	 * @param json
	 * @return
	 */
	@RequestMapping(value="/project_edit_account_proc", method=RequestMethod.POST)
	public String project_edit_account_proc(@RequestBody Map<String, String> params, HttpSession session) {
		boolean result = false;
		String res = "";	
		String pj_id="";

		
		String session_id = (String)session.getAttribute("pj_id");
		String semail = (String)session.getAttribute("semail");
		
		if(session_id == null){
			session_id = "null";
		}
		
		if(session_id.equals("null")){
			pj_id = PJUploadDao.resultAddProject(semail);	
			session.setAttribute("pj_id", pj_id);
			session_id = pj_id;
		}
		result = PJUploadDao.resultUpdateAccount(session_id, params);

				
		if(result) {
			res=pj_id;
		}else {
			res="error_page";
		}
		return res;
	}
	
	/**
	 * 프로젝트 업로드 페이지 -> date 형식 업데이트
	 * @param pj_id, pj_colname, pj_val
	 * @return
	 */
	@RequestMapping(value="/project_date_proc", method=RequestMethod.GET)
	@ResponseBody
	public String project_date_proc(String pj_colname, String pj_val, HttpSession session) {
		boolean result = false;
		String res = "";	
		String pj_id ="";
		String session_id = (String)session.getAttribute("pj_id");
		String semail = (String)session.getAttribute("semail");
		
		if(session_id == null){
			session_id = "null";
		}
		
		if(session_id.equals("null")){
			pj_id = PJUploadDao.resultAddProject(semail);	
			session.setAttribute("pj_id", pj_id);
			session_id = pj_id;
		}
		result = PJUploadDao.resultUpdateDate(session_id, pj_colname, pj_val);
		
		if(result) {
			res=pj_id;
		}else {
			res="error_page";
		}
		
		return "success";
	}
	
	/**
	 * 에디터 업데이트
	 * @param pj_colname, pj_val
	 * @return
	 */
	@RequestMapping(value="/project_editor_proc", method=RequestMethod.POST)
	@ResponseBody
	public String project_editor_proc(@RequestBody String pj_story, HttpSession session) {
		boolean result = false;
		String res = "";	
		String pj_id="";
		String session_id = (String)session.getAttribute("pj_id");
		String semail = (String)session.getAttribute("semail");
		
		if(session_id == null){
			session_id = "null";
		}		
		if(session_id.equals("null")){
			pj_id = PJUploadDao.resultAddProject(semail);	
			session.setAttribute("pj_id", pj_id);
			session_id = pj_id;
		}
		result = PJUploadDao.resultUpdateEditor(session_id, pj_story);
		
		if(result) {
			res=pj_id;
		}else {
			res="error_page";
		}
		
		return res;
	}
	
	
	/**
	 * 프로젝트 업로드 페이지 -> varchar2 형식 업데이트
	 * @param pj_id, pj_colname, pj_val
	 * @return
	 */
	@RequestMapping(value="/project_edit_proc", method=RequestMethod.GET)
	@ResponseBody
	public String project_edit_proc(String pj_colname, String pj_val, HttpSession session) {
		boolean result = false;
		String res = "";	
		String pj_id="";
		String session_id = (String)session.getAttribute("pj_id");
		String semail = (String)session.getAttribute("semail");
		
		if(session_id == null){
			session_id = "null";
		}
		
		if(session_id.equals("null")){
			pj_id = PJUploadDao.resultAddProject(semail);	
			session.setAttribute("pj_id", pj_id);
			session_id = pj_id;
		}
		result = PJUploadDao.resultUpdateInput(session_id, pj_colname, pj_val);
		
		if(result) {
			res=pj_id;
		}else {
			res="error_page";
		}
		
		return res;
	}
	
	/**
	 * 프로젝트 업로드 페이지 -> 제목, 짧은 제목 업데이트
	 * @param pj_id, pj_title, pj_stitle
	 * @return
	 */
	@RequestMapping(value="/project_edit_title_proc", method=RequestMethod.GET)
	@ResponseBody
	public String project_edit_title_proc(String pj_title, String pj_stitle, HttpSession session) {
		boolean result = false;
		String res = "";
		String pj_id="";
		String session_id = (String)session.getAttribute("pj_id");
		String semail = (String)session.getAttribute("semail");
		
		if(session_id == null){
			session_id = "null";
		}
		
		if(session_id.equals("null")){
			pj_id = PJUploadDao.resultAddProject(semail);	
			session.setAttribute("pj_id", pj_id);
			session_id = pj_id;
		}
		
		result = PJUploadDao.resultUpdateTitle(session_id, pj_title, pj_stitle);
		
		if(result) {
			res=pj_id;
		}else {
			res="error_page";
		}
		
		return res;
	}

	/**
	 * 프로젝트 검토
	 * @return
	 */
	@RequestMapping(value="/project_upload_proc", method=RequestMethod.GET)
	public String project_upload_proc(HttpSession session, RedirectAttributes redirect) {
		String session_id = (String)session.getAttribute("pj_id");
		String res = "error_page";
		
		boolean result = PJUploadDao.resultUploadProject(session_id);
		
		
		if(result) {
			redirect.addAttribute("pj_id", session_id);
			res = "redirect:/project_start_upload";
		}
		
		return res;
	}
	
	/** project 생성 **/
	@RequestMapping(value="/new_project_proc", method=RequestMethod.GET)
	@ResponseBody
	public String new_project_proc(HttpSession session) {
		String semail = (String)session.getAttribute("semail");
		String pj_id ="";
		pj_id = PJUploadDao.resultAddProject(semail);
		
		return pj_id;
	}
	/**
	 * 프로젝트 정책 안내 페이지
	 * @return
	 */
	@RequestMapping(value="/project_start_agreement", method=RequestMethod.GET)
	public String project_start_agreement() {
		return "/project/project_start_agreement";
	}
	
	/**
	 * 프로젝트 시작 소개 페이지
	 * @return
	 */
	@RequestMapping(value="/project_start", method=RequestMethod.GET)
	public String project_start() {
		return "/project/project_start";
	}
	
}
