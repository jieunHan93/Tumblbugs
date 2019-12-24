package com.tumblbugs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumblbugs.vo.FundingGiftVO;
import com.tumblbugs.vo.FundingVO;
import com.tumblbugs.vo.ItemVO;

@Repository
public class FundingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.funding";
	private static String pnamespace = "mapper.project";
	
	/**
	 * 후원하기 : tum_funding table insert
	 * @param vo
	 * @return
	 */
	public int fundingInsert(FundingVO vo) {
		int nthSupporter = 0;
		
		if(sqlSession.insert(namespace + ".fundingInsert", vo) != 0) {
			int insertCount = 0;
			
			for(FundingGiftVO fgvo:vo.getGiftList()) {
				String funding_id = getFundingId(vo.getEmail());
				fgvo.setFunding_id(funding_id);
				insertCount += fundingGiftInsert(fgvo);
			}
			
			if(insertCount == vo.getGiftList().size()) {
				nthSupporter = sqlSession.selectOne(namespace + ".nthSupporter", vo.getPj_id());
			}
		}
		
		return nthSupporter;
	}
	
	/**
	 * 후원하기 : tum_funding_gift table insert
	 * @param vo
	 * @return
	 */
	public int fundingGiftInsert(FundingGiftVO vo) {
		return sqlSession.insert(namespace + ".fundingGiftInsert", vo);
	}
	
	public String getFundingId(String email) {
		return sqlSession.selectOne(namespace + ".fundingId", email);
	}
	
	public FundingVO getRecentDeliveryInfo(String email) {
		return sqlSession.selectOne(namespace + ".recentDeliveryInfo", email);
	}
	
	/**
	 * 내 후원현황 > 전체 후원 건수, 펀딩 진행 중인 후원 건수, 결제 완료된 후원 건수 출력
	 * @param email
	 * @return
	 */
	public Map<String, Integer> getFundingCount(String email) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("totalCount", (Integer)sqlSession.selectOne(namespace + ".totalCount", email));
		map.put("ongoingCount", (Integer)sqlSession.selectOne(namespace + ".ongoingCount", email));
		map.put("paymentCount", (Integer)sqlSession.selectOne(namespace + ".paymentCount", email));
		
		return map;
	}
	
	/**
	 * 내 후원현황 > 후원 리스트
	 * @param email
	 * @return
	 */
	public ArrayList<FundingVO> getFundingList(String email, String category, String search, int start, int end) {
		Map map = new HashMap();
		map.put("email", email);
		map.put("category", category);
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		
		List list = sqlSession.selectList(namespace + ".fundingList", map);
		ArrayList<FundingVO> flist = (ArrayList<FundingVO>)list;
		
		for(FundingVO vo:flist) {
			if(Integer.parseInt(vo.getRemaining_days()) >= 0) {
				vo.setProject_status("펀딩 진행중");
			} else {
				if(vo.getAchievement_rate() >= 100) {
					vo.setProject_status("펀딩 성공");
				} else {
					vo.setProject_status("무산");
				}
			}
			
			if(vo.getPayment_complete_yn().equals("n")) {
				vo.setPayment_status("미결제");
			} else {
				vo.setPayment_status("결제 완료");
			}
		}
		
		return flist;
	}
	
	public int execTotalCount(String email, String category, String search) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("category", category);
		map.put("search", search);
		
		return sqlSession.selectOne(namespace + ".execTotalCount", map);
	}
	
	/**
	 * 후원 상세 정보
	 * @param funding_id
	 * @return
	 */
	public FundingVO getFundingDetail(String funding_id) {
		return sqlSession.selectOne(namespace + ".fundingDetail", funding_id);
	}
	
	/**
	 * 후원 시 선택한 선물 리스트
	 * @param funding_id
	 * @return
	 */
	public ArrayList<FundingGiftVO> getFundingGiftList(String funding_id) {
		List list = sqlSession.selectList(namespace + ".fundingGiftList", funding_id);
		ArrayList<FundingGiftVO> giftList = (ArrayList<FundingGiftVO>)list;
		
		for(FundingGiftVO vo:giftList) {
			List itemList = sqlSession.selectList(pnamespace + ".item", vo.getGift_id());
			vo.setItemList((ArrayList<ItemVO>)itemList);
		}
		
		return giftList;
	}
	
	/**
	 * 후원 선물 변경
	 * @param list
	 * @return
	 */
	public int getFundingUpdateResult(FundingVO vo) {
		ArrayList<FundingGiftVO> oldList = getFundingGiftList(vo.getFunding_id());	//기존 선물 리스트
		List newList = vo.getGiftList();	//새로운 선물 리스트
		ArrayList<FundingGiftVO> newList2 = (ArrayList<FundingGiftVO>)newList;
		ArrayList<FundingGiftVO> updateList = new ArrayList<FundingGiftVO>();
		
		for(int i=oldList.size()-1;i>=0;i--) {
			for(int j=newList.size()-1;j>=0;j--) {
				if(oldList.get(i).getGift_id().equals(newList2.get(j).getGift_id())) {
					updateList.add(newList2.get(j));
					oldList.remove(i);
					newList.remove(j);
					j=-1;
				}
			}
		}
		
		/*System.out.println("삭제할  선물 수: " + oldList.size());
		System.out.println("추가할 선물 수: " + newList.size());
		System.out.println("바꿀 선물 수: " + updateList.size());*/
		
		//update 작업 수행
		for(FundingGiftVO fgvo:updateList) {
			fundingGiftUpdate(fgvo);
		}
		
		//insert 작업 수행
		for(FundingGiftVO fgvo:newList2) {
			fundingGiftInsert(fgvo);
		}
		
		//delete 작업 수행
		for(FundingGiftVO fgvo:oldList) {
			fundingGiftDelete(fgvo);
		}
		
		//추가후원금, 총 후원금 업데이트
		return sqlSession.update(namespace + ".priceUpdate", vo);
	}
	
	public int fundingGiftUpdate(FundingGiftVO vo) {
		return sqlSession.update(namespace + ".fundingGiftUpdate", vo);
	}
	
	public int fundingGiftDelete(FundingGiftVO vo) {
		return sqlSession.delete(namespace + ".fundingGiftDelete", vo);
	}
	
	/**
	 * 결제 수단 변경
	 * @param funding_id
	 * @param payment_id
	 * @return
	 */
	public int getPaymentUpdateResult(String funding_id, String payment_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("funding_id", funding_id);
		map.put("payment_id", payment_id);
		
		return sqlSession.update(namespace + ".paymentUpdate", map);
	}
	
	/**
	 * 배송 정보 변경
	 * @param map
	 * @return
	 */
	public int getDeliveryUpdateResult(Map<String, String> map) {
		return sqlSession.update(namespace + ".deliveryUpdate", map);
	}
	
	/**
	 * 후원 취소(데이터 삭제)
	 * @param funding_id
	 * @return
	 */
	public int getFundingCancelResult(String funding_id) {
		//tum_funding_gift 테이블 먼저 delete
		sqlSession.delete(namespace + ".fundingGiftDeleteAll", funding_id);
		
		return sqlSession.delete(namespace + ".fundingDelete", funding_id);
	}
}
