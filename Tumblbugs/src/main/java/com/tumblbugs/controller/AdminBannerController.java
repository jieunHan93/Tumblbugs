package com.tumblbugs.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
		
		if(ba_cimg != "" && ba_cimg != null) {
			UUID uuid = UUID.randomUUID();
			String ba_img = ba_cimg;
			ba_simg = uuid+"_"+ba_cimg;
			
			vo.setBa_img(ba_img);
			vo.setBa_simg(ba_simg);
		}
		boolean confirm = bannerDAO.getResultUpdate(vo);
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
}
