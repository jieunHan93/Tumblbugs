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
	
	//������ ������ - ������
	public ProjectVO getAdminContent(String pj_id) {
		return sqlSession.selectOne(namespace + ".admin_content", pj_id);
	}
	
	//����� ������ - ������
	public ProjectVO getContent(String pj_id) {
		return sqlSession.selectOne(namespace + ".content", pj_id);
	}
	
	/**
	 * pj_addr�� ���� pj_id ��� - ������Ʈ ������ ��� �� ���
	 * @param pj_addr
	 * @return
	 */
	public String getPj_id(String pj_addr) {
		return sqlSession.selectOne(namespace + ".pj_id", pj_addr);
	}
	
	/**
	 * pj_id�� ���� pj_addr ��� - ������Ʈ>Ŀ�´�Ƽ �۾� �� redirect �� ����
	 * @param pj_id
	 * @return
	 */
	public String getPj_addr(String pj_id) {
		return sqlSession.selectOne(namespace + ".pj_addr", pj_id);
	}
	
	/**
	 * pj_title ���
	 * @param pj_id
	 * @return
	 */
	public String getProjectTitle(String pj_id) {
		return sqlSession.selectOne(namespace + ".pj_title", pj_id);
	}
	
	/**
	 * ��ȸ�� ������Ʈ
	 * @param pj_id
	 */
	public void hitsUpdate(String pj_id) {
		sqlSession.update(namespace + ".hits", pj_id);
	}
	
	/**
	 * ���� ����Ʈ ���
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
	 * ������ ������ ����Ʈ ���
	 * @param gift_id
	 * @return
	 */
	public ArrayList<ItemVO> getItemList(String gift_id) {
		List list = sqlSession.selectList(namespace + ".item", gift_id);
		return (ArrayList<ItemVO>)list;
	}
	
	/**
	 * Ŀ�´�Ƽ > �Ŀ���/���Ŀ��� �� �ٸ� ȭ���� �����ֱ� ���� �Ŀ� ���� üũ
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
