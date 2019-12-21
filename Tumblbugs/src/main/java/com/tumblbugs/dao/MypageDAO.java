package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.tumblbugs.vo.CollectionVO;
import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.PaymentVO;

@Repository
public class MypageDAO {
	@Autowired
	private SqlSessionTemplate sqlSession; 	
	private String namespace = "mapper.member";	
	private String namespace2 = "mapper.payment";
	
	public MemberVO getProfile(String email) {
		return sqlSession.selectOne(namespace + ".content", email);
	}
	
	public int getupdate_profile(MemberVO vo) {

		return sqlSession.update(namespace + ".update_profile" , vo);		
	}
	
	public int getselect_profile_pass(String pass) {

		return sqlSession.selectOne(namespace + ".select_profile_pass" , pass);	
		
	}
	public int getpayment_update(PaymentVO vo) {

		return sqlSession.update(namespace2 + ".payment_update_proc" , vo);	
		
	}
	public String getpayment(String sid) {
		return sqlSession.selectOne(namespace2 + ".payment" , sid);	
		
	}
	public int totalcount() {
		return sqlSession.selectOne(namespace2 + ".TotalCount");			
	}
	public ArrayList<PaymentVO> payment_info() {
		List list = null;
	
		list = sqlSession.selectList(namespace2 + ".payment_info");	
		return (ArrayList<PaymentVO>)list;
	
	}
	public int select_pyment_method() {
		return sqlSession.selectOne(namespace2 + ".select_pyment_method");			
	}
	
}
