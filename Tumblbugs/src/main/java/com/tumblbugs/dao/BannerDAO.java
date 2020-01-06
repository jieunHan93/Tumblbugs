package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.BannerVO;
import com.tumblbugs.vo.DeliveryVO;

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
		int val = 0;
		if(vo.getBa_img() != "" && vo.getBa_img() != null) {
			val = sqlSession.update(namespace+".update", vo);
		} else {
			val = sqlSession.update(namespace+".updatenofile", vo);
		}
		if(val != 0) result = true;
		return result;
	}
	
	/** ��� ���� **/
	public boolean getResultDelete(String ba_id) {
		boolean result = false;
		int val = sqlSession.delete(namespace+".delete", ba_id);
		if(val != 0) result = true;
		return result;
	}
	
	/** �� �ݿ� **/
	public boolean getResultCheckbox(String ba_id, String ba_controll, String ba_status) {
		boolean result = false;
		Map<String, String> param = new HashMap<String,String>();
		param.put("ba_id", ba_id);
		param.put("ba_controll",ba_controll);
		param.put("ba_status", ba_status);
		int val = sqlSession.update(namespace+".checkbox", param);
		if(val != 0) result=true;
		return result;
	}
	
	/** ���� ������Ʈ **/
	public int getResultUpdateOrder(ArrayList<BannerVO> list) {
		return sqlSession.update(namespace+".update_order", list);
	}
	
	/** ��� ���ο� �Ѹ��� **/
	public ArrayList<BannerVO> getResultMainList(){
		List list = null;
		list = sqlSession.selectList(namespace+".main_list");
		return (ArrayList<BannerVO>)list;
	}
	
	/** ��� �������� ������� �� **/
	public String getResultControll(String ba_id) {
		return sqlSession.selectOne(namespace+".ba_controll", ba_id);
	}
}
