package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.CollectionVO;
import com.tumblbugs.vo.HeaderVO;

@Repository
public class MainDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace= "mapper.main";
	
	public ArrayList<HeaderVO> getResultCollectionName(){
		List list = null;
		list = sqlSession.selectList(namespace+".collection_name_list");
		return (ArrayList<HeaderVO>)list;
	}
	
	public ArrayList<CollectionVO> getResultCollectionMainList(){
		List list = null;
		list = sqlSession.selectList(namespace+".collection_main_list");
		return (ArrayList<CollectionVO>)list;
	}
}
