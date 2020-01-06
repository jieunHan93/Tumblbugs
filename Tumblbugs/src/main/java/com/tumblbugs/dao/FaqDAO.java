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
public class FaqDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.faq";
	
	/** FAQ 상세내용 **/
	public ArrayList<FaqVO> getResultContent(String faq_num){
		List<FaqVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("faq_num", faq_num);
		
		list = sqlSession.selectList(namespace+".spon_article_content", param);
		return (ArrayList<FaqVO>)list;
	}
	/** FAQ 상세내용(관리자 페이지) **/
	public FaqVO getResultContent_admin(String faq_num){
		return sqlSession.selectOne(namespace+".faq_content",faq_num);
	}
	/** FAQ 등록 **/
	public boolean getResultWrite(FaqVO vo) {
		boolean result = false;
		int ins_result = sqlSession.insert(namespace+".fwrite", vo);
		if(ins_result != 0) result = true;
		return result;
	}
	/** FAQ 수정 **/
	public boolean getResultUpdate(FaqVO vo) {
		boolean result = false;
		int up_result = sqlSession.update(namespace+".faq_update", vo);
		if(up_result != 0) result = true;
		return result;
	}
	/** FAQ 삭제 **/
	public boolean getResultDelete(String faq_num) {
		boolean result = false;
		int del_result = sqlSession.delete(namespace+".faq_delete", faq_num);
		if(del_result != 0) result = true;
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
	
	/** 창작자 센터 메인 리스트(1. 텀블벅스 플랫폼 알아보기)**/
	public ArrayList<FaqVO> getCreateCenterList_1() {
		List clist_1 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_1 = sqlSession.selectList(namespace+".clist_1", param);
		
		return (ArrayList<FaqVO>)clist_1;
	}
	
	/** 창작자 센터 메인 리스트(2. 텀블벅스 펀딩 준비하기)**/
	public ArrayList<FaqVO> getCreateCenterList_2() {
		List clist_2 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_2 = sqlSession.selectList(namespace+".clist_2", param);
		
		return (ArrayList<FaqVO>)clist_2;
	}
	
	/** 창작자 센터 메인 리스트(3. 텀블벅스에 프로젝트 올리기)**/
	public ArrayList<FaqVO> getCreateCenterList_3() {
		List clist_3 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_3 = sqlSession.selectList(namespace+".clist_3", param);
		
		return (ArrayList<FaqVO>)clist_3;
	}
	
	/** 창작자 센터 메인 리스트(4. 펀딩 시작하고 후원자 만나기)**/
	public ArrayList<FaqVO> getCreateCenterList_4() {
		List clist_4 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_4 = sqlSession.selectList(namespace+".clist_4", param);
		
		return (ArrayList<FaqVO>)clist_4;
	}
	
	/** 창작자 센터 메인 리스트(5. 펀딩 마감 후 선물 전달하기/마무리하기)**/
	public ArrayList<FaqVO> getCreateCenterList_5() {
		List clist_5 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_5 = sqlSession.selectList(namespace+".clist_5", param);
		
		return (ArrayList<FaqVO>)clist_5;
	}
	
	/** 공통 사항 메인 리스트(1. 텀블벅스 소개)**/
	public ArrayList<FaqVO> getCommonCenterList_1() {
		List colist_1 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		colist_1 = sqlSession.selectList(namespace+".colist_1", param);
		
		return (ArrayList<FaqVO>)colist_1;
	}
	
	/** 공통 사항 메인 리스트(2. 계정 설정 및 기타)**/
	public ArrayList<FaqVO> getCommonCenterList_2() {
		List colist_2 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		colist_2 = sqlSession.selectList(namespace+".colist_2", param);
		
		return (ArrayList<FaqVO>)colist_2;
	}
	
	/** 후원자 센터(1.후원하기) 총 건수 **/
	public int spon_1_TotalCount(){
		return sqlSession.selectOne(namespace+".spon_count1");
	}
	
	/** 후원자 센터(2.결제하기) 총 건수 **/
	public int spon_2_TotalCount(){
		return sqlSession.selectOne(namespace+".spon_count2");
	}
	
	/** 창작자 센터(1. 텀블벅스 플랫폼 알아보기) 총 건수 **/
	public int create_1_TotalCount(){
		return sqlSession.selectOne(namespace+".create_count1");
	}
	
	/** 창작자 센터(2. 텀블벅스 펀딩 준비하기) 총 건수 **/
	public int create_2_TotalCount(){
		return sqlSession.selectOne(namespace+".create_count2");
	}
	
	/** 창작자 센터(3. 텀블벅스에 프로젝트 올리기) 총 건수 **/
	public int create_3_TotalCount(){
		return sqlSession.selectOne(namespace+".create_count3");
	}
	
	/** 창작자 센터(4. 펀딩 시작하고 후원자 만나기) 총 건수 **/
	public int create_4_TotalCount(){
		return sqlSession.selectOne(namespace+".create_count4");
	}
	
	/** 공통 사항(2. 계정 설정 및 기타) 총 건수 **/
	public int common_1_TotalCount(){
		return sqlSession.selectOne(namespace+".common_count1");
	}
}
