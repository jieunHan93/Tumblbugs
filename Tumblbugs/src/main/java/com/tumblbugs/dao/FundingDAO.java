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
	 * �Ŀ��ϱ� : tum_funding table insert
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
	 * �Ŀ��ϱ� : tum_funding_gift table insert
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
	 * �� �Ŀ���Ȳ > ��ü �Ŀ� �Ǽ�, �ݵ� ���� ���� �Ŀ� �Ǽ�, ���� �Ϸ�� �Ŀ� �Ǽ� ���
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
	 * �� �Ŀ���Ȳ > �Ŀ� ����Ʈ
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
				vo.setProject_status("�ݵ� ������");
			} else {
				if(vo.getAchievement_rate() >= 100) {
					vo.setProject_status("�ݵ� ����");
				} else {
					vo.setProject_status("����");
				}
			}
			
			if(vo.getPayment_complete_yn().equals("n")) {
				vo.setPayment_status("�̰���");
			} else {
				vo.setPayment_status("���� �Ϸ�");
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
	 * �Ŀ� �� ����
	 * @param funding_id
	 * @return
	 */
	public FundingVO getFundingDetail(String funding_id) {
		return sqlSession.selectOne(namespace + ".fundingDetail", funding_id);
	}
	
	/**
	 * �Ŀ� �� ������ ���� ����Ʈ
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
	 * �Ŀ� ���� ����
	 * @param list
	 * @return
	 */
	public int getFundingUpdateResult(FundingVO vo) {
		ArrayList<FundingGiftVO> oldList = getFundingGiftList(vo.getFunding_id());	//���� ���� ����Ʈ
		List newList = vo.getGiftList();	//���ο� ���� ����Ʈ
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
		
		/*System.out.println("������  ���� ��: " + oldList.size());
		System.out.println("�߰��� ���� ��: " + newList.size());
		System.out.println("�ٲ� ���� ��: " + updateList.size());*/
		
		//update �۾� ����
		for(FundingGiftVO fgvo:updateList) {
			fundingGiftUpdate(fgvo);
		}
		
		//insert �۾� ����
		for(FundingGiftVO fgvo:newList2) {
			fundingGiftInsert(fgvo);
		}
		
		//delete �۾� ����
		for(FundingGiftVO fgvo:oldList) {
			fundingGiftDelete(fgvo);
		}
		
		//�߰��Ŀ���, �� �Ŀ��� ������Ʈ
		return sqlSession.update(namespace + ".priceUpdate", vo);
	}
	
	public int fundingGiftUpdate(FundingGiftVO vo) {
		return sqlSession.update(namespace + ".fundingGiftUpdate", vo);
	}
	
	public int fundingGiftDelete(FundingGiftVO vo) {
		return sqlSession.delete(namespace + ".fundingGiftDelete", vo);
	}
	
	/**
	 * ���� ���� ����
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
	 * ��� ���� ����
	 * @param map
	 * @return
	 */
	public int getDeliveryUpdateResult(Map<String, String> map) {
		return sqlSession.update(namespace + ".deliveryUpdate", map);
	}
	
	/**
	 * �Ŀ� ���(������ ����)
	 * @param funding_id
	 * @return
	 */
	public int getFundingCancelResult(String funding_id) {
		//tum_funding_gift ���̺� ���� delete
		sqlSession.delete(namespace + ".fundingGiftDeleteAll", funding_id);
		
		return sqlSession.delete(namespace + ".fundingDelete", funding_id);
	}
}
