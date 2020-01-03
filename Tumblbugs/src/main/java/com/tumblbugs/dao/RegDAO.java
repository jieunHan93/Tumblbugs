package com.tumblbugs.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.SessionVO;

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
	
	/**
	 * 회원 리스트
	 * @return
	 */
	public ArrayList<MemberVO> getMemberList() {
		List list = sqlSession.selectList(namespace + ".list");
		return (ArrayList<MemberVO>)list;
	}
	
	/**
	 * 회원 상세 정보
	 * @param email
	 * @return
	 */
	public MemberVO getMemberInfo(String email) {
		return sqlSession.selectOne(namespace + ".content", email);
	}
	
	public SessionVO getSessionVO(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".login", vo);
	}
	
	/**
	 * 프로필 수정 시 기존 비밀번호 체크
	 * @param email
	 * @param pass
	 * @return
	 */
	public int getPassCheckResult(String email, String pass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pass", pass);
		
		return sqlSession.selectOne(namespace + ".mypage_pass_chk", map);
	}
	
	/**
	 * 프로필 수정 - 파일 업데이트
	 * @param vo
	 * @return
	 */
	public int getProfileUpdate(MemberVO vo) {
		return sqlSession.update(namespace + ".profileUpdate", vo);
	}
	
	/**
	 * 프로필 수정 - 파일 업데이트 안 함
	 * @param vo
	 * @return
	 */
	public int getProfileUpdateNofile(MemberVO vo) {
		return sqlSession.update(namespace + ".profileUpdateNofile", vo);
	}
	
	/**
	 * profile_simg 출력
	 * @param email
	 * @return
	 */
	public String getProfile_simg(String email) {
		return sqlSession.selectOne(namespace + ".profile_simg", email);
	}
	
	/**
	 * 회원 탈퇴
	 * @param email
	 * @return
	 */
	public int getResultUnreg(String email) {
		return sqlSession.delete(namespace + ".unreg", email);
	}
	
	
	
	

}
