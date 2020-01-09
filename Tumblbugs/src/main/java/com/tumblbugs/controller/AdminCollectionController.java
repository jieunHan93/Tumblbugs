package com.tumblbugs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.tumblbugs.dao.CollectionDAO;
import com.tumblbugs.vo.CollectionVO;
import com.tumblbugs.vo.ProjectVO;

@Controller
public class AdminCollectionController {
	
	@Autowired
	private CollectionDAO collectionDAO;
	
	/** 기간에 따른 status 설정 **/
	public String getResultStatus(CollectionVO vo) throws Exception {
		String col_status = "";		String status="";	boolean result = false;
		int col_controll = Integer.valueOf(vo.getCol_controll());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String current = format.format(currentTime);
		Date today = format.parse(current);		//현재날짜
		
		Date start = format.parse(vo.getCol_startdate());	//기획전 시작일
		Date end = format.parse(vo.getCol_enddate());		// 기획전 종료일
		
		int result1 = today.compareTo(start);		// today>start = 1, today==start = 0, today < start = -1
		int result2 = today.compareTo(end);			// today>end = 1, today==end = 0, today < end = -1
		
		//에러찾자
		if((result1 == 0 || result1 == 1) && (result2 == -1 || result2 == 0) && col_controll == 1) {
			col_status = "진행중";
		} else if(result2 == 1 ) {
			col_status = "종료";
		} else {
			col_status = "대기중";
		}
		result = collectionDAO.getResultCheckbox(vo.getCol_id(), vo.getCol_controll(), col_status);
		if(result) {
			status = col_status;
		}
		return status;
	}
	
