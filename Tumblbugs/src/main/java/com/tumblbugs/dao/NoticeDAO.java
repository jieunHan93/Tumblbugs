package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.notice";
	
	/** notice_sthumbnail ���ϸ� �������� **/
	public String getNsfileName(String notice_id) {
		return sqlSession.selectOne(namespace+".thumbnail_name" ,notice_id);
	}
	/** ��������(�˻�) - ����¡ **/
	public ArrayList<NoticeVO> getNoticeSearchList(int start, int end, String searchVal){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("start", start);
		param.put("end", end);
		param.put("searchVal", searchVal);
		
		list = sqlSession.selectList(namespace+".notice_search_list", param);
		
		return (ArrayList<NoticeVO>)list;
	}
	
	/** ��������(ī�װ�) - ����¡ **/
	public ArrayList<NoticeVO> getNoticeCategoryList(int start, int end, String category){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("start", start);
		param.put("end", end);
		param.put("category", category);
		
		list = sqlSession.selectList(namespace+".notice_cat_list", param);
		
		return (ArrayList<NoticeVO>)list;
	}
	
	/** ��������(��ü) - ����¡ **/
	public ArrayList<NoticeVO> getNoticeAllList(int start, int end){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("start", start);
		param.put("end", end);
		
		list = sqlSession.selectList(namespace+".notice_all_list", param);
		
		return (ArrayList<NoticeVO>)list;
	}
	
	/** �̺�Ʈ ���� **/
	public int eventCount() {
		return sqlSession.selectOne(namespace+".event_count");
	}
	
	/** �������� ���� **/
	public int noticeCount() {
		return sqlSession.selectOne(namespace+".notice_count");
	}
	
	/** ��ü ����Ʈ ���� **/
	public int allCount() {
		return sqlSession.selectOne(namespace+".all_count");
	}
	
	/** �˻� ����Ʈ ���� **/
	public int searchCount(String searchVal) {
		return sqlSession.selectOne(namespace+".search_count", searchVal);
	}
	
	/** �������� ���� **/
	public boolean noticeDelete(String notice_id){
		boolean result = false;
		int val = sqlSession.delete(namespace+".notice_delete", notice_id);
		
		if(val != 0) result = true;
		
		return result;
	}
	
	/** �������� ���� - no file **/
	public boolean noticeNofileUpdate(NoticeVO vo){
		boolean result = false;
		int val = sqlSession.update(namespace+".notice_nofile_update", vo);
		
		if(val != 0) result = true;
		
		return result;
	}
	
	/** �������� ���� **/
	public boolean noticeUpdate(NoticeVO vo){
		boolean result = false;
		int val = sqlSession.update(namespace+".notice_update", vo);
		
		if(val != 0) result = true;
		
		return result;
	}
	/** �������� ���� **/
	public NoticeVO getNoticeContent(String notice_id){
		NoticeVO vo = new NoticeVO();
		vo = sqlSession.selectOne(namespace+".notice_content", notice_id);
		
		return vo;
	}
	/** �������� ����Ʈ **/
	public ArrayList<NoticeVO> getNoticeList(){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		list = sqlSession.selectList(namespace+".notice_list");
		
		return (ArrayList<NoticeVO>)list;
	}

	/** �������� �ۼ� **/
	public boolean noticeWrite(NoticeVO vo){
		boolean result = false;
		int val = sqlSession.insert(namespace+".notice_write", vo);
		
		if(val != 0) result = true;
		
		return result;
	}
}
