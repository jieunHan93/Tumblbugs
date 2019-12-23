package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.GiftVO;
import com.tumblbugs.vo.ItemVO;
import com.tumblbugs.vo.ProjectVO;

@Repository
public class ProjectDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.project";
	
	//관리자 페이지 - 콘텐츠
	public ProjectVO getAdminContent(String pj_id) {
		return sqlSession.selectOne(namespace + ".admin_content", pj_id);
	}
	
	//사용자 페이지 - 콘텐츠
	public ProjectVO getContent(String pj_id) {
		return sqlSession.selectOne(namespace + ".content", pj_id);
	}
	
	/*public String getStory(String pj_id) {
		return sqlSession.selectOne(namespace + ".story", pj_id);
	}*/
	
	/**
	 * pj_addr을 통해 pj_id 출력 - 프로젝트 상세정보 출력 시 사용
	 * @param pj_addr
	 * @return
	 */
	public String getPj_id(String pj_addr) {
		return sqlSession.selectOne(namespace + ".pj_id", pj_addr);
	}
	
	/**
	 * pj_id를 통해 pj_addr 출력 - 프로젝트>커뮤니티 작업 후 redirect 시 사용됨
	 * @param pj_id
	 * @return
	 */
	public String getPj_addr(String pj_id) {
		return sqlSession.selectOne(namespace + ".pj_addr", pj_id);
	}
	
	public String getProjectTitle(String pj_id) {
		return sqlSession.selectOne(namespace + ".pj_title", pj_id);
	}
	
	public void hitsUpdate(String pj_id) {
		sqlSession.update(namespace + ".hits", pj_id);
	}
	
	public ArrayList<GiftVO> getGiftList(String pj_id) {
		List list = sqlSession.selectList(namespace + ".gift", pj_id);
		ArrayList<GiftVO> giftList = (ArrayList<GiftVO>)list;
		
		for(GiftVO vo:giftList) {
			ArrayList<ItemVO> itemList = getItemList(vo.getGift_id());
			vo.setItemList(itemList);
		}
		
		return giftList;
	}
	
	public ArrayList<ItemVO> getItemList(String gift_id) {
		List list = sqlSession.selectList(namespace + ".item", gift_id);
		return (ArrayList<ItemVO>)list;
	}
}
