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
	
	/** FAQ �󼼳��� **/
	public ArrayList<FaqVO> getResultContent(String faq_num){
		List<FaqVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("faq_num", faq_num);
		
		list = sqlSession.selectList(namespace+".spon_article_content", param);
		return (ArrayList<FaqVO>)list;
	}
	/** FAQ �󼼳���(������ ������) **/
	public FaqVO getResultContent_admin(String faq_num){
		return sqlSession.selectOne(namespace+".faq_content",faq_num);
	}
	/** FAQ ��� **/
	public boolean getResultWrite(FaqVO vo) {
		boolean result = false;
		int ins_result = sqlSession.insert(namespace+".fwrite", vo);
		if(ins_result != 0) result = true;
		return result;
	}
	/** FAQ ���� **/
	public boolean getResultUpdate(FaqVO vo) {
		boolean result = false;
		int up_result = sqlSession.update(namespace+".faq_update", vo);
		if(up_result != 0) result = true;
		return result;
	}
	/** FAQ ���� **/
	public boolean getResultDelete(String faq_num) {
		boolean result = false;
		int del_result = sqlSession.delete(namespace+".faq_delete", faq_num);
		if(del_result != 0) result = true;
		return result;
	}
	
	/** ��ü row count ���  **/
	public int execTotalCount(){
		return sqlSession.selectOne(namespace+".fcount");
	}
	
	/** FAQ ��ü ����Ʈ **/
	public ArrayList<FaqVO> getResultList() {
		List list = null;
		Map<String, String> param = new HashMap<String, String>();
		
		list = sqlSession.selectList(namespace+".flist", param);
		
		return (ArrayList<FaqVO>)list;
	}
	
	/** �������� ���� ���� ���� **/
	public ArrayList<FaqVO> getFrequentList() {
		List flist = null;
		Map<String, String> param = new HashMap<String, String>();
		
		flist = sqlSession.selectList(namespace+".frequent_list", param);
		
		return (ArrayList<FaqVO>)flist;
	}
	
	/** �Ŀ��� ���� ���� ����Ʈ(1. �Ŀ��ϱ�)**/
	public ArrayList<FaqVO> getSponCenterList_1() {
		List slist_1 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		slist_1 = sqlSession.selectList(namespace+".slist_1", param);
		
		return (ArrayList<FaqVO>)slist_1;
	}
	
	/** �Ŀ��� ���� ���� ����Ʈ(2. �����ϱ�)**/
	public ArrayList<FaqVO> getSponCenterList_2() {
		List slist_2 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		slist_2 = sqlSession.selectList(namespace+".slist_2", param);
		
		return (ArrayList<FaqVO>)slist_2;
	}
	
	/** �Ŀ��� ���� ���� ����Ʈ(3. ���� ���޹ޱ�)**/
	public ArrayList<FaqVO> getSponCenterList_3() {
		List slist_3 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		slist_3 = sqlSession.selectList(namespace+".slist_3", param);
		
		return (ArrayList<FaqVO>)slist_3;
	}
	
	/** �Ŀ��� ���� ���� ����Ʈ(4. ��Ÿ)**/
	public ArrayList<FaqVO> getSponCenterList_4() {
		List slist_4 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		slist_4 = sqlSession.selectList(namespace+".slist_4", param);
		
		return (ArrayList<FaqVO>)slist_4;
	}
	
	/** â���� ���� ���� ����Ʈ(1. �Һ���� �÷��� �˾ƺ���)**/
	public ArrayList<FaqVO> getCreateCenterList_1() {
		List clist_1 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_1 = sqlSession.selectList(namespace+".clist_1", param);
		
		return (ArrayList<FaqVO>)clist_1;
	}
	
	/** â���� ���� ���� ����Ʈ(2. �Һ���� �ݵ� �غ��ϱ�)**/
	public ArrayList<FaqVO> getCreateCenterList_2() {
		List clist_2 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_2 = sqlSession.selectList(namespace+".clist_2", param);
		
		return (ArrayList<FaqVO>)clist_2;
	}
	
	/** â���� ���� ���� ����Ʈ(3. �Һ������ ������Ʈ �ø���)**/
	public ArrayList<FaqVO> getCreateCenterList_3() {
		List clist_3 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_3 = sqlSession.selectList(namespace+".clist_3", param);
		
		return (ArrayList<FaqVO>)clist_3;
	}
	
	/** â���� ���� ���� ����Ʈ(4. �ݵ� �����ϰ� �Ŀ��� ������)**/
	public ArrayList<FaqVO> getCreateCenterList_4() {
		List clist_4 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_4 = sqlSession.selectList(namespace+".clist_4", param);
		
		return (ArrayList<FaqVO>)clist_4;
	}
	
	/** â���� ���� ���� ����Ʈ(5. �ݵ� ���� �� ���� �����ϱ�/�������ϱ�)**/
	public ArrayList<FaqVO> getCreateCenterList_5() {
		List clist_5 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		clist_5 = sqlSession.selectList(namespace+".clist_5", param);
		
		return (ArrayList<FaqVO>)clist_5;
	}
	
	/** ���� ���� ���� ����Ʈ(1. �Һ���� �Ұ�)**/
	public ArrayList<FaqVO> getCommonCenterList_1() {
		List colist_1 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		colist_1 = sqlSession.selectList(namespace+".colist_1", param);
		
		return (ArrayList<FaqVO>)colist_1;
	}
	
	/** ���� ���� ���� ����Ʈ(2. ���� ���� �� ��Ÿ)**/
	public ArrayList<FaqVO> getCommonCenterList_2() {
		List colist_2 = null;
		Map<String, String> param = new HashMap<String, String>();
		
		colist_2 = sqlSession.selectList(namespace+".colist_2", param);
		
		return (ArrayList<FaqVO>)colist_2;
	}
	
	/** �Ŀ��� ����(1.�Ŀ��ϱ�) �� �Ǽ� **/
	public int spon_1_TotalCount(){
		return sqlSession.selectOne(namespace+".spon_count1");
	}
	
	/** �Ŀ��� ����(2.�����ϱ�) �� �Ǽ� **/
	public int spon_2_TotalCount(){
		return sqlSession.selectOne(namespace+".spon_count2");
	}
	
	/** â���� ����(1. �Һ���� �÷��� �˾ƺ���) �� �Ǽ� **/
	public int create_1_TotalCount(){
		return sqlSession.selectOne(namespace+".create_count1");
	}
	
	/** â���� ����(2. �Һ���� �ݵ� �غ��ϱ�) �� �Ǽ� **/
	public int create_2_TotalCount(){
		return sqlSession.selectOne(namespace+".create_count2");
	}
	
	/** â���� ����(3. �Һ������ ������Ʈ �ø���) �� �Ǽ� **/
	public int create_3_TotalCount(){
		return sqlSession.selectOne(namespace+".create_count3");
	}
	
	/** â���� ����(4. �ݵ� �����ϰ� �Ŀ��� ������) �� �Ǽ� **/
	public int create_4_TotalCount(){
		return sqlSession.selectOne(namespace+".create_count4");
	}
	
	/** ���� ����(2. ���� ���� �� ��Ÿ) �� �Ǽ� **/
	public int common_1_TotalCount(){
		return sqlSession.selectOne(namespace+".common_count1");
	}
}
