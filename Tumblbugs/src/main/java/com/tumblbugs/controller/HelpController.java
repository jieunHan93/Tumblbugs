package com.tumblbugs.controller;

import java.io.File;
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
import com.tumblbugs.dao.FaqDAO;
import com.tumblbugs.dao.QuestionDAO;
import com.tumblbugs.util.BeforeTimeUtil;
import com.tumblbugs.vo.FaqVO;
import com.tumblbugs.vo.QuestionVO;

@Controller
public class HelpController {
	
	@Autowired
	private FaqDAO faqDao;
	
	@Autowired
	private QuestionDAO quesDao;
	
	/** 헬프센터 메인 **/
	@RequestMapping(value="/help", method=RequestMethod.GET)
	public ModelAndView help() {
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<FaqVO> flist = faqDao.getFrequentList();
	
		mv.addObject("flist", flist);
		mv.setViewName("/helpCenter/helpCenter");
		return mv;
	}
	/** 1:1 문의 페이지 **/
	@RequestMapping(value="/help/helpq", method=RequestMethod.GET)
	public ModelAndView helpQuestion() {
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<FaqVO> flist = faqDao.getFrequentList();
		mv.addObject("flist", flist);
		mv.setViewName("/helpCenter/helpQuestion");
		return mv;
	}
	/** 1:1 문의(후원자) **/
	@RequestMapping(value="/help/helpq/spon1", method=RequestMethod.GET)
	public ModelAndView helpQuestion_spon1() {
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<FaqVO> flist = faqDao.getFrequentList();
		mv.addObject("flist", flist);
		mv.setViewName("/helpCenter/helpQuestion_spon1");
		return mv;
	}
	@RequestMapping(value="/help/spon1_proc", method=RequestMethod.POST)
	public String helpQuestion_spon1_proc(QuestionVO vo, HttpServletRequest request) throws Exception{
		
		System.out.println(vo.getQuestion_category());
		System.out.println(vo.getQuestion_email());
		String root_path = "";
		String attach_path = "";
		String qsfile = "";
		String resPage = "";
		boolean result = false;
		
		if(vo.getQuestion_qcfile().getOriginalFilename() != null && vo.getQuestion_qcfile().getOriginalFilename() != ""){
			//bfile, bsfile 생성
			//파일 존재
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\upload\\";
			
			//중복방지 처리
			UUID uuid = UUID.randomUUID();
			String qfile = vo.getQuestion_qcfile().getOriginalFilename();
			qsfile = uuid +"_"+vo.getQuestion_qcfile().getOriginalFilename();
			// 넘어올때 먼저 저장하지 않기 때문에 따로 만들어 줘야함
			//System.out.println("bfile="+qfile); // db에 들어가는 bfile
			//System.out.println("bsfile="+qsfile); // db에 들어가는 bsfile
			
			//db연동을 위한 파일명 set
			vo.setQuestion_qfile(qfile); // 이것을 해주기 위함, 중요
			vo.setQuestion_qsfile(qsfile);
			result = quesDao.getResultWrite(vo);
		}
		
		if(result) {
			if(vo.getQuestion_qcfile().getOriginalFilename() != null && vo.getQuestion_qcfile().getOriginalFilename() != ""){
			//upload 폴더에 파일 저장
			//System.out.println(root_path + attach_path + bsfile);
			String upload_path = root_path + attach_path + qsfile;
			
			File file = new File(upload_path);
			vo.getQuestion_qcfile().transferTo(file);
			}
			resPage = "redirect:/help/helpq";
		}else {
			result = quesDao.getResultWriteNofile(vo);
			resPage = "redirect:/help/helpq";
		}
		return resPage;
	}
	@RequestMapping(value="/help/helpq/spon2", method=RequestMethod.GET)
	public String helpQuestion_spon2() {
		return "/helpCenter/helpQuestion_spon2";
	}
	/** 1:1 문의(창작자) **/
	@RequestMapping(value="/help/helpq/create1", method=RequestMethod.GET)
	public String helpQuestion_create1() {
		return "/helpCenter/helpQuestion_create1";
	}
	@RequestMapping(value="/help/helpq/create2", method=RequestMethod.GET)
	public String helpQuestion_create2() {
		return "/helpCenter/helpQuestion_create2";
	}
	/** 1:1 문의(일반) **/
	@RequestMapping(value="/help/helpq/common1", method=RequestMethod.GET)
	public String helpQuestion_common1() {
		return "/helpCenter/helpQuestion_common1";
	}
	@RequestMapping(value="/help/helpq/common2", method=RequestMethod.GET)
	public String helpQuestion_common2() {
		return "/helpCenter/helpQuestion_common2";
	}
	@RequestMapping(value="/help/helpq/common3", method=RequestMethod.GET)
	public String helpQuestion_common3() {
		return "/helpCenter/helpQuestion_common3";
	}
	/** 후원자 센터 메인 **/
	@RequestMapping(value="/help/sponcenter", method=RequestMethod.GET)
	public ModelAndView sponcenter() {
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<FaqVO> slist_1 = faqDao.getSponCenterList_1();
		ArrayList<FaqVO> slist_2 = faqDao.getSponCenterList_2();
		ArrayList<FaqVO> slist_3 = faqDao.getSponCenterList_3();
		ArrayList<FaqVO> slist_4 = faqDao.getSponCenterList_4();
		int sponCount1 = faqDao.spon_1_TotalCount();
		int sponCount2 = faqDao.spon_2_TotalCount();
		
		mv.addObject("sponCount1", sponCount1);
		mv.addObject("sponCount2", sponCount2);
		mv.addObject("slist_1", slist_1);
		mv.addObject("slist_2", slist_2);
		mv.addObject("slist_3", slist_3);
		mv.addObject("slist_4", slist_4);
		mv.setViewName("/helpCenter/helpSponCenter");
		return mv;
	}
	
