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
import com.tumblbugs.dao.FundingDAO;
import com.tumblbugs.dao.MypageDAO;
import com.tumblbugs.dao.ProjectDAO;
import com.tumblbugs.vo.FundingGiftVO;
import com.tumblbugs.vo.FundingVO;

@Controller
public class myFundingController {
	@Autowired
	MypageDAO mypagedao;
	
	@Autowired
	private FundingDAO fundingDAO;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	/**
	 * 내 후원현황 리스트 화면
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/myfunding", method=RequestMethod.GET)
	public ModelAndView myfunding(HttpSession session, String cancelResult, String category, String page) {
		ModelAndView mv = new ModelAndView();
		String email = (String)session.getAttribute("semail");
		
		mv.setViewName("/mypage/myfunding");
		mv.addObject("member", mypagedao.getProfile(email));
		
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = fundingDAO.execTotalCount(email, category, null);	//DB에서 가져온 전체 행수
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(page != null){
			reqPage = Integer.parseInt(page);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}
		
		mv.addObject("category", category);
		mv.addObject("page", page);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("cancelResult", cancelResult);
		mv.addObject("fundingCount", fundingDAO.getFundingCount(email));
		mv.addObject("flist", fundingDAO.getFundingList(email, category, null, startCount, endCount));
		
		Map map = fundingDAO.getFundingCount(email);
		
		return mv;
	}
	
	/**
	 * 후원현황 상세
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/myfunding/{funding_id}")
	public ModelAndView funding_detail(@PathVariable("funding_id") String funding_id) {
		ModelAndView mv = new ModelAndView();
		
		FundingVO fvo = fundingDAO.getFundingDetail(funding_id);
		
		mv.setViewName("/mypage/myfunding_detail");
		mv.addObject("fvo", fvo);
		mv.addObject("giftList", fundingDAO.getFundingGiftList(funding_id));
		mv.addObject("pj_addr", projectDAO.getPj_addr(fvo.getPj_id()));
		
		return mv;
	}
	
	/**
	 * 후원현황 > 배송 정보 수정(ajax)
	 * @param column
	 * @param value
	 * @return
	 */
	@RequestMapping(value="/myfunding_delivery_update", method=RequestMethod.GET)
	@ResponseBody
	public String myfunding_delivery_update(String funding_id, String column, String value) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("funding_id", funding_id);
		map.put("column_name", column);
		map.put("value", value);
		
		return String.valueOf(fundingDAO.getDeliveryUpdateResult(map));
	}
	
	/**
	 * 후원현황 선물 변경하기 화면
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/myfunding/{funding_id}/edit_gift")
	public ModelAndView funding_edit_reward(@PathVariable("funding_id") String funding_id) {
		ModelAndView mv = new ModelAndView();
		
		FundingVO fvo = fundingDAO.getFundingDetail(funding_id);
		String pj_id = fvo.getPj_id();
		
		mv.setViewName("/mypage/myfunding_edit_gift");
		mv.addObject("edit_menu", "edit_gift");
		mv.addObject("funding_id", funding_id);
		mv.addObject("pvo", projectDAO.getContent(pj_id));
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		return mv;
	}
	
	@RequestMapping(value="/fundingGiftList", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String getFundingGiftList(String funding_id) {
		Gson gson = new Gson();
		JsonArray jarr = new JsonArray();
		
		ArrayList<FundingGiftVO> fundingGiftList= fundingDAO.getFundingGiftList(funding_id);
		
		for(FundingGiftVO vo:fundingGiftList) {
			JsonObject obj = new JsonObject();
			obj.addProperty("funding_id", vo.getFunding_id());
			obj.addProperty("gift_id", vo.getGift_id());
			obj.addProperty("gift_quantity", vo.getGift_quantity());
			obj.addProperty("gift_option", vo.getGift_option());
			obj.addProperty("funding_gift_price", vo.getFunding_gift_price());
			jarr.add(obj);
		}
		
		JsonObject data = new JsonObject();
		data.add("fglist", jarr);
		
		return gson.toJson(data);
	}
	
	/**
	 * 결제 수단 변경 화면
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/myfunding/{funding_id}/edit_payment")
	public ModelAndView funding_edit_payment(@PathVariable("funding_id") String funding_id) {
		ModelAndView mv = new ModelAndView();
		
		FundingVO fvo = fundingDAO.getFundingDetail(funding_id);
		
		mv.setViewName("/mypage/myfunding_edit_payment");
		mv.addObject("edit_menu", "edit_payment");
		mv.addObject("funding_id", funding_id);
		mv.addObject("pvo", projectDAO.getContent(fvo.getPj_id()));
		
		return mv;
	}
	
	/**
	 * 후원 취소 화면
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/myfunding/{funding_id}/cancel_funding")
	public ModelAndView funding_cancel(@PathVariable("funding_id") String funding_id) {
		ModelAndView mv = new ModelAndView();
		
		FundingVO fvo = fundingDAO.getFundingDetail(funding_id);
		
		mv.setViewName("/mypage/myfunding_cancel_funding");
		mv.addObject("edit_menu", "cancel_funding");
		mv.addObject("funding_id", funding_id);
		mv.addObject("pvo", projectDAO.getContent(fvo.getPj_id()));
		return mv;
	}
	
	/**
	 * 후원 취소 처리(ajax)
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/funding_cancel_proc", method=RequestMethod.GET)
	@ResponseBody
	public String funding_cancel_proc(String funding_id) {
		return String.valueOf(fundingDAO.getFundingCancelResult(funding_id));
	}
}
