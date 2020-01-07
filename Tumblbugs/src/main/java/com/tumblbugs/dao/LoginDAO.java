package com.tumblbugs.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.SessionVO;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSessionTemplate sqlSession; 	
	private static String namespace = "mapper.member";	
	
	/** 로그인 처리 **/
	public SessionVO getResultLogin(String email, String pass) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("pass", pass);
		
		return sqlSession.selectOne(namespace + ".login", map);
	}
	
	public String getfound(String email) {			
		return sqlSession.selectOne(namespace + ".found", email);
	}
	public String getfound_ajax(String email) {			
		return sqlSession.selectOne(namespace + ".found_ajax", email);
	}
	
	public int getemailchk(String email) {
		return sqlSession.selectOne(namespace+".email_chk", email);			
	}
	
	public int getpass_chk(String pass,String email) {
		Map prame = new HashMap<String,String>();
		prame.put("pass", pass);
		prame.put("email", email);
		return sqlSession.selectOne(namespace + ".pass_chk" , prame);			
	}
}
