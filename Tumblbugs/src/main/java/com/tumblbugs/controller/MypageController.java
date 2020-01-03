package com.tumblbugs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.MyProjectDAO;
import com.tumblbugs.dao.MypageDAO;
import com.tumblbugs.dao.PaymentDAO;
import com.tumblbugs.dao.RegDAO;
import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.PaymentVO;
import com.tumblbugs.vo.ProjectVO;
import com.tumblbugs.vo.SessionVO;

@Controller
public class MypageController {
	@Autowired
	MypageDAO mypagedao;
	
	@Autowired
	private MyProjectDAO mypjDAO;
	
	@Autowired
	private RegDAO memberDAO;
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	/**
	 * ������ ���� ȭ��
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/mypage/profile", method=RequestMethod.GET)
	public ModelAndView profile(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//�α����� user�� ������ �����ͼ� ModelAndView ��� �ѱ��
		/*SessionVO svo = (SessionVO)session.getAttribute("svo");
		String email = svo.getEmail();
		MemberVO mvo = mypagedao.getProfile(email);
		System.out.println(svo.getEmail());
		
		mv.addObject("vo",mvo);*/
		
		
		//�α��� ���� �̸���
		String email = (String)session.getAttribute("semail");
		MemberVO mvo = memberDAO.getMemberInfo(email);
		
		mv.setViewName("/mypage/profile_update");
		mv.addObject("mvo", mvo);
		
		return mv;
	}
	
	
	/**
	 * ������ ���� ó��
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/profile_proc", method=RequestMethod.POST)
	public ModelAndView profile_proc(MemberVO vo, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/profile_update");
		
		int updateResult = 0;
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "\\resources\\upload\\";
		String uploadPath = "";
		
		String deleteFile = memberDAO.getProfile_simg(vo.getEmail());
		
		//������ ���� ������Ʈ Ȯ��
		if(vo.getProfile_cimg().getOriginalFilename() != null && vo.getProfile_cimg().getOriginalFilename() != "") {
			
			UUID uuid = UUID.randomUUID();
			
			String profile_img = vo.getProfile_cimg().getOriginalFilename();
			String profile_simg = uuid + "_" + profile_img;	
			vo.setProfile_img(profile_img);
			vo.setProfile_simg(profile_simg);
			
			uploadPath = rootPath + attachPath + profile_simg;
			updateResult = memberDAO.getProfileUpdate(vo);
		} else {
			updateResult = memberDAO.getProfileUpdateNofile(vo);
		}
		
		
		if(updateResult != 0) {
			//���� ����
			if(vo.getProfile_cimg().getOriginalFilename() != null && vo.getProfile_cimg().getOriginalFilename() != "") {
				File file = new File(uploadPath);
				vo.getProfile_cimg().transferTo(file);
				
				//���� ���� ����
				if(deleteFile != null && deleteFile != "") {
					File dfile = new File(rootPath + attachPath + deleteFile);
					
					if(dfile.exists()) {
						dfile.delete();
					}
				}
			}
			
			//������Ʈ ����
			mv.addObject("updateResult", "success");
			SessionVO svo = memberDAO.getSessionVO(vo);
			session.setAttribute("svo", svo);
		} else {
			//������Ʈ ����
			mv.addObject("updateResult", "fail");
		}
		
		MemberVO mvo = memberDAO.getMemberInfo(vo.getEmail());
		mv.addObject("mvo", mvo);
		
		return mv;
	}
	
	
	/**
	 * ���� ��й�ȣ ��ġ Ȯ��
	 * @param pass
	 * @param session
	 * @return
	 */
	@ResponseBody	
	@RequestMapping(value="/mypage/select_profile_pass", method=RequestMethod.GET)
	public String mypage_pass_chk(String pass, HttpSession session) {
		/*SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		System.out.println(svo.getEmail()+"=controll_email");
		System.out.println("controll_pass="+pass);
		
		
		int result = mypagedao.getmypage_pass_chk(pass,svo.getEmail());*/
		
		String email = (String)session.getAttribute("semail");
		int result = memberDAO.getPassCheckResult(email, pass);
		
		return String.valueOf(result);
		
	}
	
	/**
	 * �������� ����Ʈ ȭ��
	 * @param session
	 * @param rpage
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/mypage/payment", method=RequestMethod.GET)
	public ModelAndView payment(HttpSession session ,String rpage ,PaymentVO vo) {
		ModelAndView mv = new ModelAndView();
		String email = (String)session.getAttribute("semail");

		mv.setViewName("/mypage/payment");
		mv.addObject("paymentList", paymentDAO.getPaymentList(email));
		
		return mv;
	}
	
	/**
	 * ���� ���� ���
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/payment_insert_proc", method=RequestMethod.POST)
	public String payment_insert_proc(PaymentVO vo) {
		mypagedao.getpayment_insert(vo);
		return "redirect:/mypage/payment";
	}
	
	/**
	 * �����Ϸ��� ���� ������ ����� �Ŀ� �� Ȯ��
	 * @param payment_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/payment_delete_check", method=RequestMethod.GET)
	public String payment_delete_check(String payment_id) {
		int result = paymentDAO.paymentDeleteCheck(payment_id);
		return String.valueOf(result);
	}
	
	/**
	 * ���� ���� ����
	 * @param pid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/payment_delete_proc", method=RequestMethod.GET)
	public String payment_delete_proc(String pid) {
		int result = mypagedao.getpayment_delete(pid);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/projects/{member_id}", method=RequestMethod.GET)
	public ModelAndView myproject(@PathVariable("member_id") String member_id, String page, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = mypjDAO.getMyProfile(member_id);
		ArrayList<ProjectVO> list = new ArrayList<ProjectVO>();
		int pj_count = 0;
		String myListYn = "n";
		if(session.getAttribute("semail") != null && session.getAttribute("semail").equals(mvo.getEmail())) {
			myListYn = "y";
		}
		
		/** ����¡ ó�� **/
		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 6;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = mypjDAO.execTotalCount(mvo.getEmail(), myListYn);	//DB���� ������ ��ü ���
		
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
			endCount = 6;
		}
		
		pj_count = mypjDAO.getProjectCount(mvo.getEmail(), myListYn);
		list = mypjDAO.getProjectList(mvo.getEmail(), startCount, endCount, myListYn);
		
		mv.addObject("mvo", mvo);
		mv.addObject("pj_count", pj_count);
		mv.addObject("list", list);
		mv.addObject("dbcount", dbCount);
		mv.addObject("page", reqPage);
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
	
/*	*//** project update - pj_id session�� ��� **//*
	@RequestMapping(value="/update_project_page", method=RequestMethod.GET)
	@ResponseBody
	public void update_project_page(String pj_id, HttpSession session) {
		session.setAttribute("pj_id", pj_id);
	}*/
	

}
