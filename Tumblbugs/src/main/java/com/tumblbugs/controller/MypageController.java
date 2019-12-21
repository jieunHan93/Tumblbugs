package com.tumblbugs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.tumblbugs.dao.FundingDAO;
import com.tumblbugs.dao.MyProjectDAO;
import com.tumblbugs.dao.MypageDAO;
import com.tumblbugs.dao.ProjectDAO;
import com.tumblbugs.vo.FundingVO;
import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.PaymentVO;
import com.tumblbugs.vo.ProjectVO;

@Controller
public class MypageController {
	@Autowired
	MypageDAO mypagedao;
	
	@Autowired
	private FundingDAO fundingDAO;
	@Autowired
	private MyProjectDAO mypjDAO;
	@Autowired
	private ProjectDAO projectDAO;
	
	@RequestMapping(value="/mypage/profile", method=RequestMethod.GET)
	public String profil() {
		return "/mypage/profile_update";
	}
	
	@RequestMapping(value="/profile_proc", method=RequestMethod.POST)
	public String profile_proc(MemberVO vo) {
		
		ModelAndView mv = new ModelAndView();
		mypagedao.getupdate_profile(vo);
		mv.setViewName("/profile_proc");
		return "/index";
	}
	
	@ResponseBody	
	@RequestMapping(value="/mypage/select_profile_pass", method=RequestMethod.GET)
	public String select_profile_pass(String pass) {
		System.out.println("pass="+pass);
		int result = mypagedao.getselect_profile_pass(pass);	
		return String.valueOf(result);
		
	}
	
	@RequestMapping(value="/mypage/payment", method=RequestMethod.GET)
	public ModelAndView payment(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String)session.getAttribute("semail");
		
