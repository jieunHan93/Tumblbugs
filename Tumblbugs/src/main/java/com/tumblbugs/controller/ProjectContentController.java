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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.tumblbugs.dao.CommunityDAO;
import com.tumblbugs.dao.ProjectDAO;
import com.tumblbugs.vo.CommunityReplyVO;
import com.tumblbugs.vo.CommunityVO;
import com.tumblbugs.vo.ProjectVO;

@Controller
public class ProjectContentController {
	
	@Autowired
	private CommunityDAO communityDAO;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	/**
	 * 프로젝트 상세페이지
	 * @param pj_id
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/project_content", method=RequestMethod.GET)
	public ModelAndView project_content(String pj_id, String tab) {
		ModelAndView mv = new ModelAndView();
		
		//session.setAttribute("pj_id", pj_id);
		
		if(tab == null || tab.equals("")) {
			projectDAO.hitsUpdate(pj_id);
		}
		
		ProjectVO vo = projectDAO.getContent(pj_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("pj_id", pj_id);
		map.put("email", vo.getEmail());
		
		mv.setViewName("/project/project_content_main");
		mv.addObject("tab", tab);
		mv.addObject("vo", vo);
		mv.addObject("clist", communityDAO.getList(map));
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		return mv;
	}
	
	@RequestMapping(value="/community_reply_list", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String community_reply_list(String community_id) {
		Gson gson = new Gson();
		JsonArray jarr = new JsonArray();
		
		ArrayList<CommunityReplyVO> rlist = communityDAO.getReplyList(community_id);
		
		for(CommunityReplyVO vo:rlist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("reply_id", vo.getReply_id());
			obj.addProperty("email", vo.getEmail());
			obj.addProperty("name", vo.getName());
			obj.addProperty("profile_simg", vo.getProfile_simg());
			obj.addProperty("reply_content", vo.getReply_content());
			obj.addProperty("reply_date", vo.getReply_date());
			jarr.add(obj);
		}
		
		JsonObject obj = new JsonObject();
		obj.add("rlist", jarr);
		
		return gson.toJson(obj);
	}
	
	/**
	 * 프로젝트 상세페이지 > 스토리
	 * @param session
	 * @return
	 */
	/*@RequestMapping(value="/project_content/story", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String project_content_story(String pj_id) {
		return projectDAO.getStory(pj_id);
	}*/
	
	/**
	 * 프로젝트 상세페이지 > 커뮤니티
	 * @param session
	 * @return
	 */
	/*@RequestMapping(value="/project_content/community", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String project_content_community(String pj_id) {
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		
		ArrayList<CommunityVO> clist = communityDAO.getList(pj_id);
		
		for(CommunityVO cvo:clist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("community_id", cvo.getCommunity_id());
			obj.addProperty("email", cvo.getEmail());
			obj.addProperty("name", cvo.getName());
			obj.addProperty("community_content", cvo.getCommunity_content());
			obj.addProperty("community_date", cvo.getCommunity_date());
			obj.addProperty("community_udate", cvo.getCommunity_udate());
			obj.addProperty("rcount", cvo.getRcount());
			
			jlist.add(obj);
		}
		
		JsonObject jdata = new JsonObject();
		jdata.add("list", jlist);
		
		return gson.toJson(jdata);
	}*/
	
	/**
	 * 프로젝트 상세페이지 > 펀딩 안내
	 * @param session
	 * @return
	 */
	/*@RequestMapping(value="/project_content/policy", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String project_content_policy(HttpSession session) {
		return null;
	}*/
	
	
	/** 커뮤니티 **/
	@RequestMapping(value="/community_write_proc", method=RequestMethod.POST)
	public String community_write(CommunityVO vo) {
		String resPage = "";
		
		if(communityDAO.getResultWrite(vo) != 0) {
			resPage = "redirect:/project_content";
		} else {
			//에러페이지
		}
		
		return resPage;
	}
	
	/** 프로젝트 미리보기 **/
	@RequestMapping(value="/project_preview", method=RequestMethod.GET)
	public ModelAndView project_preview(String pj_id, String tab) {
		ModelAndView mv = new ModelAndView();
		
		pj_id = "PJ00001";
		
		ProjectVO vo = projectDAO.getContent(pj_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("pj_id", pj_id);
		map.put("email", vo.getEmail());
		
		mv.setViewName("/project/project_preview");
		mv.addObject("tab", tab);
		mv.addObject("vo", vo);
		mv.addObject("clist", communityDAO.getList(map));
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		
		return mv;
	}
}
