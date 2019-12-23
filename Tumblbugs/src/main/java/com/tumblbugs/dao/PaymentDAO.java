package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.PaymentVO;

@Repository
public class PaymentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.payment";
	
	public ArrayList<PaymentVO> getPaymentList(String email) {
		List list = sqlSession.selectList(namespace + ".paymentList", email);
		return (ArrayList<PaymentVO>)list;
	}
	
	public int regist(PaymentVO vo) {
		int result = 0;
		
		if(vo.getPayment_method().equals("01")) {
			result = sqlSession.insert(namespace + ".cardRegist", vo);
		} else if(vo.getPayment_method().equals("02")) {
			result = sqlSession.insert(namespace + ".bankRegist", vo);
		}
		
		return result;
	}
	
	//펀딩 시 신규 등록한 결제 수단의 payment_id 출력
	public String getNewPaymentId(String email) {
		return sqlSession.selectOne(namespace + ".newPaymentId", email);
	}
}
