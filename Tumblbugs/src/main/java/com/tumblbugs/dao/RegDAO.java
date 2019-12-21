package com.tumblbugs.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.MemberVO;

@Repository
public class RegDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 	
	private String namespace = "mapper.member";	
	/** 회원가입 **/
	
	public int getResultReg(MemberVO vo) {
		return sqlSession.insert(namespace + ".reg" , vo);		
	}
	public int getResultReg_email_chk(String email) {

		return sqlSession.selectOne(namespace + ".email_reg_check" , email);	
		
	}
	
	public int getResultReg_update(String email,String signkey) {
		
		Map map = new HashedMap();
		map.put( "email" , email);
		map.put( "signkey" , signkey);
		
		return sqlSession.update(namespace + ".reg_update" , map );
	}
	
	/** 회원 전체 리스트 **/
	public ArrayList<MemberVO> getMemberList() {
		List list = sqlSession.selectList(namespace + ".list");
		
		return (ArrayList<MemberVO>)list;
	}
	
	/** 회원 상세 정보 **/
	public MemberVO getMemberInfo(String email) {
		return sqlSession.selectOne(namespace + ".content", email);
	}
	
	/** 회원 탈퇴 **/
	public int getResultUnreg(String email) {
		return sqlSession.delete(namespace + ".unreg", email);
	}
	
	
	
	

}
