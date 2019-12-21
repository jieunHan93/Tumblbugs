package com.tumblbugs.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
 
public class FileDownloadUtil extends AbstractView {
 
    public FileDownloadUtil() {
        setContentType("application/octet-stream; charset=utf-8");
    }
 
    @Override
	public void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
         
        @SuppressWarnings("unchecked")
		Map<String, Object> fileInfo = model; 
        String fileName 	= (String) fileInfo.get("fileName");
        String filePath 	= (String) fileInfo.get("filePath");
         
        File file = new File(filePath+fileName);
         
        response.setContentType(getContentType());
        response.setContentLength((int) file.length());

        String userAgent = request.getHeader("User-Agent");
        
        
        // IE
        if (userAgent.indexOf("MSIE") > -1) {
        	
        	fileName = URLEncoder.encode(fileName, "UTF-8");
        }
		 
        // IE 11
        if (userAgent.indexOf("Trident") > -1) {
        	fileName = URLEncoder.encode(fileName, "UTF-8");
		}
		
        else {
        	fileName = new String( fileName.getBytes("UTF-8"), "8859_1");
		}

        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        OutputStream out = response.getOutputStream();
 
        FileInputStream fis = null;
 
        try {
        	
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
            
        } finally {
        	
            if(fis != null) {
            	fis.close();
            }
        }
        
        out.flush();
    }
}