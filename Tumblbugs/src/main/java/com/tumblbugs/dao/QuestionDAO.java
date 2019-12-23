package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.FaqVO;
import com.tumblbugs.vo.QuestionVO;

@Repository
public class QuestionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.helpCenter";
	
	/** 1:1 문의 답변등록**/
	public boolean getResultUpdate(QuestionVO vo) {
		boolean result = false;
		int up_result = sqlSession.update(namespace+".answer_update", vo);
		if(up_result != 0) result = true;
		
		return result;
	}
	/** 1:1 문의 상세페이지 **/
	public QuestionVO getResultContent(String question_num) {
		return sqlSession.selectOne(namespace+".answer_content", question_num);
	}
	/** 1:1 문의 등록 **/
	public boolean getResultWrite(QuestionVO vo) {
		boolean result = false;
		int ins_result = sqlSession.insert(namespace+".spon_write", vo);
		if(ins_result != 0) result = true;
		return result;
	}
	
	/** 1:1 문의 리스트 **/
	public ArrayList<QuestionVO> getResultList() {
		List list = null;
		Map<String, String> param = new HashMap<String, String>();
		
		list = sqlSession.selectList(namespace+".slist", param);
		
		return (ArrayList<QuestionVO>)list;
	}
}
