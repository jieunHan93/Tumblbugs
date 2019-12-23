package com.tumblbugs.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.SessionVO;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSessionTemplate sqlSession; 	
	private static String namespace = "mapper.member";	
	
	/** 로그인 처리 **/
	public SessionVO getResultLogin(MemberVO vo) {			
		return sqlSession.selectOne(namespace + ".login", vo);
	}
}
