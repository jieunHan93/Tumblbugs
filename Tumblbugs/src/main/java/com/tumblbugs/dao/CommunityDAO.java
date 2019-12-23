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
	
	/** 커뮤니티 게시글 등록 **/
	public int getResultWrite(CommunityVO vo) {
		return sqlSession.insert(namespace + ".write", vo);
	}
	
	/** 커뮤니티 게시글 수정 **/
	public int getResultUpdate(CommunityVO vo) {
		return sqlSession.update(namespace + ".update", vo);
	}
	
	/** 커뮤니티 게시글 수정 시 게시글 내용 가져오기 **/
	public CommunityVO getContent(String community_id) {
		return sqlSession.selectOne(namespace + ".content", community_id);
	}
	
	/** 커뮤니티 게시글 삭제 **/
	public int getResultDelete(String community_id) {
		return sqlSession.delete(namespace + ".delete", community_id);
	}
	
	/** 커뮤니티 댓글 등록 **/
	public int getReplyWriteResult(CommunityReplyVO vo) {
		return sqlSession.insert(namespace + ".replyWrite", vo);
	}
	
	/** 커뮤니티 댓글 삭제 **/
	public int getReplyDeleteResult(String reply_id) {
		return sqlSession.delete(namespace + ".replyDelete", reply_id);
	}
}