	/** 창작자 센터 메인 **/
	@RequestMapping(value="/help/createcenter", method=RequestMethod.GET)
	public ModelAndView createcenter() {
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<FaqVO> clist_1 = faqDao.getCreateCenterList_1();
		ArrayList<FaqVO> clist_2 = faqDao.getCreateCenterList_2();
		ArrayList<FaqVO> clist_3 = faqDao.getCreateCenterList_3();
		ArrayList<FaqVO> clist_4 = faqDao.getCreateCenterList_4();
		ArrayList<FaqVO> clist_5 = faqDao.getCreateCenterList_5();
		int createCount1 = faqDao.create_1_TotalCount();
		int createCount2 = faqDao.create_2_TotalCount();
		int createCount3 = faqDao.create_3_TotalCount();
		int createCount4 = faqDao.create_4_TotalCount();
		
		mv.addObject("clist_1", clist_1);
		mv.addObject("clist_2", clist_2);
		mv.addObject("clist_3", clist_3);
		mv.addObject("clist_4", clist_4);
		mv.addObject("clist_5", clist_5);
		mv.addObject("createCount1", createCount1);
		mv.addObject("createCount2", createCount2);
		mv.addObject("createCount3", createCount3);
		mv.addObject("createCount4", createCount4);
		mv.setViewName("/helpCenter/helpCreateCenter");
		return mv;
	}
	
	/** 일반 센터 메인 **/
	@RequestMapping(value="/help/commoncenter", method=RequestMethod.GET)
	public ModelAndView commoncenter() {
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<FaqVO> colist_1 = faqDao.getCommonCenterList_1();
		ArrayList<FaqVO> colist_2 = faqDao.getCommonCenterList_2();
		int commonCount1 = faqDao.common_1_TotalCount();
		
		mv.addObject("colist_1", colist_1);
		mv.addObject("colist_2", colist_2);
		mv.addObject("commonCount1", commonCount1);
		mv.setViewName("/helpCenter/helpCommonCenter");
		return mv;
	}
	
