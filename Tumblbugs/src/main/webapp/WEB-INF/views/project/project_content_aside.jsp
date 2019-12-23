<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<aside>
		<div class="white_box" id="creator_infomation">
			<div id="box_header">창작자 소개</div>
			<div>
				<span id="creator_img"><img src="http://localhost:9090/tumblbugs/upload/${vo.profile_simg }"></span>
				<span id="creator_name"><a href="http://localhost:9090/tumblbugs/myproject">${vo.name }</a></span>
			</div>
			<div class="line_div" id="creator_intro">${vo.intro }</div>
			<div id="creator_login">마지막 로그인&nbsp; <b>8시간 전</b></div>
			<div id="creator_project">진행한 프로젝트&nbsp; <b>${vo.member_pj_count }</b>&nbsp;&nbsp;&nbsp; 밀어준 프로젝트&nbsp; <b>${vo.member_funding_count }</b></div>
			<a href="http://localhost:9090/tumblbugs/sendMessage?pj_id=${vo.pj_id }"><button type="button" id="btnSendMessage"><i class="fas fa-envelope"></i> &nbsp;창작자에게 문의하기</button></a>
		</div>
		<div id="option_count">선택할 수 있는 <b>${fn:length(giftList) }</b>개의 선물이 있습니다</div>
		<c:forEach items="${giftList }" var="gift">
			<div class="white_box" id="present_option">
				<div id="box_header">
					<span id="sponsor_count"><i class="fas fa-check"></i> ${gift.gift_sold_count }명이 선택</span>
					<c:if test="${gift.gift_max_count ne ''}">
						<span id="remaining_earlybird_count">${gift.gift_remaining_count }개 남음</span>
					</c:if>
				</div>
				<div id="price_info">
					<div id="price">${gift.gift_price }원 +</div>
					<div id="reward_title">${gift.gift_title }</div>
				</div>
				<ul>
					<c:forEach items="${gift.itemList}" var="item">
						<li>${item.item_title } ( x ${item.item_count } )</li>
					</c:forEach>
				</ul>
				<div class="line_div" id="expected_delivery_day">예상 전달일 <b>${gift.gift_delivery_date }</b></div>
				<c:choose>
					<c:when test="${vo.remaining_days >= 0}">
						<a href="http://localhost:9090/tumblbugs/${vo.pj_addr }/funding/step1?gift_id=${gift.gift_id}">
							<button type="button">선물 선택하고 밀어주기</button>
						</a>
					</c:when>
					<c:otherwise><button type="button" id="end" disabled>선물 선택하고 밀어주기</button></c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</aside>
</body>
</html>