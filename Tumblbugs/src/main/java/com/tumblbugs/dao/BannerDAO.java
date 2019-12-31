package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.BannerVO;

@Repository
public class BannerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.banner";
	
	/** 배너 리스트 **/
	public ArrayList<BannerVO> getResultList(){
		List list = null;
		list = sqlSession.selectList(namespace+".list");
		return (ArrayList<BannerVO>)list;
	}
	
	/** 배너 등록 **/
	public boolean getResultInsert(BannerVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace+".insert", vo);
		if (val != 0) result = true;
		return result;
	}
	
	/** 프로젝트 주소 체크 **/
	public int getResultCheck(String pj_addr) {
		return sqlSession.selectOne(namespace+".pj_addr_check", pj_addr);
	}
	
	/** 배너 상세 **/
	public BannerVO getResultContent(String ba_id) {
		BannerVO vo = sqlSession.selectOne(namespace+".content", ba_id);
		return vo;
	}
	
	/** 배너 생세 수정 **/
	public boolean getResultUpdate(BannerVO vo) {
		boolean result = false;
		int val = sqlSession.update(namespace+".update", vo);
		if(val != 0) result = true;
		return result;
	}
}
