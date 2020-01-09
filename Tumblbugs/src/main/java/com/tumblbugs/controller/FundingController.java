package com.tumblbugs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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
import com.tumblbugs.dao.PaymentDAO;
import com.tumblbugs.dao.ProjectDAO;
import com.tumblbugs.dao.ProjectSortDAO;
import com.tumblbugs.vo.FundingGiftVO;
import com.tumblbugs.vo.FundingVO;
import com.tumblbugs.vo.PaymentVO;
import com.tumblbugs.vo.ProjectVO;

@Controller
public class FundingController {
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private ProjectSortDAO projectsortDAO;
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	@Autowired
	private FundingDAO fundingDAO;
	
	@Autowired
	private MypageDAO mypageDAO;
	
	/**
	 * 선물 선택 및 추가 후원금 입력 화면
	 * @param pj_id
	 * @param gift_id
	 * @return
	 */
	@RequestMapping(value="/{pj_addr}/funding/step1", method=RequestMethod.GET)
	public ModelAndView step1(@PathVariable("pj_addr") String pj_addr, String gift_id) {
		ModelAndView mv = new ModelAndView();
		
		String pj_id = projectDAO.getPj_id(pj_addr);
		
		mv.setViewName("/funding/step1_gift_select");
		mv.addObject("pj_id", pj_id);
		mv.addObject("pj_addr", pj_addr);
		mv.addObject("pj_title", projectDAO.getProjectTitle(pj_id));
		mv.addObject("gift_id", gift_id);
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		return mv;
	}
	
