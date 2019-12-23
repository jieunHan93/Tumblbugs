package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.util.BeforeTimeUtil;
import com.tumblbugs.vo.CommunityReplyVO;
import com.tumblbugs.vo.CommunityVO;

@Repository
public class CommunityDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.community";
	
	public ArrayList<CommunityVO> getList(Map map) throws Exception {
		List list = sqlSession.selectList(namespace + ".communityList", map);
		ArrayList<CommunityVO> clist = (ArrayList<CommunityVO>)list;
		
		BeforeTimeUtil timeUtil = new BeforeTimeUtil();
		
		for(CommunityVO vo:clist) {
			vo.setCommunity_date(timeUtil.beforeTime(vo.getCommunity_date()));
			if(vo.getCommunity_udate() != null) {
				vo.setCommunity_udate(timeUtil.beforeTime(vo.getCommunity_udate()));
			}
		}
		
		return clist;
	}
	
	public ArrayList<CommunityReplyVO> getReplyList(String community_id) {
		List list = sqlSession.selectList(namespace + ".replyList", community_id);
		return (ArrayList<CommunityReplyVO>)list;
	}
	
	public CommunityReplyVO getReply(String email, String reply_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("reply_id", reply_id);
		
		return sqlSession.selectOne(namespace + ".replyOne", map);
	}
	
	/** Ŀ�´�Ƽ �Խñ� ��� **/
	public int getResultWrite(CommunityVO vo) {
		return sqlSession.insert(namespace + ".write", vo);
	}
	
	/** Ŀ�´�Ƽ �Խñ� ���� **/
	public int getResultUpdate(CommunityVO vo) {
		return sqlSession.update(namespace + ".update", vo);
	}
	
	/** Ŀ�´�Ƽ �Խñ� ���� �� �Խñ� ���� �������� **/
	public CommunityVO getContent(String community_id) {
		return sqlSession.selectOne(namespace + ".content", community_id);
	}
	
	/** Ŀ�´�Ƽ �Խñ� ���� **/
	public int getResultDelete(String community_id) {
		return sqlSession.delete(namespace + ".delete", community_id);
	}
	
	/** Ŀ�´�Ƽ ��� ��� **/
	public int getReplyWriteResult(CommunityReplyVO vo) {
		return sqlSession.insert(namespace + ".replyWrite", vo);
	}
	
	/** Ŀ�´�Ƽ ��� ���� **/
	public int getReplyDeleteResult(String reply_id) {
		return sqlSession.delete(namespace + ".replyDelete", reply_id);
	}
}
