package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.SearchVO;

@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.search";
	
	public void getResultInsertKeyword(String keyword) {
		sqlSession.insert(namespace+".insert", keyword);
	}
	
	public ArrayList<SearchVO> getResultList(){
		List list = null;
		list = sqlSession.selectList(namespace+".top_list");
		return (ArrayList<SearchVO>)list;
	}
	
	public ArrayList<SearchVO> getResultSearchList(String keyword){
		List list = null;
		list = sqlSession.selectList(namespace+".search_list", keyword);
		return (ArrayList<SearchVO>)list;
	}
}
