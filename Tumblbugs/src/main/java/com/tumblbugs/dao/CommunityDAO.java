package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.CommunityReplyVO;
import com.tumblbugs.vo.CommunityVO;

@Repository
public class CommunityDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.community";
	
	public ArrayList<CommunityVO> getList(Map map) {
		List list = sqlSession.selectList(namespace + ".communityList", map);
		return (ArrayList<CommunityVO>)list;
	}
	
	public ArrayList<CommunityReplyVO> getReplyList(String community_id) {
		List list = sqlSession.selectList(namespace + ".replyList", community_id);
		return (ArrayList<CommunityReplyVO>)list;
	}
	
	public int getResultWrite(CommunityVO vo) {
		return sqlSession.insert(namespace + ".write", vo);
	}
	
}
