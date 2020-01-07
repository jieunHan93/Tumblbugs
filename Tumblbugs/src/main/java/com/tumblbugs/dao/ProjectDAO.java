package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	//관리자 페이지 - 리스트
	public ArrayList<ProjectVO> getAdminList(String category) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		
		List list = sqlSession.selectList(namespace + ".admin_list", map);
		return (ArrayList<ProjectVO>)list;
	}
	
	public Map<String, Object> getAdminProjectCount() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCount", sqlSession.selectOne(namespace + ".adminTotalCount"));
		map.put("checkRequestCount", sqlSession.selectOne(namespace + ".adminCheckRequestCount"));
		map.put("billCount", sqlSession.selectOne(namespace + ".adminBillCount"));
		
		return map;
	}
	
	//관리자 페이지 - 콘텐츠
	public ProjectVO getAdminContent(String pj_id) {
		return sqlSession.selectOne(namespace + ".admin_content", pj_id);
	}
	
	/**
	 * 프로젝트 검토 결과 업데이트
	 * @param pj_id
	 * @param checkResult
	 * @return
	 */
	public int updateProjectCheckYn(String pj_id, String checkResult, String pj_reject) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pj_id", pj_id);
		map.put("checkResult", checkResult);
		map.put("pj_reject", pj_reject);
		
		return sqlSession.update(namespace + ".project_check_yn", map);
	}
	
	/**
	 * 프로젝트 관리 > 에디터 추천 등록
	 * @param pj_id
	 * @return
	 */
	public int editorRecommend(String pj_id) {
		return sqlSession.update(namespace + ".editor_recommend", pj_id);
	}
	
	/**
	 * 프로젝트 관리 > 에디터 추천 등록 해제
	 * @param pj_id
	 * @return
	 */
	public int editorRecommendCancel(String pj_id) {
		return sqlSession.update(namespace + ".editor_recommend_cancel", pj_id);
	}
	
	//사용자 페이지 - 콘텐츠
	public ProjectVO getContent(String pj_id) {
		return sqlSession.selectOne(namespace + ".content", pj_id);
	}
	
	//미리보기
	public ProjectVO getPreviewContent(String pj_id) {
		return sqlSession.selectOne(namespace + ".preview_content", pj_id);
	}
	
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
	
	/**
	 * pj_title 출력
	 * @param pj_id
	 * @return
	 */
	public String getProjectTitle(String pj_id) {
		return sqlSession.selectOne(namespace + ".pj_title", pj_id);
	}
	
	/**
	 * 조회수 업데이트
	 * @param pj_id
	 */
	public void hitsUpdate(String pj_id) {
		sqlSession.update(namespace + ".hits", pj_id);
	}
	
	/**
	 * 선물 리스트 출력
	 * @param pj_id
	 * @return
	 */
	public ArrayList<GiftVO> getGiftList(String pj_id) {
		List list = sqlSession.selectList(namespace + ".gift", pj_id);
		ArrayList<GiftVO> giftList = (ArrayList<GiftVO>)list;
		
		for(GiftVO vo:giftList) {
			ArrayList<ItemVO> itemList = getItemList(vo.getGift_id());
			vo.setItemList(itemList);
		}
		
		return giftList;
	}
	
	/**
	 * 선물의 아이템 리스트 출력
	 * @param gift_id
	 * @return
	 */
	public ArrayList<ItemVO> getItemList(String gift_id) {
		List list = sqlSession.selectList(namespace + ".item", gift_id);
		return (ArrayList<ItemVO>)list;
	}
	
	/**
	 * 커뮤니티 > 후원자/비후원자 별 다른 화면을 보여주기 위한 후원 여부 체크
	 * @param email
	 * @return
	 */
	public int getFundingYn(String email, String pj_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pj_id", pj_id);
		
		return sqlSession.selectOne(namespace + ".fundingYn", map);
	}
}