	/** 후원자 센터(1. 후원하기) **/
	@RequestMapping(value="/help/sponcenter/a1", method=RequestMethod.GET)
	public ModelAndView sponcenter_a1() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<FaqVO> list = faqDao.getSponCenterList_1();
		
		mv.addObject("list",list);
		mv.setViewName("/helpCenter/helpSponCenter_article1");
		return mv;
	}
	@RequestMapping(value="/help/sponcenter/a2", method=RequestMethod.GET)
	public String sponcenter_a2() {
		return "/helpCenter/helpSponCenter_article2";
	}
	@RequestMapping(value="/help/sponcenter/a3", method=RequestMethod.GET)
	public String sponcenter_a3() {
		return "/helpCenter/helpSponCenter_article3";
	}
	@RequestMapping(value="/help/sponcenter/a4", method=RequestMethod.GET)
	public String sponcenter_a4() {
		return "/helpCenter/helpSponCenter_article4";
	}
	@RequestMapping(value="/help/createcenter/a1", method=RequestMethod.GET)
	public String createcenter_a1() {
		return "/helpCenter/helpCreateCenter_article1";
	}
	@RequestMapping(value="/help/createcenter/a2", method=RequestMethod.GET)
	public String createcenter_a2() {
		return "/helpCenter/helpCreateCenter_article2";
	}
	@RequestMapping(value="/help/createcenter/a3", method=RequestMethod.GET)
	public String createcenter_a3() {
		return "/helpCenter/helpCreateCenter_article3";
	}
	@RequestMapping(value="/help/createcenter/a4", method=RequestMethod.GET)
	public String createcenter_a4() {
		return "/helpCenter/helpCreateCenter_article4";
	}
	@RequestMapping(value="/help/createcenter/a5", method=RequestMethod.GET)
	public String createcenter_a5() {
		return "/helpCenter/helpCreateCenter_article5";
	}
	@RequestMapping(value="/help/commoncenter/a1", method=RequestMethod.GET)
	public String commoncenter_a1() {
		return "/helpCenter/helpCommonCenter_article1";
	}
	@RequestMapping(value="/help/commoncenter/a2", method=RequestMethod.GET)
	public String commoncenter_a2() {
		return "/helpCenter/helpCommonCenter_article2";
	}
	/** 후원자 센터(1. 후원하기) - 상세페이지 **/
	@RequestMapping(value="/help/sponcenter/a1/c1", method=RequestMethod.GET)
	public ModelAndView commoncenter_a1_c1() {
		ModelAndView mv = new ModelAndView();
		ArrayList<FaqVO> list = faqDao.getSponCenterList_1();

		mv.addObject("list", list);
		mv.setViewName("/helpCenter/helpSponCenter_article1_content1");
		return mv;
	}
	
	/** 후원자 센터(1. 후원하기) - 상세페이지 ajax 
	 * @throws Exception **/
	@RequestMapping(value="/help/sponcenter/ajax", method=RequestMethod.GET,produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String commoncenter_a1_c1_ajax(String faq_num) throws Exception {
		
		ArrayList<FaqVO> list = faqDao.getResultContent(faq_num);
		System.out.println(list);
		BeforeTimeUtil util = new BeforeTimeUtil();
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(FaqVO vo : list) {
			JsonObject obj = new JsonObject();
			
			obj.addProperty("faq_list_title", vo.getFaq_list_title());
			obj.addProperty("reg_date", util.beforeTime(vo.getReg_date()));
			obj.addProperty("faq_content", vo.getFaq_content());
			System.out.println(vo.getFaq_list_title());
			jlist.add(obj);
		}
		
		jdata.add("list", jlist);
		return String.valueOf(gson.toJson(jdata));
	}
	@RequestMapping(value="/help/sponcenter/a1/c2", method=RequestMethod.GET)
	public String commoncenter_a1_c2() {
		return "/helpCenter/helpSponCenter_article1_content2";
	}
	/** 검색결과 화면 **/
	@RequestMapping(value="/help/helpsearch", method=RequestMethod.GET)
	public String helpsearch() {
		return "/helpCenter/helpSearch";
	}
}
