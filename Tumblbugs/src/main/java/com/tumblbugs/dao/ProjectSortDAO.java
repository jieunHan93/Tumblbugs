package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.ProjectVO;

@Repository
public class ProjectSortDAO {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	private static String namespace = "mapper.project_sort";
	
	/** count **/
	public int execTotalCount(String col_id) {
		int val = sqlSession.selectOne(namespace+".collection_project_count", col_id);
		return val;
	}
	/** 컬렉션 프로젝트 리스트 **/
	public ArrayList<ProjectVO> getResultCollectionProjectList(String col_id, int start, int end){
		List list = null;
		Map<String,String> param = new HashMap<String,String>();
		param.put("col_id", col_id);
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		list = sqlSession.selectList(namespace+".collection_project_list", param);
		return (ArrayList<ProjectVO>)list;
	}
	
	/** 프로젝트 SORT COUNT **/
	public int execSortCount(String category, String ongoing, String rate, String money, String editorpick, String order, String search) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("category", category);
		param.put("ongoing", ongoing);
		param.put("rate", rate);
		param.put("money", money);
		param.put("editorpick", editorpick);
		param.put("order", order);
		param.put("search", search);
		int val = sqlSession.selectOne(namespace+".project_sort_count", param);
		return val;
	}
	/** 프로젝트 sort 리스트 **/
	public ArrayList<ProjectVO> getResultProjectList(int start, int end,String category, String ongoing, String rate, String money, String editorpick, String order, String search){
		List list = null;
		Map<String,String> param = new HashMap<String,String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("category", category);
		param.put("ongoing", ongoing);
		param.put("rate", rate);
		param.put("money", money);
		param.put("editorpick", editorpick);
		param.put("order", order);
		param.put("search", search);
		list = sqlSession.selectList(namespace+".project_sort", param);
		return (ArrayList<ProjectVO>)list;
	}
}
