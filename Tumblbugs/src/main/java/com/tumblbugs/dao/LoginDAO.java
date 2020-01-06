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
	
	/** �α��� ó�� **/
	public SessionVO getResultLogin(MemberVO vo) {			
		return sqlSession.selectOne(namespace + ".login", vo);
	}
	public String getfound(String email) {			
		return sqlSession.selectOne(namespace + ".found", email);
	}
	public String getfound_ajax(String email) {			
		return sqlSession.selectOne(namespace + ".found_ajax", email);
	}
	
	public int getemailchk(String email) {
		//System.out.println(email+"dao");
		return sqlSession.selectOne(namespace+".email_chk", email);			
	}
	public int getpass_chk(String pass,String email) {
		Map prame = new HashMap<String,String>();
		prame.put("pass", pass);
		prame.put("email", email);

		return sqlSession.selectOne(namespace + ".pass_chk" , prame);	
		
	}
}
