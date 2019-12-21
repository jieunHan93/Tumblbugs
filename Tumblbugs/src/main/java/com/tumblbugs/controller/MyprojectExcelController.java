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
import com.tumblbugs.dao.testDAO;
import com.tumblbugs.util.ExcelRead;
import com.tumblbugs.util.ExcelReadOption;
import com.tumblbugs.util.ExcelWrite;
import com.tumblbugs.util.FileDownloadUtil;
import com.tumblbugs.util.WriteOption;
import com.tumblbugs.vo.ListVO;
import com.tumblbugs.vo.testVO;

@Controller
public class MyprojectExcelController {
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
        excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q");

        excelReadOption.setStartRow(2);
        
        
        List<Map<String, String>>excelContent =ExcelRead.read(excelReadOption);
        Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
        
        for(Map<String, String> article: excelContent){
            /*System.out.println(article.get("A"));
            System.out.println(article.get("B"));
            System.out.println(article.get("C"));*/
            JsonObject obj = new JsonObject();
			/*obj.addProperty("A", article.get("A"));
			obj.addProperty("B", article.get("B"));
			obj.addProperty("C", article.get("C"));
			obj.addProperty("D", article.get("D"));*/
			obj.addProperty("E", article.get("E"));
			obj.addProperty("F", article.get("F"));
			obj.addProperty("G", article.get("G"));
			obj.addProperty("H", article.get("H"));
			obj.addProperty("I", article.get("I"));
			obj.addProperty("J", article.get("J"));
			obj.addProperty("K", article.get("K"));
			obj.addProperty("L", article.get("L"));
			obj.addProperty("M", article.get("M"));
			obj.addProperty("N", article.get("N"));
			obj.addProperty("O", article.get("O"));
			obj.addProperty("P", article.get("P"));
			/*obj.addProperty("Q", article.get("Q"));*/
			jlist.add(obj);
        }
        
		jdata.add("list", jlist);
		String result = gson.toJson(jdata);
        
        //ExcelUploadService service = new ExcelUploadService();
        //service.excelUpload(destFile);
        
        destFile.delete();
        
        return result;
    }

	@RequestMapping(value="/myproject/excelDownload", method=RequestMethod.GET)
	/*@ResponseBody*/
    public void excelExport(Locale locale, HttpServletRequest request, HttpServletResponse response){
		
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		
		int i = 0;
		testVO vo = null;
		if(vo == null) {
		   vo = new testVO();
		}
	   
		testDAO dao = new testDAO();
		List<testVO> list = dao.getList();
	   
		
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "\\resources\\upload\\";
		
		
		WriteOption writeOption = new WriteOption();
		writeOption.setFileName("Ȯ�ο�"+format.format(now)+".xlsx");
		writeOption.setSheetName("Ȯ��");
		writeOption.setFilePath(root_path+attach_path);
		List<String> titles = new ArrayList<String>();
		titles.add("��ȣ");
		titles.add("�Ŀ���ȣ");
		titles.add("�Ŀ��ڸ�");
		titles.add("�Ŀ�����");
		titles.add("�����ڸ�");
		titles.add("����ּ�");
		titles.add("�ڵ�����ȣ");
		titles.add("��ۿ�û����");
		titles.add("����");
		titles.add("���ÿɼ�");
		titles.add("����");
		titles.add("�Ŀ���");
		titles.add("�߰��Ŀ���");
		titles.add("�ù��");
		titles.add("�����ȣ");
		titles.add("��۽�����");
		titles.add("���ɿϷ�");
		writeOption.setTitles(titles);
	   
		try {
			List<String[]> contents = new ArrayList<String[]>();
			String[] row = new String[18];
	       
			for(int j=0;j<list.size();j++){
				row = new String[18];
				//row[0] = pvo.getTitle();
				row[0] = "1";
				row[1] = "838765";
				row[2] = "2019-12-01";
				row[3] = "ȫ�浿";
				row[4] = "������";
				row[5] = "[17095]��⵵ ���ν� ���ﱸ �������2077���� 53 (û������ �¿����þ�) 200�� 1001ȣ";
				row[6] = "01053519617";
				row[7] = "����� ���տ� ���ּ���";
				row[8] = "ȥ�ڼ� ���ʺ�";
				row[9] = "<��������> (1��)";
				row[10] = "1";
				row[11] = "13000";
				row[12] = "0";
				row[13] = "��ü�� �ù�";
				row[14] = "12586184620500";
				row[15] = "2019-12-02";
				row[16] = "�̿Ϸ�";
				
				if(j == 0) row[17] = "���ε�ÿ��� ���͸� Ǯ�� �������ּ���";
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
	
	@RequestMapping(value="/myproject/delivery_update",method=RequestMethod.POST)
	public ModelAndView delivery_update(ListVO vo) {
		ModelAndView mv = new ModelAndView();
		ArrayList<ListVO> list = vo.getList();
		for(ListVO lvo : list) {
			//System.out.println(lvo.getName());
		}
		mv.setViewName("redirect:/myproject/delivery");
		return mv;
	}
}
