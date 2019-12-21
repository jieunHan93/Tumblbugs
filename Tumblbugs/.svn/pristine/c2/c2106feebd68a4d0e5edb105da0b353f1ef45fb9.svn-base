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
 
public class ImageFileDownloadUtil extends AbstractView {
 
    public ImageFileDownloadUtil() {
        setContentType("application/octet-stream; charset=utf-8");
    }
 
    @Override
	public void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
         
        @SuppressWarnings("unchecked")
		/*Map<String, Object> fileInfo = model;
        String fileName 	= (String) fileInfo.get("fileName");
        String filePath 	= (String) fileInfo.get("filePath");*/
        
        String downloadFileName = (String)model.get("downloadFileName");
        File file = (File)model.get("file");
         
        response.setContentType(getContentType());
        response.setContentLength((int) file.length());

        String userAgent = request.getHeader("User-Agent");
        
        
        // IE
        if (userAgent.indexOf("MSIE") > -1) {
        	
        	downloadFileName = URLEncoder.encode(downloadFileName, "UTF-8");
        }
		 
        // IE 11
        if (userAgent.indexOf("Trident") > -1) {
        	downloadFileName = URLEncoder.encode(downloadFileName, "UTF-8");
		}
		
        else {
        	downloadFileName = new String( downloadFileName.getBytes("UTF-8"), "8859_1");
		}

        response.setHeader("Content-Disposition", "attachment; filename=\"" + downloadFileName + "\";");
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