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
	
	/** 프로젝트 정보 **/
	public ProjectVO getResultProject(String pj_id) {
		return sqlSession.selectOne(namespace+".projectInfo", pj_id);
	}
	
	/** 후원자 목록 **/
	public ArrayList<DeliveryVO> getResultList(String pj_id){
		List list = null;
		list = sqlSession.selectList(namespace+".list", pj_id);
		return (ArrayList<DeliveryVO>)list;
	}
}
