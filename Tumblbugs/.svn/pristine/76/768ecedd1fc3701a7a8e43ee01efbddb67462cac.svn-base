package com.tumblbugs.controller;

import java.util.ArrayList;

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
import com.tumblbugs.dao.ProjectSortDAO;
import com.tumblbugs.dao.SearchDAO;
import com.tumblbugs.vo.CollectionVO;
import com.tumblbugs.vo.ProjectVO;

@Controller
public class ProjectSortController {
	
	@Autowired
	private CollectionDAO collectionDAO;
	@Autowired
	private ProjectSortDAO projectsortDAO;
	@Autowired
	private SearchDAO searchDAO;
	
	//int count = 0;
	@RequestMapping(value = "/discover", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String scroll(String keyword) {
		if(keyword != "" && keyword != null) {
			searchDAO.getResultInsertKeyword(keyword);
		}
		return "/project_sort/project_discover";
	}
	@RequestMapping(value = "/discover_proc", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String scroll_pro(String page, String category, String ongoing, String rate, String money, String editorpick, String order, String search) {
		page = String.valueOf(Integer.valueOf(page)-1);
		if(category.equals("null"))  category = "전체";
		if(ongoing.equals("null"))  ongoing = "전체";
		if(rate.equals("null"))	 rate = "전체";
		if(money.equals("null"))  money ="전체";
		if(editorpick.equals("null"))  editorpick="전체";
		if(order.equals("null"))  order="fav";
		if(search.equals("null")) search="전체";
		//if(search.equals("null"))
		//System.out.println("category:" + category +", ongoing:" + ongoing+", rate:" + rate+", money:"+money+", editorpick:"+editorpick+", order:"+order);
		//if(Integer.parseInt(page) == 2 && count != 0) count = 0;
		
		// 페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 8; // 한페이지당 게시물 수
		int reqPage = 1; // 요청페이지
		int pageCount = 1; // 전체 페이지 수
		int dbCount = projectsortDAO.execSortCount(category, ongoing, rate, money, editorpick, order, search); // DB에서 가져온 전체 행수(전체 페이지를 구하기 위함)
		int totalPage = 0;
		
		// 총 페이지 수 계산
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		// 요청 페이지 계산
		if (page != null) {
			reqPage = Integer.parseInt(page); // rpage는 쿼리 스트링으로 넘어와서 String 타입이다!
			startCount = (reqPage - 1) * pageSize + 1; // 1 페이지 일때는 무조건 1이 나온다
			endCount = reqPage * pageSize;
		} else {
			reqPage = 1;
			startCount = 1;
			endCount = pageSize;
			//count++;
		} 
		
		ArrayList<ProjectVO> list = projectsortDAO.getResultProjectList(startCount, endCount, category, ongoing, rate, money, editorpick, order, search);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();

		for (ProjectVO vo : list) {
			JsonObject obj = new JsonObject();
			String icon = "", color = "", remaining_days="";
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("pj_id", vo.getPj_id());
			obj.addProperty("pj_title", vo.getPj_title());
			obj.addProperty("name", vo.getName());
			obj.addProperty("pj_simg", vo.getPj_simg());

			if(vo.getStatus().equals("진행중")) {
				icon="far fa-calendar-alt";
				color="#767676"; 
				if(vo.getRemaining_days().equals("0")) {
					remaining_days="오늘 마감";
				} else {
					remaining_days=vo.getRemaining_days()+"일 남음";
				}
			} else if (vo.getStatus().equals("펀딩 성공")) {
				icon="fas fa-gift";
				color="#1e90ff"; 
				remaining_days=vo.getStatus();
			} else if (vo.getStatus().equals("펀딩 무산")) {
				icon="fas fa-rocket";
				color="#757575"; 
				remaining_days=vo.getStatus();
			}
			
			obj.addProperty("funding", vo.getFunding());
			obj.addProperty("progress", vo.getProgress());
			obj.addProperty("icon", icon);
			obj.addProperty("color", color); 
			obj.addProperty("remaining_days", remaining_days);
			obj.addProperty("dbCount", dbCount);
			jlist.add(obj);
		}
		jdata.add("list", jlist);
		String result = gson.toJson(jdata);
		return result;
	}
	
	/** 컬렉션 페이지 오픈 **/
	@RequestMapping(value="/collections", method=RequestMethod.GET)
	public ModelAndView collections(String col_id) {
		ModelAndView mv = new ModelAndView();
		CollectionVO vo =collectionDAO.getResultTitle(col_id);
		mv.addObject("vo", vo);
		mv.addObject("col_id",col_id);
		mv.setViewName("/project_sort/project_collections");
		return mv;
	}
	
	@RequestMapping(value = "/collections_proc", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String collections_proc(String page, String col_id) {
		page = String.valueOf(Integer.valueOf(page)-1);
		
		// 페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 8; // 한페이지당 게시물 수
		int reqPage = 1; // 요청페이지
		int pageCount = 1; // 전체 페이지 수
		int dbCount = projectsortDAO.execTotalCount(col_id); // DB에서 가져온 전체 행수(전체 페이지를 구하기 위함)
		int totalPage = 0;
		
		// 총 페이지 수 계산
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		// 요청 페이지 계산
		if (page != null) {
			reqPage = Integer.parseInt(page); // rpage는 쿼리 스트링으로 넘어와서 String 타입이다!
			startCount = (reqPage - 1) * pageSize + 1; // 1 페이지 일때는 무조건 1이 나온다
			endCount = reqPage * pageSize;
		} else {
			reqPage = 1;
			startCount = 1;
			endCount = pageSize;
		} 
		
		ArrayList<ProjectVO> list = projectsortDAO.getResultCollectionProjectList(col_id, startCount, endCount);
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();

		for (ProjectVO vo : list) {
			JsonObject obj = new JsonObject();
			String icon = "", color = "", remaining_days="";
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("pj_id", vo.getPj_id());
			obj.addProperty("pj_title", vo.getPj_title());
			obj.addProperty("name", vo.getName());
			obj.addProperty("pj_simg", vo.getPj_simg());

			if(vo.getStatus().equals("진행중")) {
				icon="far fa-calendar-alt";
				color="#767676"; 
				if(vo.getRemaining_days().equals("0")) {
					remaining_days="오늘 마감";
				} else {
					remaining_days=vo.getRemaining_days()+"일 남음";
				}
			} else if (vo.getStatus().equals("펀딩 성공")) {
				icon="fas fa-gift";
				color="#1e90ff"; 
				remaining_days=vo.getStatus();
			} else if (vo.getStatus().equals("펀딩 무산")) {
				icon="fas fa-rocket";
				color="#757575"; 
				remaining_days=vo.getStatus();
			}
			obj.addProperty("funding", vo.getFunding());
			obj.addProperty("progress", vo.getProgress());
			obj.addProperty("icon", icon);
			obj.addProperty("color", color); 
			obj.addProperty("remaining_days", remaining_days);
			obj.addProperty("dbCount", dbCount);
			jlist.add(obj);
		}
		jdata.add("list", jlist);
		String result = gson.toJson(jdata);

		return result;
	}
}
