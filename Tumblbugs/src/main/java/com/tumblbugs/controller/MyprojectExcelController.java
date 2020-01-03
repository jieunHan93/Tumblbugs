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
	 * produces="text/plain;charset=UTF-8" 한글로 response하는데 도움을 줌!
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
		writeOption.setFileName(pj_title+"_배송목록_"+format.format(now)+".xlsx");
		writeOption.setSheetName("배송목록");
		writeOption.setFilePath(root_path+attach_path);
		List<String> titles = new ArrayList<String>();
		titles.add("번호");
		titles.add("후원번호");
		titles.add("선물번호");
		titles.add("후원자명");
		titles.add("후원일자");
		titles.add("수령자명");
		titles.add("배송주소");
		titles.add("핸드폰번호");
		titles.add("배송요청사항");
		titles.add("선물");
		titles.add("선택옵션");
		titles.add("수량");
		titles.add("후원금액");
		titles.add("추가후원금");
		titles.add("택배사");
		titles.add("송장번호");
		titles.add("배송시작일");
		titles.add("수령완료");
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
				
				if(i == 0) row[18] = "번호, 후원번호와 선물번호 는 수정하지마세요. 정상적인 업로드가 불가능합니다.";
				if(i == 1) row[18] = "택배사, 송장번호, 배송시작일 이외의 정보는 후원자가 수정해야합니다.";
				if(i == 2) row[18] = "수령 완료는 후원자가 선물 수령 확인시 업데이트 됩니다.";
				i++;
				contents.add(row);
			}
	       
			writeOption.setContents(contents);
			ExcelWrite.write(writeOption);
			i++;
			/** 파일 다운로드 **/
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
	/** 수정 데이터 저장 **/
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
