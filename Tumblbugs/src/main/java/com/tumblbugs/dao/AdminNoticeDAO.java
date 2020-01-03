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
public class AdminNoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.notice";
	
	/** 이벤트 개수 **/
	public int eventCount() {
		return sqlSession.selectOne(namespace+".event_count");
	}
	
	/** 공지사항 개수 **/
	public int noticeCount() {
		return sqlSession.selectOne(namespace+".notice_count");
	}
	
	/** 전체 리스트 개수 **/
	public int allCount() {
		return sqlSession.selectOne(namespace+".all_count");
	}
	
	/** 공지사항 삭제 **/
	public boolean noticeDelete(String notice_id){
		boolean result = false;
		int val = sqlSession.delete(namespace+".notice_delete", notice_id);
		
		if(val != 0) result = true;
		
		return result;
	}
	
	/** 공지사항 수정 **/
	public boolean noticeUpdate(NoticeVO vo){
		boolean result = false;
		int val = sqlSession.update(namespace+".notice_update", vo);
		
		if(val != 0) result = true;
		
		return result;
	}
	/** 공지사항 내용 **/
	public NoticeVO getNoticeContent(String notice_id){
		NoticeVO vo = new NoticeVO();
		vo = sqlSession.selectOne(namespace+".notice_content", notice_id);
		
		return vo;
	}
	/** 공지사항 리스트 **/
	public ArrayList<NoticeVO> getNoticeList(){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		list = sqlSession.selectList(namespace+".notice_list");
		
		return (ArrayList<NoticeVO>)list;
	}
	/** 카테고리별 리스트 **/
/*	public ArrayList<NoticeVO> getNoticeCategoryList(String listColName){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		list = sqlSession.selectList(namespace+".notice_category_list", listColName);
		
		return (ArrayList<NoticeVO>)list;
	}*/
	/** 공지사항 작성 **/
	public boolean noticeWrite(NoticeVO vo){
		boolean result = false;
		int val = sqlSession.insert(namespace+".notice_write", vo);
		
		if(val != 0) result = true;
		
		return result;
	}
}
