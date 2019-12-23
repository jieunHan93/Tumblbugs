package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.DeliveryVO;
import com.tumblbugs.vo.ProjectVO;

@Repository
public class DeliveryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.delivery";
	
	/** ������Ʈ ���� **/
	public ProjectVO getResultProject(String pj_id) {
		return sqlSession.selectOne(namespace+".projectInfo", pj_id);
	}
	
	/** �Ŀ��� ��� **/
	public ArrayList<DeliveryVO> getResultList(String pj_id){
		List list = null;
		list = sqlSession.selectList(namespace+".list", pj_id);
		return (ArrayList<DeliveryVO>)list;
	}
}
