package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.CollectionVO;
import com.tumblbugs.vo.ProjectVO;

@Repository
public class CollectionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	private static String namespace = "mapper.collection";
	
	/**admin 페이지**/
	/** 리스트 전체 출력 **/
	public ArrayList<CollectionVO> getResultList(){
		List list = null;
		list = sqlSession.selectList(namespace+".list");
		return (ArrayList<CollectionVO>)list;
	}
	/** 메인화면의 체크박스 전에 프로젝트 카운트 **/
	public int getResultProjectCount(String col_id) {
		int val = sqlSession.selectOne(namespace+".project_count", col_id);
		return val;
	}
	/** 메인화면의 체크박스 반영 **/
	public boolean getResultCheckbox(String col_id, String col_controll, String col_status) {
		boolean result = false;
		Map<String, String> param = new HashMap<String,String>();
		param.put("col_id", col_id);
		param.put("col_controll",col_controll);
		param.put("col_status", col_status);
		int val = sqlSession.update(namespace+".main_checkbox", param);
		if(val != 0) result=true;
		return result;
	}
	/** 메인화면의 달력 출력 **/
	public ArrayList<CollectionVO> getResultCalendarList(){
		List list = null;
		list= sqlSession.selectList(namespace+".calendar_list");
		return (ArrayList<CollectionVO>)list;
	}
	/** 컬렉션 등록에서 주소 중복체크 **/
	public int getResultCheckCol_addr(String col_addr, String col_id) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("col_addr", col_addr);
		param.put("col_id", col_id);
		return sqlSession.selectOne(namespace+".col_addr_check", param);
	}
	/** 컬렉션 등록 **/
	public boolean getResultWrite(CollectionVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace+".write", vo);
		if(val != 0) result = true;
		return result;
	}
	/** 컬렉션 상세 **/
	public CollectionVO getResultContent(String col_id) {
		CollectionVO vo = sqlSession.selectOne(namespace+".content", col_id);
		return vo;
	}
	/** 컬렉션 수정 **/
	public boolean getResultUpdate(CollectionVO vo) {
		boolean result = false;			int val = 0;
		if(vo.getCol_img() != "" && vo.getCol_img() != null) {
			val = sqlSession.update(namespace+".update", vo);
		} else {
			val = sqlSession.update(namespace+".updatenofile", vo);
		}
		if(val != 0 )result = true;
		return result;
	}
	/** 컬렉션 삭제 **/
	public boolean getResultDelete(String col_id) {
		boolean result = false;
		int val = sqlSession.delete(namespace+".delete", col_id);
		if(val != 0) result = true;
		return result;
	}
	/** 컬렉션 달력을 위한 col_controll **/
	public String getResultCol_controll(String col_id) {
		String result = "";
		result = sqlSession.selectOne(namespace+".controllforcalendar", col_id);
		return result;
	}
	/** 컬렉션 달력에서 수정버튼을 눌렀을 때 **/
	public int getResultCalendarUpdateBtn(CollectionVO vo) {
		int val = 0;
		val = sqlSession.update(namespace+".updateBtncalendar", vo);
		return val;
	}
	/** 컬렉션 달력에서 삭제 버튼 **/
	public int getResultCalendarDeleteBtn(String col_id) {
		int val = 0 ;
		val = sqlSession.delete(namespace+".deleteBtncalendar", col_id);
		return val;
	}
	/** 컬렉션 달력에서 수정드래그 **/
	public int getResultCalendarUpdateDrag(CollectionVO vo) {
		int val = 0;
		val = sqlSession.update(namespace +".updateDragcalendar", vo);
		return val;
	}
	/** 컬렉션 상태 카운트 **/
	public CollectionVO getResultCollectionCount() {
		 return sqlSession.selectOne(namespace +".collection_count");
	}
	/** 컬렉션 상세화면 프로젝트 추가 버튼 **/
	public int getResultAddProject(CollectionVO vo) {
		int val = 0;
		val = sqlSession.insert(namespace+".addproject", vo);
		return val;
	}
	/** 프로젝트 전체 목록 **/
	public ArrayList<CollectionVO> getResultProjectList(){
		List list = null;
		list = sqlSession.selectList(namespace+".project_list");
		return (ArrayList<CollectionVO>)list;
	}
	/** 해당 컬렉션에 따른 프로젝트 목록 **/
	public ArrayList<CollectionVO> getResultCol_idProjectList(String col_id){
		List list = null;
		list = sqlSession.selectList(namespace+".colloection_project_list", col_id);
		return (ArrayList<CollectionVO>)list;
	}
	/** 해당 컬렉션의 프로젝트 제거 **/
	public int getResultRemoveProject(CollectionVO vo) {
		int val = sqlSession.delete(namespace+".removeproject", vo);
		return val;
	}
	/** 컬렉션 추가시에 중복 체크 **/
	public int getResultProjectCheck(CollectionVO vo) {
		int val = sqlSession.selectOne(namespace+".project_check", vo);
		return val;
	}
	
	/**user 페이지**/
	public String getResultCol_id(String col_addr) {
		return sqlSession.selectOne(namespace+".col_id", col_addr);
	}
	
	public CollectionVO getResultTitle(String col_id) {
		CollectionVO vo = sqlSession.selectOne(namespace+".collection_title", col_id);
		return vo;
	}
}
