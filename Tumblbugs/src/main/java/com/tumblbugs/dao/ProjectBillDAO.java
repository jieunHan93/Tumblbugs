package com.tumblbugs.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.ProjectBillVO;

@Repository
public class ProjectBillDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.project_bill";
	
	public ProjectBillVO getBillFromFundingTable(String pj_id) {
		return sqlSession.selectOne(namespace + ".billContent_from_funding", pj_id);
	}
	
	public ProjectBillVO getBill(String bill_id) {
		return sqlSession.selectOne(namespace + ".billContent", bill_id);
	}
	
	public int insert(ProjectBillVO vo) {
		return sqlSession.insert(namespace + ".insert", vo);
	}
	
	public String getBill_id(String pj_id) {
		return sqlSession.selectOne(namespace + ".bill_id", pj_id);
	}
}
