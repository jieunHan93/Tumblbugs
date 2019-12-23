package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.MemberVO;
import com.tumblbugs.vo.ProjectVO;

@Repository
public class MyProjectDAO {
	@Autowired
	private SqlSessionTemplate sqlSession; 	
	private static String namespace = "mapper.myproject";	
	
	
	/** ������Ʈ ���� **/
	public String deleteProject(String pj_id){
		String result = "";
		int val = sqlSession.delete(namespace + ".pj_delete", pj_id);
		
		if(val != 0) {
			result = "���� �Ϸ�!";
		}else {
			result = "���� ����!";
		}
		
		return result;
	}
	
	/** ���� ���� �������� **/
	public ProjectVO getProjectCheck(String pj_id){
		ProjectVO vo = new ProjectVO(); 
		 vo = sqlSession.selectOne(namespace + ".pj_check", pj_id);
		
		return vo;
	}
	/**����¡ ī��Ʈ **/
	public int execTotalCount(String email){
		return sqlSession.selectOne(namespace + ".paging_list", email);
	}
	/** ������Ʈ ����Ʈ �������� **/
	public ArrayList<ProjectVO> getProjectList(String email, int start, int end) {
		List<ProjectVO> list = null;
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("start", start);
		param.put("end", end);
		param.put("email", email);
		
		list = sqlSession.selectList(namespace + ".pj_list", param);
		return (ArrayList<ProjectVO>)list;
	}
	
	/** â�۹� ���� �������� **/
	public int getProjectCount(String email) {
		return sqlSession.selectOne(namespace + ".pj_count", email);
			
	}
	/** â���� ���� �������� **/
	public MemberVO getMyProfile(String email) {
		MemberVO mvo = new MemberVO();
		mvo = sqlSession.selectOne(namespace + ".my_profile", email);
		
		return mvo;		
	}

}
