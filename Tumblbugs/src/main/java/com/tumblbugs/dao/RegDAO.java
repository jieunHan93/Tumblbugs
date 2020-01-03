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
	/** ȸ������ **/
	
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
	 * ȸ�� ����Ʈ
	 * @return
	 */
	public ArrayList<MemberVO> getMemberList() {
		List list = sqlSession.selectList(namespace + ".list");
		return (ArrayList<MemberVO>)list;
	}
	
	/**
	 * ȸ�� �� ����
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
	 * ������ ���� �� ���� ��й�ȣ üũ
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
	 * ������ ���� - ���� ������Ʈ
	 * @param vo
	 * @return
	 */
	public int getProfileUpdate(MemberVO vo) {
		return sqlSession.update(namespace + ".profileUpdate", vo);
	}
	
	/**
	 * ������ ���� - ���� ������Ʈ �� ��
	 * @param vo
	 * @return
	 */
	public int getProfileUpdateNofile(MemberVO vo) {
		return sqlSession.update(namespace + ".profileUpdateNofile", vo);
	}
	
	/**
	 * profile_simg ���
	 * @param email
	 * @return
	 */
	public String getProfile_simg(String email) {
		return sqlSession.selectOne(namespace + ".profile_simg", email);
	}
	
	/**
	 * ȸ�� Ż��
	 * @param email
	 * @return
	 */
	public int getResultUnreg(String email) {
		return sqlSession.delete(namespace + ".unreg", email);
	}
	
	
	
	

}
