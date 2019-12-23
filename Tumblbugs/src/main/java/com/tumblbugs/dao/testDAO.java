package com.tumblbugs.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.tumblbugs.vo.testVO;

public class testDAO extends DBconnDAO{
	ResultSet rs;
	
	public ArrayList<testVO> getList(){
		ArrayList<testVO> list = new ArrayList<testVO>();
		
		String sql="";
		sql = "SELECT TITLE, "
					+ " TDATE,"
					+ " TCATEGORY "
				+ "FROM PTEST ORDER BY TDATE ASC";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				testVO vo =new testVO();
				vo.setTitle(rs.getString(1));
				vo.setTdate(rs.getString(2));
				vo.setTcategory(rs.getString(3));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<testVO> getList(int startCount, int endCount){
		ArrayList<testVO> list = new ArrayList<testVO>();
		
		String sql="";
		sql = "SELECT * FROM (SELECT ROWNUM RNO, "
				+ " TITLE, "
				+ " TO_CHAR(TDATE,'YYYY/MM/DD') TDATE,"
				+ " TCATEGORY "
			+ "FROM (SELECT TITLE, "
						+ " TDATE,"
						+ " TCATEGORY "
					+ "FROM PTEST ORDER BY TDATE ASC)) "
			+ "WHERE RNO BETWEEN ? AND ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				testVO vo =new testVO();
				vo.setTitle(rs.getString(2));
				vo.setTdate(rs.getString(3));
				vo.setTcategory(rs.getString(4));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/** 전체 카운트 가져오기 **/
	public int execTotalCount() {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM PTEST";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
