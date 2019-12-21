package com.tumblbugs.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.NoticeVO;

@Repository
public class AdminNoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.notice";

	
	/** 공지사항 작성 **/
	public boolean notice_write(NoticeVO vo){
		boolean result = false;
		int val = sqlSession.insert(namespace+".notice_write", vo);
		
		if(val != 0) result = true;
		
		return result;
	}
}
