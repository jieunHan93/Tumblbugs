<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>텀블벅스 :: tumblbugs</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/js/jquery.number.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9090/tumblbugs/js/funding.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/funding.css">
<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
</head>
<script>
	$(document).ready(function() {
		//최근 배송지 선택
		$("li#saved_address .round_checkbox").click(function() {
			$("input#delivery_addr_select").val("y");
			$("input[name='recipient_name']").val('${recentDeliveryInfo.recipient_name}');
			$("input[name='recipient_phone']").val('${recentDeliveryInfo.recipient_phone}');
			$("input[name='recipient_addr']").val('${recentDeliveryInfo.recipient_addr}');
			
			$(this).find("div").show();
			$("#new_address_input").hide();
			$("li#new_address .round_checkbox").find("div").hide();
		});
		
		//신규 배송지 입력 선택
		$("li#new_address .round_checkbox").click(function() {
			$("input#delivery_addr_select").val("y");
			$("#new_address_input input").val("");
			$("label#new_address").text("");
			
			$("#new_address_input").show();
			$(this).find("div").show();
			$("li#saved_address .round_checkbox").find("div").hide();
		});
	});
</script>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="funding_step2">
		<div id="project_info">
			<div>
				<a id="backToProject" href="http://localhost:9090/tumblbugs/project/${pj_addr }"><i class="fas fa-angle-left"></i> 프로젝트로 돌아가기</a>
				<div id="project_title">${pj_title }</div>
			</div>
		</div>
		<div id="step2_content">
			<form action="http://localhost:9090/tumblbugs/${pj_addr}/funding/complete" method="post" name="fundingForm">
				
				<input type="hidden" name="pj_id" value="${vo.pj_id }">
				<input type="hidden" name="email" value="${sessionScope.semail }">
				<input type="hidden" name="extra_funding_price" value="${vo.extra_funding_price }">
				<input type="hidden" name="total_funding_price" value="${vo.total_funding_price }">
				
				<div class="page_title"><label>결제 예약</label></div>
				<table id="total_info_wrap">
					<c:forEach items="${vo.giftList }" var="gift" varStatus="status">
						<input type="hidden" name="giftList[${status.index }].gift_id" value="${gift.gift_id }">
						<input type="hidden" name="giftList[${status.index }].gift_quantity" value="${gift.gift_quantity }">
						<input type="hidden" name="giftList[${status.index }].gift_option" value="${gift.gift_option }">
						<input type="hidden" name="giftList[${status.index }].funding_gift_price" value="${gift.funding_gift_price }">
						<tr id="reward">
							<td colspan="2">
								<label>${gift.gift_title }</label>
								<ul id="reward_component">
									<c:forEach items="${gift.itemList }" var="item">
										<li>• &nbsp;&nbsp;${item.item_title } ( x ${item.item_count } )</li>
									</c:forEach>
								</ul>
								<c:if test="${gift.gift_option ne ''}">
									<div id="reward_option">선택 옵션: ${gift.gift_option }</div>
								</c:if>
								<div>
									<span>수량 : ${gift.gift_quantity }개</span>
									<span id="reward_price"><fmt:formatNumber value="${gift.funding_gift_price }" groupingUsed="true"/>원</span>
								</div>
							</td>
						</tr>
					</c:forEach>
					<tr id="extra_support">
						<td>추가 후원금</td>
						<td>
						<c:choose>
							<c:when test="${vo.extra_funding_price eq '' }">0</c:when>
							<c:otherwise>${vo.extra_funding_price }</c:otherwise>
						</c:choose>원
						</td>
					</tr>
					<tr id="total_price">
						<td>최종결제금액</td>
						<td><fmt:formatNumber value="${vo.total_funding_price }" groupingUsed="true"/>원</td>
					</tr>
				</table>
				<div id="delivery_wrap">
					<div id="delivery_address">
						<div id="page_subtitle">선물 배송지</div>
						<input type="hidden" id="delivery_addr_select">
						<ul>
							<c:if test="${not empty recentDeliveryInfo}">
							<li class="checkbox" id="saved_address">
								<div><div class="round_checkbox"><div></div></div></div>
								<div>
									<label>최근 배송지</label>
									<div id="saved_address">
										${recentDeliveryInfo.recipient_name } ${recentDeliveryInfo.recipient_phone }
										<br>${recentDeliveryInfo.recipient_addr }
									</div>
								</div>
							</li>
							</c:if>
							<li class="checkbox" id="new_address">
								<div><div class="round_checkbox"><div></div></div></div>
								<div id="new_address">
									<label>새로입력</label>
									<div id="new_address_input">
										<label>이름</label>
										<input type="text" name="recipient_name">
										<label>휴대폰 번호</label>
										<input type="text" name="recipient_phone" numberOnly>
										<label>주소</label>
										<button type="button" id="btnAddrSearch">우편번호 검색</button>
										<label id="new_address"></label>
										<input type="text" id="new_address_detail" placeholder="상세주소">
										<input type="hidden" name="recipient_addr">
									</div>
								</div>
							</li>
							<li id="delivery_request">
								<label>배송 시 요청사항 (선택)</label>
								<div><input type="text" name="recipient_request" placeholder="ex) 부재시 경비실에 보관해주세요."></div>
								<div>해당 요청사항은 배송에 관련된 내용만 적어주세요.</div>
							</li>
						</ul>
					</div>
				</div>
				<div id="payment_wrap">
					<input type="hidden" name="payment_id">
					<c:choose>
						<c:when test="${fn:length(paymentList) != 0}"><input type="hidden" name="payment_method" value=""></c:when>
						<c:otherwise><input type="hidden" name="payment_method" value="01"></c:otherwise>
					</c:choose>
					<div id="page_subtitle">결제 수단</div>
					<nav>
						<c:if test="${fn:length(paymentList) != 0}">
							<li id="my_payment">내 결제 수단</li>
						</c:if>
						<li id="new_credit_card">신규 카드</li>
						<li id="new_bank_account">신규 은행계좌</li>
					</nav>
					<div>
						<div id="payment_input">
							<!-- 내 결제 수단 -->
							<c:if test="${fn:length(paymentList) != 0}">
								<div id="my_payment">
									<c:forEach items="${paymentList}" var="payment">
										<c:choose>
											<c:when test="${payment.payment_method eq '01' }">
												<div id="${payment.payment_id }"><i class="far fa-credit-card"></i> ${payment.card_company } ${payment.card_number }</div>
											</c:when>
											<c:when test="${payment.payment_method eq '02' }">
												<div id="${payment.payment_id }"><i class="fas fa-money-check"></i> ${payment.bank } ${payment.account_number }</div>
											</c:when>
										</c:choose>
									</c:forEach>
								</div>
							</c:if>
							<!-- 신규 카드 -->
							<div id="new_credit_card">
								<ul>
									<li id="card_company">
										<label>카드사</label>
										<select name="card_company">
											<option>신한카드</option>
											<option>삼성카드</option>
											<option>현대카드</option>
											<option>BC카드</option>
											<option>국민카드</option>
											<option>하나카드</option>
											<option>롯데카드</option>
											<option>농협카드</option>
											<option>씨티카드</option>
											<option>카카오뱅크</option>
										</select>
									</li>
									<li id="card_number">
										<label>신용(체크)카드번호</label>
										<input type="hidden" name="card_number">
										<input type="text" id="card_number1" maxlength="4" numberOnly>
										<input type="text" id="card_number2" maxlength="4" numberOnly>
										<input type="text" id="card_number3" maxlength="4" numberOnly>
										<input type="text" id="card_number4" maxlength="4" numberOnly>
									</li>
									<li id="expiry_date_card_pass">
										<div id="expiry_date">
											<label>카드 유효기간</label>
											<input type="text" name="card_valid_date" numberOnly placeholder="MM/YY">
										</div>
										<div id="card_pass">
											<label>카드 비밀번호</label>
											<input type="password" name="card_pass" maxlength="2" numberOnly placeholder="앞 2자리">
										</div>
									</li>
									<li id="birth">
										<label>생년월일</label>
										<input type="text" name="card_birth" maxlength="6" numberOnly placeholder="주민등록번호 앞 6자리">
									</li>
								</ul>
							</div>
							<!-- 신규 은행계좌 -->
							<div id="new_bank_account">
								<ul>
									<li id="bank">
										<label>결제 은행</label>
										<select name="bank">
											<option>국민은행</option>
											<option>농협</option>
											<option>우리은행</option>
											<option>SC은행</option>
											<option>삼성은행</option>
											<option>씨티은행</option>
											<option>대구은행</option>
											<option>부산은행</option>
											<option>광주은행</option>
											<option>제주은행</option>
											<option>경남은행</option>
											<option>새마을금고</option>
											<option>신협</option>
											<option>우체국</option>
											<option>하나은행</option>
											<option>신한은행</option>
											<option>외환은행</option>
											<option>유안타증권</option>
											<option>기업은행</option>
											<option>산업은행</option>
										</select>
									</li>
									<li id="account_number">
										<label>계좌번호</label>
										<div>* 휴대폰 번호 등으로 만든 평생계좌번호 및 가상계좌, 펀드/적금/정기예금 등의 계좌는 등록이 불가능합니다.</div>
										<input type="text" name="account_number" numberOnly>
									</li>
									<li id="account_holder">
										<label>예금주명</label>
										<input type="text" name="account_name">
									</li>
									<li id="birth">
										<label>생년월일</label>
										<input type="text" name="account_birth" numberOnly placeholder="주민등록번호 앞 6자리">
									</li>
								</ul>
							</div>
						</div>
						<div id="reservation_notice">
							<div>결제 예약시 유의사항</div>
							<ul>
								<li>결제실행일에 결제자 귀책사유(한도초과, 이용정지 등)로 인하여 결제가 실패할 수 있으니, 결제수단이 유효한지 한번 확인하세요.</li>
								<li>1차 결제 실패 시 실패일로부터 5 영업일 동안 재 결제를 실행합니다.</li>
								<li>결제 예약 이후, 결제 수단을 변경하려면 마이페이지 > 내 후원현황에서 결제 수단을 변경해주세요.</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="agreement_wrap">
					<div id="page_subtitle">약관 동의</div>
					<table>
						<tr>
							<td>
								<p>본 프로젝트에 대한 후원은 즉시 결제되지 않고, 프로젝트가 목표 금액을 정해진 기한 내에 달성한 경우에만 마감일 다음 날에 결제됩니다.
								또한 완제품의 상거래가 아니므로 선물의 전달이 예상일로부터 다소 지연되거나 세부사항이 변경될 수 있으니, 프로젝트 페이지 내 커뮤니티와 이메일 및 텀블벅스 메시지를 꾸준히 확인해주세요.<br>
								<br>텀블벅스는 플랫폼을 제공하는 서비스로, 프로젝트 진행 및 선물 전달의 주체가 아닙니다. 프로젝트를 설계한 창작자의 완수 능력을 보증할 수 없습니다.
								프로젝트에 게시된 모든 내용은 창작자가 작성한 사항이며 이를 약속대로 완수할 책임은 창작자에게 있는 점 안내드립니다.</p>
							</td>
						</tr>
						<tr>
							<th class="checkbox">
								<div><div class="round_checkbox" id="0"><i class="fas fa-check"></i></div></div>
								<div>본인은 위 내용을 모두 이해하였으며 이에 동의합니다.</div>
							</th>
						</tr>
					</table>
					
				</div>
				<div id="confirm">
					<button type="button" class="btn_funding_next_step" id="btn_payment_reservation_finish">결제 예약하기</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>