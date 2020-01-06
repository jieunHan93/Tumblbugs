package com.tumblbugs.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.tumblbugs.dao.ProjectBillDAO;
import com.tumblbugs.dao.ProjectDAO;
import com.tumblbugs.vo.EmailVO;
import com.tumblbugs.vo.ProjectBillVO;

@Controller
public class AdminProjectController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private ProjectBillDAO billDAO;
	
	/**
	 * ������Ʈ ���� ����ȭ��
	 * @return
	 */
	@RequestMapping(value="/admin/projects", method=RequestMethod.GET)
	public ModelAndView admin_project() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_project");
		mv.addObject("list", projectDAO.getAdminList("all"));
		mv.addObject("adminProjectCount", projectDAO.getAdminProjectCount());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/projects/{category}", method=RequestMethod.GET)
	public ModelAndView admin_project_list(@PathVariable("category") String category) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_project");
		mv.addObject("list", projectDAO.getAdminList(category));
		mv.addObject("category", category);
		mv.addObject("adminProjectCount", projectDAO.getAdminProjectCount());
		
		return mv;
	}
	
	/**
	 * ���꼭 ������
	 * @param pj_id
	 * @return
	 */
	@RequestMapping(value="/admin/project/bill/{pj_id}", method=RequestMethod.GET)
	@ResponseBody
	public String project_bill(@PathVariable("pj_id") String pj_id) {
		Gson gson = new Gson();
		JsonObject obj = new JsonObject();
		
		//tum_project_bill ���̺� �����Ͱ� ������
		String bill_id = billDAO.getBill_id(pj_id);
		
		ProjectBillVO bvo = new ProjectBillVO();
		
		if(bill_id != null) {
			bvo = billDAO.getBill(bill_id);
		} else {
			bvo = billDAO.getBillFromFundingTable(pj_id);
		}
		
		obj.addProperty("bill_id", bvo.getBill_id());
		obj.addProperty("pj_id", pj_id);
		obj.addProperty("total_pay_price", bvo.getTotal_pay_price());
		obj.addProperty("card_pay_price", bvo.getCard_pay_price());
		obj.addProperty("card_sponsor_count", bvo.getCard_sponsor_count());
		obj.addProperty("account_pay_price", bvo.getAccount_pay_price());
		obj.addProperty("account_sponsor_count", bvo.getAccount_sponsor_count());
		obj.addProperty("total_comm", bvo.getTotal_comm());
		obj.addProperty("tumblbugs_comm", bvo.getTumblbugs_comm());
		obj.addProperty("pay_comm", bvo.getPay_comm());
		obj.addProperty("card_comm", bvo.getPay_comm());
		obj.addProperty("account_comm", bvo.getAccount_comm());
		obj.addProperty("transfer_comm", bvo.getTransfer_comm());
		obj.addProperty("total_receipts", bvo.getTotal_receipts());
		
		return gson.toJson(obj);
	}
	
	/**
	 * ���� ó��
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/bill_proc", method=RequestMethod.POST)
	@ResponseBody
	public String bill_proc(ProjectBillVO vo) {
		int result = billDAO.insert(vo);
		return String.valueOf(result);
	}
	
	/**
	 * ������Ʈ �� ���� ȭ��
	 * @return
	 */
	@RequestMapping(value="/admin/project/{pj_id}", method=RequestMethod.GET)
	public ModelAndView admin_project_detail(@PathVariable("pj_id") String pj_id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_project_detail");
		mv.addObject("vo", projectDAO.getAdminContent(pj_id));
		mv.addObject("giftList", projectDAO.getGiftList(pj_id));
		
		return mv;
	}

	/**
	 * ������Ʈ �˼� �������� > ���� �纻 �̹��� �ٿ�ε�
	 * @param pj_id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/admin/fileDownload", method=RequestMethod.GET)
	public ModelAndView fileDownload(String pj_id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		String bfile = "admin_profile.jpg";
		String bsfile = "admin_profile.jpg";
		String file_path = request.getSession().getServletContext().getRealPath("/") + "\\resources\\upload\\" + bsfile;
		File file = new File(file_path);
		
		mv.setViewName("imageDownload");
		mv.addObject("downloadFileName", bfile);
		mv.addObject("file", file);
		
		return mv;
	}

	/**
	 * ������Ʈ ���� ó��
	 * @param pj_id
	 * @return
	 */
	@RequestMapping(value="/admin/project_check_proc", method=RequestMethod.GET)
	public ModelAndView project_check_proc(String pj_id) {
		ModelAndView mv = new ModelAndView();
		
		projectDAO.updateProjectCheckYn(pj_id, "y", null);
		
		mv.setViewName("redirect:/admin/project/" + pj_id);
		return mv;
	}
	
	
	/**
	 * ������Ʈ �ݷ� ���� �ۼ� ȭ��
	 * @return
	 */
	@RequestMapping(value="/admin/project_reject/{pj_id}", method=RequestMethod.GET)
	public ModelAndView project_reject(@PathVariable("pj_id") String pj_id) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("admin/admin_project_reject");
		mv.addObject("pvo", projectDAO.getAdminContent(pj_id));
		
		return mv;
	}
	
	
	/**
	 * ������Ʈ �ݷ� ó�� & ���� �߼� ó��
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/project_reject_proc", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView project_reject_proc(EmailVO vo, String pj_id) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		/*MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		messageHelper.setFrom(vo.fromEmailAddr);
		messageHelper.setTo(vo.getToEmailAddr());
		messageHelper.setSubject(vo.getTitle());
		messageHelper.setText(vo.getContent());

		mailSender.send(message);*/
		
		projectDAO.updateProjectCheckYn(pj_id, "n", vo.getContent());
		
		mv.setViewName("redirect:/admin/projects");
		
		return mv;
	}
}