	/**
	 * 결제 예약 화면
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/{pj_addr}/funding/step2", method=RequestMethod.POST)
	public ModelAndView step2(@PathVariable("pj_addr") String pj_addr, FundingVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		String email = (String)session.getAttribute("semail");
		List<FundingGiftVO> list = (ArrayList<FundingGiftVO>)vo.getGiftList();
		
		for(int i=list.size(); i>0; i--) {
			FundingGiftVO fgvo = list.get(i-1);
			
			if(StringUtils.hasLength(fgvo.getSelect_yn())) {
				fgvo.setItemList(projectDAO.getItemList(fgvo.getGift_id()));
				
				int funding_gift_price = Integer.parseInt(fgvo.getGift_price().replace(",", "").replace(" ", "")) * fgvo.getGift_quantity();
				list.get(i-1).setFunding_gift_price(String.valueOf(funding_gift_price));
				
			} else {
				list.remove(i-1);
			}
		}
		
		vo.setGiftList(list);
		
		mv.setViewName("/funding/step2_payment_reservation");
		mv.addObject("vo", vo);
		mv.addObject("pj_addr", pj_addr);
		mv.addObject("pj_title", projectDAO.getProjectTitle(vo.getPj_id()));
		mv.addObject("paymentList", paymentDAO.getPaymentList(email));	//결제수단 리스트
		mv.addObject("recentDeliveryInfo", fundingDAO.getRecentDeliveryInfo(email));	//최근 배송지
		
		return mv;
	}
	
	/**
	 * 펀딩 DB 저장
	 * @param vo
	 * @param pvo
	 * @return
	 */
	@RequestMapping(value="/{pj_addr}/funding/complete", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView step3(@PathVariable("pj_addr") String pj_addr, FundingVO vo, PaymentVO pvo) {
		
		ModelAndView mv = new ModelAndView();
		
		if(vo.getEmail() == null) {
			mv.setViewName("redirect:/" + pj_addr + "/funding/step1");
		} else {
			String payment_id = vo.getPayment_id();
			
			//신규 결제 수단 등록
			if(!pvo.getPayment_method().equals("")) {
				int result = paymentDAO.regist(pvo);
				
				if(result != 0) {
					payment_id = paymentDAO.getNewPaymentId(vo.getEmail());
					vo.setPayment_id(payment_id);
				}
			}
			
			//payment_info 컬럼에 들어갈 데이터 가공
			PaymentVO payment = paymentDAO.getPaymentContent(payment_id);
			String payment_info = "";
			if(payment.getPayment_method().equals("01")) {
				payment_info = "카드(" + payment.getCard_company() + "/" + payment.getCard_number() + ")";
			} else if(payment.getPayment_method().equals("02")) {
				payment_info = "계좌(" + payment.getBank() + "/" + payment.getAccount_number() + ")";
			}
			vo.setPayment_info(payment_info);
			
			//펀딩 등록: tum_funding
			int nthSupporter = fundingDAO.insertFunding(vo);
			if(nthSupporter != 0) {
				mv.setViewName("/funding/step3_funding_success");
				mv.addObject("nthSupporter", nthSupporter);
				mv.addObject("project", projectDAO.getContent(vo.getPj_id()));
				ArrayList<ProjectVO> favlist = projectsortDAO.getResultProjectList(1, 8,"전체", "ongoing", "전체", "전체", "1", "fav", "전체");
				mv.addObject("favlist",favlist);
			} else {
				mv.setViewName("errorPage");
			}
		}
		
		return mv;
	}
	
	
	/**
	 * 내 후원현황 리스트 화면
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/myfunding", method=RequestMethod.GET)
	public ModelAndView myfunding(HttpSession session, String cancelResult, String page) {
		ModelAndView mv = new ModelAndView();
		String email = (String)session.getAttribute("semail");
		
		mv.setViewName("/mypage/myfunding");
		mv.addObject("member", mypageDAO.getProfile(email));
		
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = fundingDAO.execTotalCount(email, "all", null);	//DB에서 가져온 전체 행수
		
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
		
		mv.addObject("page", page);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("cancelResult", cancelResult);
		mv.addObject("fundingCount", fundingDAO.getFundingCount(email));
		mv.addObject("flist", fundingDAO.getFundingList(email, "all", null, startCount, endCount));
		
		Map map = fundingDAO.getFundingCount(email);
		
		return mv;
	}
	
	
	/**
	 * 내 후원현황 리스트 화면 - 카테고리 선택(모두보기/펀딩 진행중/결제 완료)
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/myfunding/{category}", method=RequestMethod.GET)
	public ModelAndView myfunding_category(HttpSession session, String cancelResult, @PathVariable("category") String category, String page) {
		ModelAndView mv = new ModelAndView();
		String email = (String)session.getAttribute("semail");
		
		mv.setViewName("/mypage/myfunding");
		mv.addObject("member", mypageDAO.getProfile(email));
		
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
	 * 내 후원현황 > 검색 결과
	 * @param session
	 * @param search
	 * @return
	 */
	@RequestMapping(value="/myfunding/search", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String myfunding_search_list(HttpSession session, String search) {
		Gson gson = new Gson();
		JsonArray jarr = new JsonArray();
		
		String email = (String)session.getAttribute("semail");
		ArrayList<FundingVO> flist = fundingDAO.getFundingList(email, null, search, 1, 1000);
		for(FundingVO vo:flist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("funding_id", vo.getFunding_id());
			obj.addProperty("pj_title", vo.getPj_title());
			obj.addProperty("pj_simg", vo.getPj_simg());
			obj.addProperty("name", vo.getName());
			obj.addProperty("project_status", vo.getProject_status());
			obj.addProperty("payment_status", vo.getPayment_status());
			obj.addProperty("funding_date", vo.getFunding_date());
			obj.addProperty("total_funding_price", vo.getTotal_funding_price());
			jarr.add(obj);
		}
		
		JsonObject data = new JsonObject();
		data.add("flist", jarr);
		
		return gson.toJson(data);
	}
	
	/**
	 * 후원현황 상세
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/myfunding/detail/{funding_id}")
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
		mv.addObject("fvo", fvo);
		mv.addObject("pvo", projectDAO.getContent(pj_id));
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		return mv;
	}
	
	/**
	 * 선택한 선물 리스트
	 * @param funding_id
	 * @return
	 */
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
	 * 선물 변경 처리
	 * @param funding_id
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/edit_gift_proc", method=RequestMethod.POST)
	public String edit_gift_proc(FundingVO vo) {
		String resPage = "";
		
		//변경할 선물 리스트
		List<FundingGiftVO> list = (ArrayList<FundingGiftVO>)vo.getGiftList();
		
		for(int i=list.size(); i>0; i--) {
			FundingGiftVO fgvo = list.get(i-1);
			
			if(StringUtils.hasLength(fgvo.getSelect_yn())) {
				fgvo.setItemList(projectDAO.getItemList(fgvo.getGift_id()));
				
				int funding_gift_price = Integer.parseInt(fgvo.getGift_price().replace(",", "").replace(" ", "")) * fgvo.getGift_quantity();
				list.get(i-1).setFunding_gift_price(String.valueOf(funding_gift_price));
			} else {
				list.remove(i-1);
			}
		}
		
		vo.setGiftList(list);
		
		//DB 연동
		if(fundingDAO.getFundingUpdateResult(vo) != 0) {
			resPage = "redirect:/myfunding/detail/" + vo.getFunding_id();
		} else {
			//에러페이지
		}
		
		return resPage;
	}
	
	/**
	 * 결제 수단 변경 화면
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/myfunding/{funding_id}/edit_payment")
	public ModelAndView funding_edit_payment(@PathVariable("funding_id") String funding_id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		FundingVO fvo = fundingDAO.getFundingDetail(funding_id);
		String email = (String)session.getAttribute("semail");
		
		mv.setViewName("/mypage/myfunding_edit_payment");
		mv.addObject("edit_menu", "edit_payment");
		mv.addObject("funding_id", funding_id);
		mv.addObject("paymentList", paymentDAO.getPaymentList(email));
		mv.addObject("pvo", projectDAO.getContent(fvo.getPj_id()));
		
		return mv;
	}
	
	/**
	 * 결제 수단 변경 처리
	 * @param funding_id
	 * @param payment_id
	 * @return
	 */
	@RequestMapping(value="/edit_payment_proc", method=RequestMethod.GET)
	@ResponseBody
	public String edit_payment_proc(String funding_id, String payment_id) {
		String payment_info = paymentDAO.getPaymentInfo(payment_id);
		return String.valueOf(fundingDAO.getPaymentUpdateResult(funding_id, payment_id, payment_info));
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