		if(sid != null) {
		int count = mypagedao.totalcount();
		ArrayList<PaymentVO> payment_info = mypagedao.payment_info();
		
			mv.addObject("payment_info",payment_info);
			mv.addObject("count",count);
			mv.addObject("semail",sid);
			mv.setViewName("/mypage/payment");
		}else {
			mv.setViewName("/index");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/payment_update_proc", method=RequestMethod.POST)
	public String payment_update_proc(PaymentVO vo) {


		mypagedao.getpayment_update(vo);
		return "/mypage/payment_proc";
	}


	/**
	 * �� �Ŀ���Ȳ ����Ʈ ȭ��
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/myfunding", method=RequestMethod.GET)
	public ModelAndView funding(HttpSession session, String cancelResult, String page, String category, String search) {
		ModelAndView mv = new ModelAndView();
		String email = (String)session.getAttribute("semail");
		
		email = "semibold@naver.com";
		
		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = fundingDAO.execTotalCount(email, category, search);	//DB���� ������ ��ü ���
		
		//�� ������ �� ���
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//��û ������ ���
		if(page != null){
			reqPage = Integer.parseInt(page);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}
		
		ArrayList<FundingVO> list = fundingDAO.getFundingList("semibold@naver.com", category, search, startCount, endCount);
		
		mv.setViewName("/mypage/myfunding");
		mv.addObject("member", mypagedao.getProfile(email));
		mv.addObject("fundingCount", fundingDAO.getFundingCount(email));
		mv.addObject("cancelResult", cancelResult);
		
		mv.addObject("page", reqPage);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("flist", list);
		if(category != null) mv.addObject("category", category);
		if(search != null) mv.addObject("search", search);
		
		return mv;
	}
	
	@RequestMapping(value="/funding_list", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String funding_list(HttpSession session, String category, String search) {
		ArrayList<FundingVO> list = fundingDAO.getFundingList("semibold@naver.com", category, search, 1, 5);	//���߿� ���� ������ ����
		
		Gson gson = new Gson();
		JsonArray jarr = new JsonArray();
		
		for(FundingVO vo:list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("funding_id", vo.getFunding_id());
			obj.addProperty("pj_title", vo.getPj_title());
			obj.addProperty("pj_simg", vo.getPj_simg());
			obj.addProperty("name", vo.getName());
			obj.addProperty("funding_date", vo.getFunding_date());
			obj.addProperty("total_funding_price", vo.getTotal_funding_price());
			
			if(Integer.parseInt(vo.getRemaining_days()) >= 0) {
				obj.addProperty("project_status", "�ݵ� ������");
			} else {
				if(vo.getAchievement_rate() >= 100) {
					obj.addProperty("project_status", "�ݵ� ����");
				} else {
					obj.addProperty("project_status", "����");
				}
			}
			
			if(vo.getPayment_complete_yn().equals("n")) {
				obj.addProperty("payment_status", "�̰���");
			} else {
				obj.addProperty("payment_status", "���� �Ϸ�");
			}
			
			jarr.add(obj);
		}
		
		JsonObject obj = new JsonObject();
		obj.add("flist", jarr);
		
		return gson.toJson(obj);
	}
	
	/**
	 * �Ŀ���Ȳ ��
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/myfunding/detail", method=RequestMethod.GET)
	public ModelAndView funding_detail(String funding_id) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/mypage/myfunding_detail");
		mv.addObject("fvo", fundingDAO.getFundingDetail(funding_id));
		mv.addObject("giftList", fundingDAO.getFundingGiftList(funding_id));
		
		return mv;
	}
	
	/**
	 * �Ŀ���Ȳ > ��� ���� ����(ajax)
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
	 * �Ŀ���Ȳ ���� �����ϱ� ȭ��
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/myfunding/edit_gift", method=RequestMethod.GET)
	public ModelAndView funding_edit_reward(String funding_id, String pj_id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/myfunding_edit");
		mv.addObject("edit_menu", "gift_select");
		mv.addObject("fundingGiftList", fundingDAO.getFundingGiftList(funding_id));
		mv.addObject("pvo", projectDAO.getContent(pj_id));
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		return mv;
	}
	
	@RequestMapping(value="/myfunding/edit_payment", method=RequestMethod.GET)
	public ModelAndView funding_edit_payment(String funding_id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/myfunding_edit");
		mv.addObject("edit_menu", "payment_edit");
		return mv;
	}
	@RequestMapping(value="/myfunding/cancel_funding", method=RequestMethod.GET)
	public ModelAndView funding_cancel(String funding_id, String pj_id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/myfunding_edit");
		mv.addObject("edit_menu", "funding_cancel");
		mv.addObject("pvo", projectDAO.getContent(pj_id));
		mv.addObject("funding_id", funding_id);
		return mv;
	}
	
	/**
	 * �Ŀ� ��� ó��(ajax)
	 * @param funding_id
	 * @return
	 */
	@RequestMapping(value="/funding_cancel_proc", method=RequestMethod.GET)
	@ResponseBody
	public String funding_cancel_proc(String funding_id) {
		return String.valueOf(fundingDAO.getFundingCancelResult(funding_id));
	}
	
	@RequestMapping(value="/myproject", method=RequestMethod.GET)
	public ModelAndView myproject(String rpage) {
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = new MemberVO();
		ArrayList<ProjectVO> list = new ArrayList<ProjectVO>();
		String email = "yappihan@naver.com";
		int pj_count = 0;
		
		/** ����¡ ó�� **/
		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 6;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = mypjDAO.execTotalCount(email);	//DB���� ������ ��ü ���
		
		//�� ������ �� ���
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//��û ������ ���
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 6;
		}

		mvo = mypjDAO.getMyProfile(email);
		pj_count = mypjDAO.getProjectCount(email);
		list = mypjDAO.getProjectList(email, startCount, endCount);
		
		mv.addObject("mvo", mvo);
		mv.addObject("pj_count", pj_count);
		mv.addObject("list", list);
		mv.addObject("dbcount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("pagesize", pageSize);
		mv.setViewName("/mypage/myproject");
		
		return mv;
	}
	
	/** project delete **/
	@RequestMapping(value="/delete_project_proc", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String delete_project_proc(String pj_id) {
		String res ="";
		ProjectVO vo = new ProjectVO();

		vo =  mypjDAO.getProjectCheck(pj_id);

		if(vo.getPj_check_yn().equals("n") || vo.getPj_check_yn().equals("c")) {
			res = mypjDAO.deleteProject(pj_id);
			

		}else if(vo.getPj_check_yn().equals("y") && Double.valueOf((vo.getPj_start_date())) >= 0) {
			res = mypjDAO.deleteProject(pj_id);
		}else {
			res = "�̹� ���۵� ������Ʈ�� ������ �� �����ϴ�!";
		}

		return res;
	}
	
	/** project update - pj_id session�� ��� **/
	@RequestMapping(value="/update_project_page", method=RequestMethod.GET)
	@ResponseBody
	public void update_project_page(String pj_id, HttpSession session) {
		session.setAttribute("pj_id", pj_id);
	}
	
	@RequestMapping(value="/myproject/delivery", method=RequestMethod.GET)
	public ModelAndView myproject_delivery() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/myproject_delivery");
		return mv;
	}
}
