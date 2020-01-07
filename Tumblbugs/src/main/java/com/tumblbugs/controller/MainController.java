package com.tumblbugs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.tumblbugs.dao.BannerDAO;
import com.tumblbugs.dao.MainDAO;
import com.tumblbugs.dao.ProjectSortDAO;
import com.tumblbugs.dao.RegDAO;
import com.tumblbugs.dao.SearchDAO;
import com.tumblbugs.util.HangulJaso;
import com.tumblbugs.vo.BannerVO;
import com.tumblbugs.vo.CollectionVO;
import com.tumblbugs.vo.HeaderVO;
import com.tumblbugs.vo.ProjectVO;
import com.tumblbugs.vo.SearchVO;

@Controller
public class MainController {
	
	@Autowired
	private RegDAO regdao;
	@Autowired
	private MainDAO mainDAO;
	@Autowired
	private ProjectSortDAO projectsortDAO;
	@Autowired
	private SearchDAO searchDAO;
	@Autowired
	private BannerDAO bannerDAO;
	
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public ModelAndView index(String email, String signkey, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HeaderVO> list = mainDAO.getResultCollectionName();
		ArrayList<HeaderVO> tlist = mainDAO.getResultCollectionTag();
		ArrayList<CollectionVO> main_clist = mainDAO.getResultCollectionMainList();
		ArrayList<ProjectVO> cplist = projectsortDAO.getResultCollectionProjectList("C00005", 1, 8);
		ArrayList<ProjectVO> favlist = projectsortDAO.getResultProjectList(1, 8,"전체", "ongoing", "전체", "전체", "1", "fav", "전체");
		ArrayList<ProjectVO> ddlist = projectsortDAO.getResultProjectList(1, 8,"전체", "ongoing", "2", "전체", "1", "deadline", "전체");
		ArrayList<ProjectVO> newlist = projectsortDAO.getResultProjectList(1, 8,"전체", "ongoing", "전체", "전체", "1", "new", "전체");
		ArrayList<BannerVO> bannerlist = bannerDAO.getResultMainList();
		if(signkey != null && email != null) {
			regdao.getResultReg_update(email,signkey);
			System.out.println("회원가입완료"+regdao);
		}	
		session.setAttribute("clist", list);
		session.setAttribute("tlist", tlist);
		mv.addObject("main_clist", main_clist);
		mv.addObject("cplist",cplist);
		mv.addObject("favlist",favlist);
		mv.addObject("ddlist",ddlist);
		mv.addObject("newlist",newlist);
		mv.addObject("bannerlist",bannerlist);
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value="/new_message_check", method=RequestMethod.GET)
	@ResponseBody
	public String new_message_check(HttpSession session) {
		String email = (String)session.getAttribute("semail");
		int val = mainDAO.getResultNewMessage(email);
		return String.valueOf(val);
	}

	@RequestMapping(value="/search_list_proc", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String search_list() {
		ArrayList<SearchVO> list = searchDAO.getResultList();
		String result = "";
		if(list.size() != 0) {
			Gson gson = new Gson();
			JsonArray jlist = new JsonArray();
			JsonObject jdata = new JsonObject();
			
			for(SearchVO vo : list) {
				JsonObject obj = new JsonObject();
				obj.addProperty("keyword", vo.getKeyword());
				jlist.add(obj);
			}
			jdata.add("data", jlist);
			result = gson.toJson(jdata);
		} else {
			result = "fail";
		}
		
		return result;
	}
	
	@RequestMapping(value="/searching_list_proc", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String searching_list(String keyword) {
		HangulJaso hj = new HangulJaso();
		String text = hj.hangulToJaso(keyword);
		ArrayList<SearchVO> list = searchDAO.getResultSearchList(text);
		String result = "";
		if(list.size() != 0) {
			Gson gson = new Gson();
			JsonArray jlist = new JsonArray();
			JsonObject jdata = new JsonObject();
			
			for(SearchVO vo : list) {
				JsonObject obj = new JsonObject();
				obj.addProperty("keyword", vo.getKeyword());
				jlist.add(obj);
			}
			jdata.add("data", jlist);
			result = gson.toJson(jdata);
		}else {
			result = "fail";
		}
		return result;
	}
	
	@RequestMapping(value="fileupload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
                  @RequestParam MultipartFile upload) throws Exception {	//MultipartHttpServletRequest multiFile,
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
					try{
						String fileName = upload.getOriginalFilename();
						/*System.out.println("fileName:" +fileName);*/
						byte[] bytes = upload.getBytes();
						String uploadPath = req.getSession().getServletContext().getRealPath("/resources/upload");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						UUID uuid = UUID.randomUUID();
						String bfile=fileName;
						String bsfile=uuid+"_"+fileName;
						uploadPath = uploadPath + "\\" + bsfile;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        out.flush();
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl = req.getContextPath() + "/upload/" + bsfile;
                        /*System.out.println("uploadPath:" +uploadPath);
                        System.out.println("fileName:" +fileName);
                        System.out.println("fileUrl:" +fileUrl);*/
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                        
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
		return null;
	}	
	
}

