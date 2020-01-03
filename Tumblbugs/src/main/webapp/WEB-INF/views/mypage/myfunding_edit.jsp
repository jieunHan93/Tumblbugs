<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>텀블벅스 :: tumblbugs</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/js/jquery.number.min.js"></script>
<script src="http://localhost:9090/tumblbugs/js/funding.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
<script>
	$(document).ready(function(){
		$(".content_wrap>div." + '${edit_menu}').show();
		$(".edit_menu a#" + '${edit_menu}').css("color", "#1d85ea");
		
		//결제수단 변경
		$(".payment_option").click(function() {
			var payment = $(this).attr("id");
			if(confirm("[" + payment + "]로 변경하시겠습니까?")) {
				//변경 후 후원현황으로 돌아가기
				alert("변경이 완료되었습니다.");
			}
		});
		
		//펀딩 취소
		$("#btn_funding_cancel").click(function() {
			if(confirm("정말 취소하시겠습니까?")) {
				$.ajax({
					url: "http://localhost:9090/tumblbugs/funding_cancel_proc?funding_id=" + '${funding_id}',
					success: function(result) {
						if(result == "1") {
							location.href = "http://localhost:9090/tumblbugs/myfunding?cancelResult=1";
						}
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="funding_edit">
		<section class="background_wrap" style="background-image : url('http://localhost:9090/tumblbugs/upload/${pvo.pj_simg}')">
			<div>
				<div>
					<div class="page_title">변경하기</div>
					<div class="project_title">${pvo.pj_title }</div>
					<nav class="edit_menu">
						<a id="gift_select" href="http://localhost:9090/tumblbugs/myfunding/edit_gift">선물/금액 변경</a>
						<a id="payment_edit" href="http://localhost:9090/tumblbugs/myfunding/edit_payment">결제수단 변경</a>
						<a id="funding_cancel" href="http://localhost:9090/tumblbugs/myfunding/cancel_funding">취소하기</a>
					</nav>
				</div>
			</div>
		</section>
		<section class="content_wrap">
			<div class="gift_select">
				<form action="http://localhost:9090/tumblbugs/gift_update_proc" method="post" id="gift_select_form" name="gift_update_form">
					<!-- FundingVO 데이터 -->
					<input type="hidden" name="pj_id" value="${pj_id }">
					<input type="hidden" name="total_funding_price">
					<c:forEach items="${giftList }" var="gift" varStatus="status">
						<c:choose>
							<c:when test="${gift.gift_max_count ne 0 and gift.gift_remaining_count eq 0}">
								<label for="${gift.gift_id }" class="disabled">
							</c:when>
							<c:otherwise>
								<label for="${gift.gift_id }" id="${gift.gift_id }">
							</c:otherwise>
						</c:choose>
						
						<!-- FundingGiftVO 데이터 -->
						<input type="hidden" name="giftList[${status.index }].gift_id" value="${gift.gift_id }">
						<input type="hidden" name="giftList[${status.index }].gift_title" value="${gift.gift_title }">
						<input type="hidden" name="giftList[${status.index }].gift_price" value="${gift.gift_price }">
						<input type="checkbox" id="${gift.gift_id }" class="gift_select_yn" name="giftList[${status.index }].select_yn" value="n">
						<input type="hidden" id="gift_option" name="giftList[${status.index }].gift_option">
						
						<div class="gift_price"><span id="gift_price">${gift.gift_price }</span>원 +
							<c:if test="${gift.gift_max_count ne 0 and gift.gift_remaining_count eq 0}">
								<br>선착순 마감됨!
							</c:if>
						</div>
						<div class="gift_detail">
							<div class="gift_title">${gift.gift_title }</div>
							<span class="select_cancel">선택 취소</span>
							<ul class="items">
								<c:forEach items="${gift.itemList }" var="item">
									<li>${item.item_title } ( x ${item.item_count } )</li>
								</c:forEach>
							</ul>
							<div class="expected_delivery_day">예상 전달일: ${gift.gift_delivery_date }</div>
							<div class="gift_quantity_and_option">
								<div class="gift_quantity">
									<span class="option_label">수량</span>
									<div class="quantity_box">
										<span id="quantity_minus">-</span>
										<input id="quantity" name="giftList[${status.index }].gift_quantity" type="text" value="1" readOnly>
										<span id="quantity_plus">+</span>
									</div>
								</div>
								<c:if test="${gift.item_option_count ne '0' }">
									<div class="gift_option">
										<div class="option_label">옵션</div>
										<div class="option_box">
										<c:forEach items="${gift.itemList }" var="item" varStatus="status">
											<c:forEach begin="1" end="${item.item_count }">
												<c:choose>
													<c:when test="${item.item_option_type eq '2' }">
														<c:set var="options" value="${fn:split(item.item_option,',')}"></c:set>
														<div class="select_option_box">
															<select class="select_option" id="option">
																<option value="">${item.item_title } 옵션을 선택해주세요.</option>
																<c:forEach items="${options }" var="option">
																	<option>${option }</option>
																</c:forEach>
															</select>
														</div>
													</c:when>
													<c:when test="${item.item_option_type eq '3' }">
														<div class="write_option_box">
															<div id="optionType3_message">${item.item_option }</div>
															<input class="write_option" id="option" type="text" placeholder="${item.item_title } 옵션을 입력해주세요.">
														</div>
													</c:when>
												</c:choose>
											</c:forEach>
										</c:forEach>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</label>
					</c:forEach>
					<label id="extra_funding">
						<div class="gift_price">후원금 더하기</div>
						<div class="extra_funding_price">
							<input type="text" id="extra_funding_price" name="extra_funding_price" placeholder="0"> 원을 추가로 후원합니다.
						</div>
					</label>
				</form>
				<div class="confirm">${pvo.pj_title }에 <span id="total_price">0</span>원을 펀딩합니다.</div>
				<div>
					<button id="btn_gift_edit">변경하기</button>
				</div>
			</div>
			<div class="payment_edit">
				<div>변경할 예약 결제 수단을 선택해주세요.</div>
				<div id="my_payment">
					<div class="payment_option" id="신한카드 1234"><i class="far fa-credit-card"></i> 신한카드 1234</div>
					<div class="payment_option" id="신한은행 5678"><i class="fas fa-money-check"></i> 신한은행 5678</div>
					<a href="http://localhost:9090/tumblbugs/mypage/payment"><div><i class="fas fa-plus"></i> 신규 결제 수단 등록</div></a>
				</div>
			</div>
			<div class="funding_cancel">
				<div class="cancel_box">후원을 취소하시겠습니까?</div>
				<div>
					<button type="button" id="btn_funding_cancel">취소하기</button>
					<a href="http://localhost:9090/tumblbugs/myfunding/${funding_id }"><button type="button" id="btn_go_funding_detail">다시 생각해보기</button></a>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>