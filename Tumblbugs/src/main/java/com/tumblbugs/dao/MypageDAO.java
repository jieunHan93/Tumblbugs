package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int getmypage_pass_chk(String pass,String email) {
		Map prame = new HashMap<String,String>();
		
		prame.put("pass", pass);
		prame.put("email", email);
		System.out.println("daopass="+pass);
		System.out.println("daoemail="+email);
		return sqlSession.selectOne(namespace + ".mypage_pass_chk" , prame);	
		
	}
	public int getpayment_insert(PaymentVO vo) {
		System.out.println(vo.getCard_number());
		System.out.println(vo.getCard_number()+"dao");
		return sqlSession.insert(namespace2 + ".payment_insert_proc" , vo);	
		
	}
	public String getpayment(String sid) {
		return sqlSession.selectOne(namespace2 + ".payment" , sid);	
		
	}
	public int totalcount() {
		return sqlSession.selectOne(namespace2 + ".TotalCount");			
	}
	
	public ArrayList<PaymentVO> payment_info(int startCount, int endCount ,String email) {
		List<PaymentVO> list = null;
		Map param = new HashMap<String,String>();
		param.put("startCount", String.valueOf(startCount));
		param.put("endCount", String.valueOf(endCount));
		param.put("email", email);
		
		list = sqlSession.selectList(namespace2 + ".payment_info" , param);	
		return (ArrayList<PaymentVO>)list;

	
	}
	public int select_pyment_method() {
		return sqlSession.selectOne(namespace2 + ".select_pyment_method");			
	}
	
}
