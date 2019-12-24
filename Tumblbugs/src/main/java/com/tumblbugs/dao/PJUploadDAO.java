package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.FileVO;
import com.tumblbugs.vo.GiftVO;
import com.tumblbugs.vo.ItemVO;
import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.ProjectVO;

@Repository
public class PJUploadDAO {
	@Autowired
	private SqlSessionTemplate sqlSession; 
	private static String namespace = "mapper.upload";
	
	/** 멤버 사진파일 이름 가져오기 **/
	public String getMemberfileName(String semail) {
		return sqlSession.selectOne(namespace+".member_fileName", semail);
	}
	
	/** 프로젝트 검토 요청 **/
	public boolean resultUploadProject(String pj_id) {
		boolean result = false;
		int val = sqlSession.update(namespace+".pj_check", pj_id);
		
		if(val != 0) {
			result = true;
		}
		
		return result;
	}
	/** pj_addr 중복체크 **/
	public boolean getResultAddrCheck(String pj_addr) {
		boolean result = false;
		int val = sqlSession.selectOne(namespace+".addr_check", pj_addr);
		
		if(val == 0) {
			result = true;
		}
		
		return result;
	}
	/** item list 가져오기 **/
	public ArrayList<ItemVO> getItemContent(String gift_id) {
		List<ItemVO> ilist = null;
		ilist = sqlSession.selectList(namespace+".item_content", gift_id);
		
		return (ArrayList<ItemVO>)ilist;
	}
	/** 상품 내용 가져오기 **/
	public ArrayList<GiftVO> getGiftContent(String pj_id) {
		List<GiftVO> glist = null;
		glist = sqlSession.selectList(namespace+".gift_content", pj_id);
		
		return (ArrayList<GiftVO>)glist;
	}
	
	public int resultInsertMemberFile(MemberVO vo) {
		int val = sqlSession.update(namespace+".add_member_file", vo);
		return val;
	}
	
	
	public int resultInsertFile(FileVO vo) {
		int val = sqlSession.update(namespace+".add_file", vo);
		
		return val;
	}
	
	public int resultUpdateItemCheck(Map<String, String> params) {
		int val = sqlSession.update(namespace+".update_item_check", params);
		
		return val;
	}
	
	public int resultDeleteItem(String item_id) {
		int val = sqlSession.delete(namespace+".delete_item", item_id);
		
		return val;
	}
	
	public int resultUpdateGift(Map<String, String> params) {

		int val = sqlSession.update(namespace+".update_gift", params);

		return val;
	}
	
	public int resultDeleteGift(String gift_id) {
		int val = sqlSession.delete(namespace+".delete_gift", gift_id);
		
		return val;
	}
	
	public String resultInsertItem(Map<String, String> params) {
		String item_id ="";
		
		int val = sqlSession.insert(namespace+".add_item", params);
		
		if( val != 0) {
			item_id = sqlSession.selectOne(namespace+".get_item_id");
		}
		
		return item_id;
	}
	
	
	public String resultInsertGift(String pj_id, Map<String, String> params) {
		String gift_id ="";
		params.put("pj_id", pj_id);
		
		int val = sqlSession.insert(namespace+".add_gift", params);
		
		if( val != 0) {
			gift_id = sqlSession.selectOne(namespace+".get_gift_id");
		}
	
		return gift_id;
	}
	
	public boolean resultUpdateEditor(String pj_id, String pj_story) {
		boolean result = false;
		Map<String, String> param = new HashMap<String, String>();
		param.put("pj_id", pj_id);
		param.put("pj_story", pj_story);
			
		int val = sqlSession.update(namespace+".update_editor", param);
		
		if( val != 0) result = true;
		
		return result;
	}
	
	public boolean resultUpdateAccount(String pj_id, Map<String, String> params) {
		boolean result = false;
	
		params.put("pj_id", pj_id);
		int val = sqlSession.update(namespace+".update_account", params);
		
		if( val != 0) result = true;
		
		return result;
	}
	
	public boolean resultUpdateFile(ProjectVO vo) {
		boolean result = false;
		int val = sqlSession.update(namespace+".update_file", vo);
		
		if( val != 0) result = true;
		
		return result;
	}
	
	
	public boolean resultUpdateMember(String pj_colname, String pj_val, String email) {
		boolean result = false;
		Map<String, String> param = new HashMap<String, String>();
		param.put("pj_colname", pj_colname);
		param.put("pj_val", pj_val);
		param.put("email", email);
		
		int val = sqlSession.update(namespace+".update_member", param);
		
		if( val != 0) result = true;
		
		return result;
	}
	
	
	public boolean resultUpdateDate(String pj_id, String pj_colname, String pj_val) {
		boolean result = false;
		Map<String, String> param = new HashMap<String, String>();
		param.put("pj_id", pj_id);
		param.put("pj_colname", pj_colname);
		param.put("pj_val", pj_val);
		
		int val = sqlSession.update(namespace+".update_date", param);
		
		if( val != 0) result = true;
		
		return result;
	}
	
	
	public boolean resultUpdateInput(String pj_id, String pj_colname, String pj_val) {
		boolean result = false;
		Map<String, String> param = new HashMap<String, String>();
		param.put("pj_id", pj_id);
		param.put("pj_colname", pj_colname);
		param.put("pj_val", pj_val);
		
		int val = sqlSession.update(namespace+".update_input", param);
		
		if( val != 0) result = true;
		
		return result;
	}
	
	public boolean resultUpdateTitle(String pj_id, String pj_title, String pj_stitle) {
		boolean result = false;
		Map<String, String> param = new HashMap<String, String>();
		param.put("pj_id", pj_id);
		param.put("pj_title", pj_title);
		param.put("pj_stitle", pj_stitle);
		
		int val = sqlSession.update(namespace+".update_title", param);
		if( val != 0) result = true;
		
		return result;
	}
	
	public String resultAddProject(String semail) {
		String pj_id ="";
		int val = sqlSession.insert(namespace+".add_project", semail);
		
		if(val != 0) {
			pj_id = sqlSession.selectOne(namespace+".get_pj_id");
		}
		
		return pj_id;
	}
	
	
	public MemberVO getMemberContent(String email) {
		MemberVO vo = new MemberVO();
		
		vo = sqlSession.selectOne(namespace+".get_member_content", email);
		
		return vo;
	}
	
	
	public ProjectVO getProjectContent(String pj_id) {
		ProjectVO vo = new ProjectVO();
		
		vo = sqlSession.selectOne(namespace+".get_pj_content", pj_id);
		
		return vo;
	}
}
