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
import com.tumblbugs.dao.BannerDAO;
import com.tumblbugs.vo.BannerVO;
import com.tumblbugs.vo.CollectionVO;

@Controller
public class AdminBannerController {
	
	@Autowired
	private BannerDAO bannerDAO;
	
	@RequestMapping(value="/admin/banner", method=RequestMethod.GET)
	public ModelAndView admin_banner() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_banner");
		return mv;
	}
	
	/** 기간에 따른 status 설정 **/
	public String getResultStatus(BannerVO vo) throws Exception {
		String ba_status = "";		String status="";	boolean result = false;
		int ba_controll = Integer.valueOf(vo.getBa_controll());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String current = format.format(currentTime);
		Date today = format.parse(current);		//현재날짜
		
		Date start = format.parse(vo.getBa_startdate());	//기획전 시작일
		Date end = format.parse(vo.getBa_enddate());		// 기획전 종료일
		
		int result1 = today.compareTo(start);		// today>start = 1, today==start = 0, today < start = -1
		int result2 = today.compareTo(end);			// today>end = 1, today==end = 0, today < end = -1
		
		//에러찾자
		if((result1 == 0 || result1 == 1) && (result2 == -1 || result2 == 0) && ba_controll == 1) {
			ba_status = "진행중";
		} else if(result2 == 1 ) {
			ba_status = "종료";
			vo.setBa_controll("0");
		} else {
			ba_status = "대기중";
			vo.setBa_controll("0");
		}
		result = bannerDAO.getResultCheckbox(vo.getBa_id(), vo.getBa_controll(), ba_status);
		if(result) {
			status = ba_status;
		}
		return status;
	}
	
	@RequestMapping(value="/admin/banner_checkbox", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getResultCheckBoxUpdate(BannerVO vo) throws Exception {
		return getResultStatus(vo);
	}
	
	/** 배너 리스트 **/
	@RequestMapping(value="/admin/banner_list", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String banner_list() {
		ArrayList<BannerVO> list = bannerDAO.getResultList();
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(BannerVO vo : list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("ba_id", vo.getBa_id());
			obj.addProperty("ba_title", vo.getBa_title());
			obj.addProperty("ba_simg", vo.getBa_simg());
			obj.addProperty("ba_startdate", vo.getBa_startdate());
			obj.addProperty("ba_enddate", vo.getBa_enddate());
			obj.addProperty("ba_controll", vo.getBa_controll());
			obj.addProperty("ba_status", vo.getBa_status());
			jlist.add(obj);
		}
		
		jdata.add("data", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	
	/** 프로젝트 주소 체크 **/
	@RequestMapping(value="/admin/banner_pj_addr_check", method=RequestMethod.GET)
	@ResponseBody
	public String banner_pj_addr_check(String pj_addr) {
		int result = bannerDAO.getResultCheck(pj_addr);
		return String.valueOf(result);
	}
	/** 배너 추가  **/
	@RequestMapping(value="/admin/banner_insert", method=RequestMethod.POST)
	@ResponseBody
	public String banner_insert(BannerVO vo, HttpServletRequest request) throws Exception {
		String ba_cimg = vo.getBa_cimg().getOriginalFilename();
		String ba_simg = "";
		String msg="";
		
		if(ba_cimg != "" && ba_cimg != null) {
			UUID uuid = UUID.randomUUID();
			String ba_img = ba_cimg;
			ba_simg = uuid+"_"+ba_cimg;
			
			vo.setBa_img(ba_img);
			vo.setBa_simg(ba_simg);
		}
		
		boolean result = bannerDAO.getResultInsert(vo);
		if(result) {
			if(ba_cimg != "" && ba_cimg != null) {
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				File file = new File(root_path+attach_path+ba_simg);
				vo.getBa_cimg().transferTo(file);
			}
			msg="success";
		} else {
			msg="fail";
		}
		return msg;
	}
	
	/** 배너 content **/
	@RequestMapping(value="/admin/banner_content", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String banner_content(String ba_id) {
		BannerVO vo = bannerDAO.getResultContent(ba_id);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		JsonObject obj = new JsonObject();
		obj.addProperty("ba_id", vo.getBa_id());
		obj.addProperty("ba_title", vo.getBa_title());
		obj.addProperty("ba_content", vo.getBa_content());
		obj.addProperty("pj_addr", vo.getPj_addr());
		obj.addProperty("ba_img", vo.getBa_img());
		obj.addProperty("ba_simg", vo.getBa_simg());
		obj.addProperty("ba_startdate", vo.getBa_startdate());
		obj.addProperty("ba_enddate", vo.getBa_enddate());
		obj.addProperty("ba_status", vo.getBa_status());
		obj.addProperty("ba_controll", vo.getBa_controll());
		jlist.add(obj);
		
		jdata.add("data", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	
	/** 배너 수정 **/
	@RequestMapping(value="/admin/banner_update", method=RequestMethod.POST)
	@ResponseBody
	public String banner_update(BannerVO vo, String del_simg, HttpServletRequest request) throws Exception {
		String ba_cimg = vo.getBa_cimg().getOriginalFilename();
		String ba_simg = "";
		String result = "";
		boolean confirm = false;
		
		if(ba_cimg != "" && ba_cimg != null) {
			UUID uuid = UUID.randomUUID();
			String ba_img = ba_cimg;
			ba_simg = uuid+"_"+ba_cimg;
			
			vo.setBa_img(ba_img);
			vo.setBa_simg(ba_simg);
		}
		confirm = bannerDAO.getResultUpdate(vo);
		getResultStatus(vo);
		if(confirm) {
			if(ba_cimg != "" && ba_cimg != null) {
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				File file= new File(root_path+attach_path+ba_simg);
				vo.getBa_cimg().transferTo(file);
				
				if(del_simg != "" && del_simg != null) {
					File del_file = new File(root_path+attach_path+del_simg);
					if(del_file.exists()) del_file.delete();
				}
			} 
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}
	
	/** 배너 삭제 **/
	@RequestMapping(value="/admin/banner_delete", method=RequestMethod.GET)
	@ResponseBody
	public String banner_delete(String ba_id, String ba_simg, HttpServletRequest request) {
		boolean result=false;
		result = bannerDAO.getResultDelete(ba_id);
		if(result) {
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path="\\resources\\upload\\";
			File file = new File(root_path+attach_path+ba_simg);
			if(file.exists()) file.delete();
		}
		return "";
	}
}
