package com.tumblbugs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.tumblbugs.dao.DeliveryDAO;
import com.tumblbugs.dao.testDAO;
import com.tumblbugs.util.ExcelRead;
import com.tumblbugs.util.ExcelReadOption;
import com.tumblbugs.util.ExcelWrite;
import com.tumblbugs.util.FileDownloadUtil;
import com.tumblbugs.util.WriteOption;
import com.tumblbugs.vo.DeliveryVO;
import com.tumblbugs.vo.ListVO;
import com.tumblbugs.vo.ProjectVO;
import com.tumblbugs.vo.testVO;

@Controller
public class MyprojectExcelController {
	
	@Autowired
	private DeliveryDAO deliveryDAO;
	
	@RequestMapping(value="/myproject/delivery", method=RequestMethod.GET)
	public ModelAndView myproject_delivery(String pj_id, String rpage) {
		ModelAndView mv = new ModelAndView();
		ArrayList<DeliveryVO> list = deliveryDAO.getResultList(pj_id);
		ProjectVO vo = deliveryDAO.getResultProject(pj_id);
		mv.addObject("list", list);
		mv.addObject("vo", vo);
		mv.addObject("rpage", rpage);
		mv.setViewName("/mypage/myproject_delivery");
		return mv;
	}
	
	/**
	 * produces="text/plain;charset=UTF-8" �ѱ۷� response�ϴµ� ������ ��!
	 * **/
	@RequestMapping(value="/myproject/excelUploadAjax", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
    public String excelUploadAjax(MultipartHttpServletRequest request)  throws Exception{
		MultipartFile excelFile =request.getFile("excelFile");
		
        String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "\\resources\\upload\\";
        
        
        File destFile = new File(root_path + attach_path +excelFile.getOriginalFilename());
        try{
            excelFile.transferTo(destFile);
        }catch(Exception e){
            throw new RuntimeException(e.getMessage(),e);
        }
        
        
        ExcelReadOption excelReadOption = new ExcelReadOption();
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R");

        excelReadOption.setStartRow(2);
        
        
        List<Map<String, String>>excelContent =ExcelRead.read(excelReadOption);
        Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
        
        for(Map<String, String> article: excelContent){
            JsonObject obj = new JsonObject();
            obj.addProperty("B", article.get("B"));	// funding_id
            obj.addProperty("C", article.get("C"));	// gift_id
			/*obj.addProperty("F", article.get("F"));
			obj.addProperty("G", article.get("G"));
			obj.addProperty("H", article.get("H"));
			obj.addProperty("I", article.get("I"));
			obj.addProperty("J", article.get("J"));
			obj.addProperty("K", article.get("K"));
			obj.addProperty("L", article.get("L"));
			obj.addProperty("M", article.get("M"));
			obj.addProperty("N", article.get("N"));*/
			obj.addProperty("O", article.get("O"));
			obj.addProperty("P", article.get("P"));
			obj.addProperty("Q", article.get("Q"));
			jlist.add(obj);
        }
        
		jdata.add("list", jlist);
		String result = gson.toJson(jdata);
        destFile.delete();
        
        return result;
    }

	@RequestMapping(value="/myproject/excelDownload", method=RequestMethod.POST)
    public void excelExport(DeliveryVO vo, String pj_title, Locale locale, HttpServletRequest request, HttpServletResponse response){
		
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		ArrayList<DeliveryVO> list = vo.getList();
		
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "\\resources\\upload\\";
		
		
		WriteOption writeOption = new WriteOption();
		writeOption.setFileName(pj_title+"_��۸��_"+format.format(now)+".xlsx");
		writeOption.setSheetName("��۸��");
		writeOption.setFilePath(root_path+attach_path);
		List<String> titles = new ArrayList<String>();
		titles.add("��ȣ");
		titles.add("�Ŀ���ȣ");
		titles.add("������ȣ");
		titles.add("�Ŀ��ڸ�");
		titles.add("�Ŀ�����");
		titles.add("�����ڸ�");
		titles.add("����ּ�");
		titles.add("�ڵ�����ȣ");
		titles.add("��ۿ�û����");
		titles.add("����");
		titles.add("���ÿɼ�");
		titles.add("����");
		titles.add("�Ŀ��ݾ�");
		titles.add("�߰��Ŀ���");
		titles.add("�ù��");
		titles.add("�����ȣ");
		titles.add("��۽�����");
		titles.add("���ɿϷ�");
		writeOption.setTitles(titles);
	   
		try {
			List<String[]> contents = new ArrayList<String[]>();
			String[] row = new String[19];
			int i = 0;
			for(DeliveryVO dvo: list){
				row = new String[19];
				row[0] = String.valueOf(dvo.getRno());
				row[1] = dvo.getFunding_id();
				row[2] = dvo.getGift_id();
				row[3] = dvo.getName();
				row[4] = dvo.getFunding_date();
				row[5] = dvo.getRecipient_name();
				row[6] = dvo.getRecipient_addr();
				row[7] = dvo.getRecipient_phone();
				row[8] = dvo.getRecipient_request();
				row[9] = dvo.getGift_title();
				row[10] = dvo.getGift_option();
				row[11] = String.valueOf(dvo.getGift_quantity());
				row[12] = String.valueOf(dvo.getFunding_gift_price());
				row[13] = dvo.getExtra_funding_price();
				row[14] = dvo.getCourier();
				row[15] = dvo.getInvoice_number();
				row[16] = dvo.getDelivery_start_date();
				row[17] = dvo.getDelivery_complete_yn();
				
				if(i == 0) row[18] = "��ȣ, �Ŀ���ȣ�� ������ȣ �� ��������������. �������� ���ε尡 �Ұ����մϴ�.";
				if(i == 1) row[18] = "�ù��, �����ȣ, ��۽����� �̿��� ������ �Ŀ��ڰ� �����ؾ��մϴ�.";
				if(i == 2) row[18] = "���� �Ϸ�� �Ŀ��ڰ� ���� ���� Ȯ�ν� ������Ʈ �˴ϴ�.";
				i++;
				contents.add(row);
			}
	       
			writeOption.setContents(contents);
			ExcelWrite.write(writeOption);
			i++;
			/** ���� �ٿ�ε� **/
			if(i !=0) {
			    try {
			    	FileDownloadUtil util = new FileDownloadUtil();
			    	Map<String, Object> fileInfo = new HashMap<String, Object>();
					fileInfo.put("fileName", writeOption.getFileName());
					fileInfo.put("filePath", writeOption.getFilePath());
					util.renderMergedOutputModel(fileInfo, request, response);
					i = 1;
				} catch (Exception e) {
					e.printStackTrace();
				}
			    File del_file = new File(writeOption.getFilePath()+writeOption.getFileName());
				if(del_file.exists()) del_file.delete();
			}
	  	}catch(Exception e) {
	  		e.printStackTrace();
	  	}
	}
	/** ���� ������ ���� **/
	@RequestMapping(value="/myproject/delivery_update",method=RequestMethod.POST)
	public ModelAndView delivery_update(DeliveryVO vo, String pj_id, String rpage) {
		ModelAndView mv = new ModelAndView();
		ArrayList<DeliveryVO> list = vo.getList();
		int result = deliveryDAO.getResultUpdate(list);
		mv.addObject("pj_id", pj_id);
		mv.addObject("rpage", rpage);
		mv.setViewName("redirect:/myproject/delivery");
		return mv;
	}
}
