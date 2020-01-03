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
	
	public PaymentVO getPaymentContent(String payment_id) {
		return sqlSession.selectOne(namespace + ".paymentContent", payment_id);
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
	
	//지불정보 삭제 전 미결제된 후원의 결제수단으로 등록되어 있는지 확인
	public int paymentDeleteCheck(String payment_id) {
		return sqlSession.selectOne(namespace + ".paymentDeleteCheck", payment_id);
	}
	
	//후원 테이블에 입력할  payment_info : 카드(카드사/뒤4자리) 형식으로출력
	public String getPaymentInfo(String payment_id) {
		return sqlSession.selectOne(namespace + ".paymentInfo", payment_id);
	}
}
