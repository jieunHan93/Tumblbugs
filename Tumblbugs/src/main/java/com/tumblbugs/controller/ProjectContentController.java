package com.tumblbugs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.tumblbugs.vo.GiftVO;
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
	@RequestMapping(value={"/project/{pj_addr}"})
	public ModelAndView project_content(@PathVariable("pj_addr") String pj_addr) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String pj_id = projectDAO.getPj_id(pj_addr);	//pj_id 가져오기
		
		projectDAO.hitsUpdate(pj_id);	//조회수 업데이트
		
		ProjectVO vo = projectDAO.getContent(pj_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("pj_id", pj_id);
		map.put("email", vo.getEmail());
		
		mv.setViewName("/project/project_content_story");
		mv.addObject("vo", vo);
		mv.addObject("clist", communityDAO.getList(map));
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		return mv;
	}
	
	@RequestMapping(value={"/project/{pj_addr}/{tab}"})
	public ModelAndView project_content_tab(@PathVariable("pj_addr") String pj_addr, @PathVariable("tab") String tab) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String pj_id = projectDAO.getPj_id(pj_addr);	//pj_id 가져오기
		
		ProjectVO vo = projectDAO.getContent(pj_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("pj_id", pj_id);
		map.put("email", vo.getEmail());
		
		mv.setViewName("/project/project_content_" + tab);
		mv.addObject("tab", tab);
		mv.addObject("vo", vo);
		mv.addObject("clist", communityDAO.getList(map));
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		return mv;
	}
	
	/**
	 * 커뮤니티 신규 게시글 등록
	 * @param pj_addr
	 * @return
	 */
	@RequestMapping(value= {"/project/{pj_addr}/community/new"})
	public ModelAndView community_write(@PathVariable("pj_addr") String pj_addr) {
		ModelAndView mv = new ModelAndView();
		
		String pj_id = projectDAO.getPj_id(pj_addr);	//pj_id 가져오기
		ProjectVO vo = projectDAO.getContent(pj_id);
		
		mv.setViewName("/project/project_content_community_write");
		mv.addObject("tab", "community");
		mv.addObject("vo", vo);
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		mv.addObject("writeCase", "new");
		
		return mv;
	}
	
	/**
	 * 커뮤니티 게시글 수정
	 * @param pj_addr
	 * @param community_id
	 * @return
	 */
	@RequestMapping(value={"/project/{pj_addr}/community/update/{community_id}"})
	public ModelAndView community_update(@PathVariable("pj_addr") String pj_addr, @PathVariable("community_id") String community_id) {
		ModelAndView mv = new ModelAndView();
		
		String pj_id = projectDAO.getPj_id(pj_addr);	//pj_id 가져오기
		ProjectVO vo = projectDAO.getContent(pj_id);
		CommunityVO cvo = communityDAO.getContent(community_id);
		
		mv.setViewName("/project/project_content_community_write");
		mv.addObject("tab", "community");
		mv.addObject("vo", vo);
		mv.addObject("cvo", cvo);
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		mv.addObject("writeCase", "update");
		
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
	 * 커뮤니티 게시글 등록
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/community_write_proc", method=RequestMethod.POST)
	public String community_write(CommunityVO vo) {
		String resPage = "";
		
		if(communityDAO.getResultWrite(vo) != 0) {
			resPage = "redirect:/project/" + projectDAO.getPj_addr(vo.getPj_id()) + "/community";
		} else {
			//에러페이지
		}
		
		return resPage;
	}
	
	/**
	 * 커뮤니티 게시글 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/community_update_proc", method=RequestMethod.POST)
	public String community_update(CommunityVO vo) {
		String resPage = "";
		
		if(communityDAO.getResultUpdate(vo) != 0) {
			resPage = "redirect:/project/" + projectDAO.getPj_addr(vo.getPj_id()) + "/community";
		} else {
			//에러페이지
		}
		
		return resPage;
	}
	
	/**
	 * 커뮤니티 게시글 삭제
	 * @param community_id
	 * @return
	 */
	@RequestMapping(value="/community_delete_proc", method=RequestMethod.GET)
	@ResponseBody
	public String community_delete(String community_id) {
		return String.valueOf(communityDAO.getResultDelete(community_id));
	}
	
	
	/** 커뮤니티 댓글 등록 **/
	@RequestMapping(value="/community_reply_write_proc", method=RequestMethod.GET)
	@ResponseBody
	public String community_reply_write(HttpSession session, String community_id, String reply_content) {
		CommunityReplyVO vo = new CommunityReplyVO();
		vo.setCommunity_id(community_id);
		vo.setEmail((String)session.getAttribute("semail"));
		vo.setReply_content(reply_content);
		
		return String.valueOf(communityDAO.getReplyWriteResult(vo));
	}
	
	@RequestMapping(value="/community_reply_delete_proc", method=RequestMethod.GET)
	@ResponseBody
	public String community_reply_delete(String reply_id) {
		return String.valueOf(communityDAO.getReplyDeleteResult(reply_id));
	}
	
	/** 프로젝트 미리보기 **/
	@RequestMapping(value="/project_preview", method=RequestMethod.GET)
	public ModelAndView project_preview(String pj_id, String tab) throws Exception {
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
