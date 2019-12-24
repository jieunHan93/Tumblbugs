package com.tumblbugs.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.FundingDAO;
import com.tumblbugs.dao.MyProjectDAO;
import com.tumblbugs.dao.MypageDAO;
import com.tumblbugs.dao.ProjectDAO;
import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.PaymentVO;
import com.tumblbugs.vo.ProjectVO;
import com.tumblbugs.vo.SessionVO;

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
	public String mypage_pass_chk(String pass,HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		System.out.println(svo.getEmail()+"=controll_email");
		System.out.println("controll_pass="+pass);
		
		
		int result = mypagedao.getmypage_pass_chk(pass,svo.getEmail());
		
		return String.valueOf(result);
		
	}
	
	@RequestMapping(value="/mypage/payment", method=RequestMethod.GET)
	public ModelAndView payment(HttpSession session ,String rpage ,PaymentVO vo) {
		ModelAndView mv = new ModelAndView();
		String email = (String)session.getAttribute("semail");
		
		/** 페이징 처리 **/
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 2;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = mypagedao.totalcount();	//DB에서 가져온 전체 행수
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}


		
		
		if(email != null) {
		/*int count = mypagedao.totalcount();*/
		
		ArrayList<PaymentVO> payment_info = mypagedao.payment_info(startCount,endCount,email);

			mv.addObject("rpage", rpage);
			mv.addObject("payment_info",payment_info);
			mv.addObject("dbCount",dbCount);
			mv.addObject("pageSize",pageSize);
			mv.addObject("semail",email);
			mv.setViewName("/mypage/payment");
		}else {
			mv.setViewName("/index");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/payment_insert_proc", method=RequestMethod.POST)
	public String payment_insert_proc(PaymentVO vo) {
		System.out.println(vo.getCard_number()+"vo");
		mypagedao.getpayment_insert(vo);
		return "/index";
	}
	
	/**
	 * 다른 회원이 만든 프로젝트 리스트 보기
	 * @param email
	 * @param rpage
	 * @return
	 */
	@RequestMapping(value="/projects/{email}", method=RequestMethod.GET)
	public ModelAndView myproject(String page, HttpServletRequest request) {
		String email = request.getRequestURI().replace("/tumblbugs/projects/", "");
		
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = new MemberVO();
		ArrayList<ProjectVO> list = new ArrayList<ProjectVO>();
		int pj_count = 0;
		
		/** 페이징 처리 **/
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 6;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = mypjDAO.execTotalCount(email);	//DB에서 가져온 전체 행수
		
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
			endCount = 6;
		}

		mvo = mypjDAO.getMyProfile(email);
		pj_count = mypjDAO.getProjectCount(email);
		list = mypjDAO.getProjectList(email, startCount, endCount);
		
		mv.addObject("mvo", mvo);
		mv.addObject("pj_count", pj_count);
		mv.addObject("list", list);
		mv.addObject("dbcount", dbCount);
		mv.addObject("page", reqPage);
		mv.addObject("pagesize", pageSize);
		mv.setViewName("/mypage/member_project_list");
		
		return mv;
	}
	
	
	@RequestMapping(value="/myproject", method=RequestMethod.GET)
	public ModelAndView myproject(String rpage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = new MemberVO();
		ArrayList<ProjectVO> list = new ArrayList<ProjectVO>();
		
		String email = (String)session.getAttribute("semail");
		int pj_count = 0;
		
		/** 페이징 처리 **/
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 6;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = mypjDAO.execTotalCount(email);	//DB에서 가져온 전체 행수
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
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
			res = "이미 시작된 프로젝트는 삭제할 수 없습니다!";
		}

		return res;
	}
	
	/** project update - pj_id session에 등록 **/
	@RequestMapping(value="/update_project_page", method=RequestMethod.GET)
	@ResponseBody
	public void update_project_page(String pj_id, HttpSession session) {
		session.setAttribute("pj_id", pj_id);
	}
	

}
