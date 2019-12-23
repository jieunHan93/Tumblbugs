package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.FaqVO;

@Repository
public class FaqDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.faq";
	
	public String getResultContent() {
		return sqlSession.selectOne(namespace+".spon_article_content");
	}
	
	/** FAQ 등록 **/
	public boolean getResultWrite(FaqVO vo) {
		
		boolean result = false;
		int ins_result = sqlSession.insert(namespace+".fwrite", vo);
		if(ins_result != 0) result = true;
		
		return result;
	}
	
	/** 전체 row count 출력  **/
	public int execTotalCount(){
		return sqlSession.selectOne(namespace+".fcount");
	}
	
	/** FAQ 전체 리스트 **/
	public ArrayList<FaqVO> getResultList() {
		List list = null;
		Map<String, String> param = new HashMap<String, String>();
		
		list = sqlSession.selectList(namespace+".flist", param);
		
		return (ArrayList<FaqVO>)list;
	}
	
	/** 헬프센터 자주 묻는 질문 **/
	public ArrayList<FaqVO> getFrequentList() {
		List flist = null;
		Map<String, String> param = new HashMap<String, String>();
		
		flist = sqlSession.selectList(namespace+".frequent_list", param);
		
		return (ArrayList<FaqVO>)flist;
	}
	
	/** 후원자 센터 메인 리스트(1. 후원하기)**/
	public ArrayList<FaqVO> getSponCenterList_1() {
		List slist_1 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		slist_1 = sqlSession.selectList(namespace+".slist_1", param);
		
		return (ArrayList<FaqVO>)slist_1;
	}
	
	/** 후원자 센터 메인 리스트(2. 결제하기)**/
	public ArrayList<FaqVO> getSponCenterList_2() {
		List slist_2 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		slist_2 = sqlSession.selectList(namespace+".slist_2", param);
		
		return (ArrayList<FaqVO>)slist_2;
	}
	
	/** 후원자 센터 메인 리스트(3. 선물 전달받기)**/
	public ArrayList<FaqVO> getSponCenterList_3() {
		List slist_3 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		slist_3 = sqlSession.selectList(namespace+".slist_3", param);
		
		return (ArrayList<FaqVO>)slist_3;
	}
	
	/** 후원자 센터 메인 리스트(4. 기타)**/
	public ArrayList<FaqVO> getSponCenterList_4() {
		List slist_4 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		slist_4 = sqlSession.selectList(namespace+".slist_4", param);
		
		return (ArrayList<FaqVO>)slist_4;
	}
	
	/** 후원자 센터(1.후원하기) 총 건수 **/
	public int spon_1_TotalCount(){
		return sqlSession.selectOne(namespace+".spon_count1");
	}
	
	/** 후원자 센터(2.결제하기) 총 건수 **/
	public int spon_2_TotalCount(){
		return sqlSession.selectOne(namespace+".spon_count2");
	}
}
