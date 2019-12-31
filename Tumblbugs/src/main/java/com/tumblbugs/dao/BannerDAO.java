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
	
	/** ��� ����Ʈ **/
	public ArrayList<BannerVO> getResultList(){
		List list = null;
		list = sqlSession.selectList(namespace+".list");
		return (ArrayList<BannerVO>)list;
	}
	
	/** ��� ��� **/
	public boolean getResultInsert(BannerVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace+".insert", vo);
		if (val != 0) result = true;
		return result;
	}
	
	/** ������Ʈ �ּ� üũ **/
	public int getResultCheck(String pj_addr) {
		return sqlSession.selectOne(namespace+".pj_addr_check", pj_addr);
	}
	
	/** ��� �� **/
	public BannerVO getResultContent(String ba_id) {
		BannerVO vo = sqlSession.selectOne(namespace+".content", ba_id);
		return vo;
	}
	
	/** ��� ���� ���� **/
	public boolean getResultUpdate(BannerVO vo) {
		boolean result = false;
		int val = sqlSession.update(namespace+".update", vo);
		if(val != 0) result = true;
		return result;
	}
}