	/** 기획전 메인 **/
	@RequestMapping(value="/admin/collection", method=RequestMethod.GET)
	public ModelAndView admin_collection() {
		ModelAndView mv = new ModelAndView();
		//ArrayList<CollectionVO> list = collectionDAO.getResultList();
		//mv.addObject("list", list);
		mv.setViewName("/admin/admin_collection");
		return mv;
	}
	/** 기획전 메인 dataTable **/
	@RequestMapping(value="admin/collection_list", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String collection_list() {
		ArrayList<CollectionVO> list = collectionDAO.getResultList();
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(CollectionVO vo : list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("col_addr", vo.getCol_addr());
			obj.addProperty("col_id", vo.getCol_id());
			obj.addProperty("col_name", vo.getCol_name());
			obj.addProperty("col_startdate", vo.getCol_startdate());
			obj.addProperty("col_enddate", vo.getCol_enddate());
			obj.addProperty("col_controll", vo.getCol_controll());
			obj.addProperty("col_status", vo.getCol_status());
			jlist.add(obj);
		}
		
		jdata.add("data", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	
	/** 기획전 메인-checkbox 반영 **/
	@RequestMapping(value="admin/collection_checkbox", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String collection_checkbox(CollectionVO vo) throws Exception{
		String status = "fail";
		int val = collectionDAO.getResultProjectCount(vo.getCol_id());
		if(val != 0) {
			status = getResultStatus(vo);
		}
		return status;
	}
	/** 기획전 메인-checkbox 반영 -- 시스템 날짜 반영의 위함  : index로 이동하는게 로직에 맞음 시스템시작시에 반영**/
	@RequestMapping(value="admin/collection_checkbox_system", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String collection_checkbox_system() throws Exception{
		String reuslt="";
		ArrayList<CollectionVO> list = collectionDAO.getResultList();
		for(CollectionVO vo : list) {
			getResultStatus(vo);
		}
		return reuslt;
	}
	/** 달력에 데이터 출력 **/
	@RequestMapping(value="/admin/collection/calendar_list",method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String calendar_list() {
		ArrayList<CollectionVO> list = collectionDAO.getResultCalendarList();
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();

		for (CollectionVO vo: list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("_id", vo.getCol_id());
			obj.addProperty("title", vo.getCol_name());
			obj.addProperty("description", vo.getCol_content());
			obj.addProperty("start", vo.getCol_startdate());
			obj.addProperty("end", vo.getCol_enddate());
			obj.addProperty("type", vo.getCol_status());
			obj.addProperty("controll", vo.getCol_controll());
			obj.addProperty("backgroundColor", vo.getCol_ccolor());
			obj.addProperty("allDay",true);
			jlist.add(obj);
		}
		jdata.add("list", jlist);
		String result = gson.toJson(jdata);
		
		return result;
	}
	/** 컬렉션 상태 카운트 **/
	@RequestMapping(value="/admin/collection/count",method=RequestMethod.GET)
	@ResponseBody
	public String admin_collection_count() {
		CollectionVO vo = collectionDAO.getResultCollectionCount();
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();

		JsonObject obj = new JsonObject();
		obj.addProperty("count1", vo.getCount1());
		obj.addProperty("count2", vo.getCount2());
		obj.addProperty("count3", vo.getCount3());
		jlist.add(obj);
		jdata.add("list", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	/** 컬렉션 등록 **/
	@RequestMapping(value="/admin/collection/write", method=RequestMethod.GET)
	public String admin_collection_write() {
		return "/admin/admin_collection_write";
	}
	/** 컬렉션 주소 체크 **/
	@RequestMapping(value="/admin/collection/write/check", method=RequestMethod.GET)
	@ResponseBody
	public int admin_collection_write_check(String col_addr, String col_id) {
		return collectionDAO.getResultCheckCol_addr(col_addr, col_id);
	}
	
	/** 컬렉션 등록 과정 **/
	@RequestMapping(value="/admin/collection/write_proc", method=RequestMethod.POST)
	public String admin_collection_write_proc(CollectionVO vo, HttpServletRequest request) throws Exception {
		String respage="";	String cofile=vo.getCofile().getOriginalFilename();
		String col_simg ="";
		boolean result = false;
		if(cofile != "" && cofile != null) {
			UUID uuid= UUID.randomUUID();
			String col_img = cofile;
			col_simg = uuid+"_"+cofile;
			
			vo.setCol_img(col_img);
			vo.setCol_simg(col_simg);
		}
		
		result = collectionDAO.getResultWrite(vo);
		if(result) {
			if(cofile != "" && cofile != null) {
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				File file = new File(root_path+attach_path+col_simg);
				vo.getCofile().transferTo(file);
			}
			respage="redirect:/admin/collection";
		} else {
			respage="/error";
		}
		return respage;
	}
	/** 컬렉션 상세 **/
	@RequestMapping(value="/admin/collection/content", method=RequestMethod.GET)
	public ModelAndView admin_collection_content(String col_id) {
		ModelAndView mv = new ModelAndView();
		CollectionVO vo = collectionDAO.getResultContent(col_id);
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_collection_content");
		return mv;
	}
	/** 컬렉션 상세 수정 **/
	@RequestMapping(value="/admin/collection/update_proc", method=RequestMethod.POST)
	public ModelAndView admin_collection_update_proc(CollectionVO vo, String del_img, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		String status =  getResultStatus(vo);
		String respage="";	String col_simg="";		boolean result = false;
		String cofile= vo.getCofile().getOriginalFilename();
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "\\resources\\upload\\";
		
		if(cofile != "" && cofile != null) {
			UUID uuid = UUID.randomUUID();
			String col_img = cofile;
			col_simg = uuid+"_"+cofile;
			
			vo.setCol_img(col_img);
			vo.setCol_simg(col_simg);
		}
		if(status == "종료") {
			vo.setCol_controll("0");
		}
		vo.setCol_status(status);
		result = collectionDAO.getResultUpdate(vo);
		if(result) {
			if(cofile != "" && cofile != null) {
				File file = new File(root_path+attach_path+col_simg);
				vo.getCofile().transferTo(file);
				
				if(del_img != "" && del_img != null) {
					File dfile = new File(root_path+attach_path+del_img);
					if(dfile.exists()) dfile.delete();
				}
			}
			mv.addObject("col_id", vo.getCol_id());
			mv.setViewName("redirect:/admin/collection/content");
		} else {
			mv.setViewName("/error");
		}
		return mv;
	}

	/** 컬렉션 삭제 **/
	@RequestMapping(value="/admin/collection/delete_porc",method=RequestMethod.GET)
	public ModelAndView admin_collection_delete_proc(String col_id) {
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		result = collectionDAO.getResultDelete(col_id);
		if(result) {
			mv.setViewName("redirect:/admin/collection");
		} else {
			mv.setViewName("/error");
		}
		return mv;
	}
	/** 달력 일정 수정 **/
	@RequestMapping(value="/admin/collection/calendar_updateBtn", method=RequestMethod.GET)
	@ResponseBody
	public int admin_collection_calendar_updateBtn(CollectionVO vo) throws Exception {
		int val = 0;
		String col_controll = collectionDAO.getResultCol_controll(vo.getCol_id());
		vo.setCol_controll(col_controll);
		String status = getResultStatus(vo);
		if(status == "종료") {
			vo.setCol_controll("0");
		}
		vo.setCol_status(status);
		vo.setCol_ccolor("#" + vo.getCol_ccolor());
		val = collectionDAO.getResultCalendarUpdateBtn(vo);
		return val;
	}
	/** 달력 일정 삭제 **/
	@RequestMapping(value="/admin/collection/calendar_deleteBtn", method=RequestMethod.GET)
	@ResponseBody
	public int admin_collection_calendar_deleteBtn(String col_id) {
		int val = 0;
		val = collectionDAO.getResultCalendarDeleteBtn(col_id);
		return val;
	}
	/** 달력 일정 수정 드래그  **/
	@RequestMapping(value="/admin/collection/calendar_updateDrag", method=RequestMethod.GET)
	@ResponseBody
	public int admin_collection_calendar_updateDrag(CollectionVO vo) throws Exception {
		int val = 0;
		String col_controll = collectionDAO.getResultCol_controll(vo.getCol_id());
		vo.setCol_controll(col_controll);
		String status = getResultStatus(vo);
		if(status == "종료") {
			vo.setCol_controll("0");
		}
		vo.setCol_status(status);
		val = collectionDAO.getResultCalendarUpdateDrag(vo);
		return val;
	}
	/** 해당 컬렉션에 프로젝트 추가 + 중복체크 **/
	@RequestMapping(value="/admin/collection/add_project", method=RequestMethod.GET)
	@ResponseBody
	public int admin_collection_add_project(CollectionVO vo) {
		int val = 0;	int check = 0;
		check = collectionDAO.getResultProjectCheck(vo);
		if(check == 0) {
			val = collectionDAO.getResultAddProject(vo);
		}
		return val;
	}
	/** 해당 컬렉션의 프로젝트 제거 **/
	@RequestMapping(value="/admin/collection/remove_project", method=RequestMethod.GET)
	@ResponseBody
	public int admin_collection_remove_project(CollectionVO vo) {
		int val = 0;
		val = collectionDAO.getResultRemoveProject(vo);
		return val;
	}
	/** 프로젝트 dataTable **/
	@RequestMapping(value="/admin/collection/project_list", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String project_list() {
		ArrayList<CollectionVO> plist = collectionDAO.getResultProjectList();
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(CollectionVO vo : plist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("pj_id", vo.getPj_id());
			obj.addProperty("pj_category", vo.getPj_category());
			obj.addProperty("pj_title", vo.getPj_title());
			obj.addProperty("name", vo.getName());
			obj.addProperty("pj_start_date", vo.getPj_start_date());
			obj.addProperty("pj_end_date", vo.getPj_end_date());
			jlist.add(obj);
		}
		
		jdata.add("data", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	/** 해당 컬렉션에 참여중인 프로젝트 dataTable **/
	@RequestMapping(value="/admin/collection/collection_project_list", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String collection_project_list(String col_id) {
		ArrayList<CollectionVO> cplist = collectionDAO.getResultCol_idProjectList(col_id);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(CollectionVO vo : cplist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("pj_id", vo.getPj_id());
			obj.addProperty("pj_category", vo.getPj_category());
			obj.addProperty("pj_title", vo.getPj_title());
			obj.addProperty("name", vo.getName());
			obj.addProperty("pj_start_date", vo.getPj_start_date());
			obj.addProperty("pj_end_date", vo.getPj_end_date());
			jlist.add(obj);
		}
		
		jdata.add("data", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	
}
