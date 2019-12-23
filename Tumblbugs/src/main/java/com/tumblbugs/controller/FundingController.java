package com.tumblbugs.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.dao.FundingDAO;
import com.tumblbugs.dao.PaymentDAO;
import com.tumblbugs.dao.ProjectDAO;
import com.tumblbugs.vo.FundingGiftVO;
import com.tumblbugs.vo.FundingVO;
import com.tumblbugs.vo.PaymentVO;

@Controller
public class FundingController {
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	@Autowired
	private FundingDAO fundingDAO;
	
	/**
	 * ���� ���� �� �߰� �Ŀ��� �Է� ȭ��
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
	 * ���� ���� ȭ��
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/{pj_addr}/funding/step2", method=RequestMethod.POST)
	public ModelAndView step2(@PathVariable("pj_addr") String pj_addr, FundingVO vo) {
		ModelAndView mv = new ModelAndView();
		
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
		mv.addObject("paymentList", paymentDAO.getPaymentList(vo.getEmail()));	//�������� ����Ʈ
		mv.addObject("recentDeliveryInfo", fundingDAO.getRecentDeliveryInfo(vo.getEmail()));	//�ֱ� �����
		
		return mv;
	}
	
	/**
	 * �ݵ� DB ����
	 * @param vo
	 * @param pvo
	 * @return
	 */
	@RequestMapping(value="/{pj_addr}/funding/complete", method=RequestMethod.POST)
	public ModelAndView step3(@PathVariable("pj_addr") String pj_addr, FundingVO vo, PaymentVO pvo) {
		
		ModelAndView mv = new ModelAndView();
		
		//�ű� ���� ���� ���
		if(!pvo.getPayment_method().equals("")) {
			int result = paymentDAO.regist(pvo);
			
			if(result != 0) {
				String payment_id = paymentDAO.getNewPaymentId(vo.getEmail());
				vo.setPayment_id(payment_id);
			}
		}
		
		//�ݵ� ���: tum_funding
		if(fundingDAO.fundingInsert(vo)) {
			mv.setViewName("/funding/step3_funding_success");
		} else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
}
