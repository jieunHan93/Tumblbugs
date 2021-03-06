<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>텀블벅스 :: tumblbugs</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
<script>
	$(document).ready(function() {
		//프로젝트 마감 이후에는 후원사항 변경 불가하도록 설정
		var project_status = $(".project_status").text();
		if(project_status.indexOf("펀딩 진행중") == -1) {
			$("td div#funding_edit_button").hide();
		}
		
		var odata = "";
		
		//수정하기 버튼 클릭
		$(".button_td #btn_update").click(function() {
			//설정 초기화
			$(".data_tr_update #btn_update_submit").addClass("disabled");	//저장 버튼 비활성화
			$(".data_tr_update").each(function() {							//수정 버튼 누르면 보이는 input value들을 DB에 저장된 값으로 setting
				var id = $(this).attr("id");
				var beforeData = $("tr.data_tr#" + id + " .data_value").text();
				
				if(id != "recipient_addr") {
					$(this).find("input").val(beforeData);
				} else {
					var zipcode = beforeData.slice(1, 6);
					var address = beforeData.replace(beforeData.slice(0, 8), "");
					$("label#zipcode span").text(zipcode);
					$("input#address").val(address);
					$("input#address_detail").val("");
					$("input#new_address").val(beforeData);
				}
			});
			
			var data_tr = $(this).closest("tr");
			var id = data_tr.attr("id");
			var data_tr_update = $("tr.data_tr_update#" + id);
			
			odata = data_tr.find(".data_value").text();
			
			//모든 tr에 대한 설정
			$("tr.data_tr").show();
			data_tr.hide();
			$("tr.data_tr_update").hide().css("background-color", "none");
			$("tr.data_tr_update input").css("border", "none");
			
			//선택한 tr에 대한 설정
			data_tr_update.show().css("background-color", "#f0f5ff");
			data_tr_update.find("input").css("border", "2px solid #1d85ea").focus();
		});
		
		//수정 취소하기 버튼 클릭
		$(".data_tr_update #btn_update_cancel").click(function() {
			$("form").each(function() {this.reset();});
			
			$("tr.data_tr_update").hide();
			$("tr.data_tr").show();
		});
		
		//배송 정보 저장 버튼 활성화
		$(".data_value input").keyup(function() {
			var button = $(this).closest(".data_tr_update").find("#btn_update_submit");
			
			if($(this).val() != "" && $(this).val() != odata) {
				button.removeClass("disabled").removeAttr("disabled");
			} else {
				button.addClass("disabled").attr("disabled", "disabled");
			}
		});
		
		//우편번호 검색
		$("#btnAddrSearch").click(function() {
			new daum.Postcode({
				oncomplete: function(data) {
	                var zipcode = data.zonecode;
	                var roadAddr = data.roadAddress;
					var extraRoadAddr = "";
	                
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y') {
	                	extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                
	                //사용자에게 보여줄 데이터
	                $("label#zipcode span").text(zipcode);
					$("input#address").val(roadAddr + extraRoadAddr);
	                
	                //db에 넘길 데이터
					$("input#new_address").val("[" + zipcode + "] " + roadAddr + extraRoadAddr);
	                
	                //상세 주소 입력란 포커스
	                $("input#address_detail").focus();
	                
	                //저장하기 버튼 활성화
	                $(".data_tr_update#recipient_addr #btn_update_submit").removeClass("disabled").removeAttr("disabled");
				}
			}).open();
		});
		
		//배송정보 저장
		$(".data_tr_update #btn_update_submit").click(function() {
			if($(this).attr("disabled") != "disabled") {
				var column = $(this).closest(".data_tr_update").attr("id");
				var value = $(this).closest(".data_tr_update").find("input").val();
				
				if(column == "recipient_addr") {
					value = $("input#new_address").val() + " " + $("input#address_detail").val();
				}
				
				$.ajax({
					url: "http://localhost:9090/tumblbugs/myfunding_delivery_update?funding_id=" + '${fvo.funding_id}' + "&column=" + column + "&value=" + value,
					success: function(result) {
						if(result == "1") {
							$(".data_tr#" + column + " .data_value").text(value);
							
							$("tr.data_tr_update").hide();
							$("tr.data_tr").slideDown();
						}
					}
				});
			}
		});
	});
</script>
<style>
	#funding_detail button.disabled#btn_update_submit,
	#funding_detail button.disabled#btn_update_submit:hover {
		background-color: #1d85ea;
		opacity: 0.5;
		cursor: default;
	}
	
	.data_tr_update#recipient_addr td .data_value {
		color: #767676;
		padding: 3px 0px;
	}
	
	#recipient_addr .data_subtitle {
		font-size: 9.5pt;
		padding: 6px 0px 5px 0px;
	}
	#funding_detail button#btnAddrSearch {
		margin-left: 7px;
		background-color: #fa6462;
		color: white;
		font-size: 9pt;
		padding: 3px 5px;
		border-radius: 3px;
	}
	#zipcode {
		background-color: #c3d4fc;
		padding: 6px 10px;
		border-radius: 3px;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="funding_detail">
		<section class="background_wrap" style="background-image: url('http://localhost:9090/tumblbugs/upload/${fvo.pj_simg}')"><div></div></section>
		<section class="content_wrap">
			<div>
				<a href="http://localhost:9090/tumblbugs/myfunding"><button type="button" id="btn_funding_history"><i class="fas fa-angle-left"></i> 내 후원현황</button></a>
			</div>
			<div class="funding_overview_wrap">
				<table>
					<tr>
						<td>
							<div class="project_status">
								<c:choose>
									<c:when test="${fvo.remaining_days >= 0 }">펀딩 진행중</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${fvo.achievement_rate >= 100}">펀딩 성공</c:when>
											<c:otherwise>무산</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
							<a href="http://localhost:9090/tumblbugs/project/${pj_addr }"><div class="project_title"><b>${fvo.pj_title }<span class="creator_name">${fvo.name }</span></b></div></a>
						</td>
						<td class="button_td">
							<a href="http://localhost:9090/tumblbugs/sendMessage?pj_id=${fvo.pj_id }">
							<button type="button" id="btn_sendMessage"><i class="fas fa-envelope"></i>&nbsp;&nbsp;문의하기</button></a>
						</td>
					</tr>
					<tr>
						<td>후원번호</td>
						<td><span>${fvo.funding_id }</span></td>
					</tr>
					<tr>
						<td>후원 날짜</td>
						<td><span>${fvo.funding_date }</span></td>
					</tr>
					<tr>
						<td>프로젝트 마감일</td>
						<td><span>${fvo.pj_end_date }</span></td>
					</tr>
				</table>
			</div>
			<div class="total_funding_info_wrap">
				<div class="table_title">후원 내역</div>
				<table>
					<tr>
						<td class="button_td" colspan="2">
							<span>총 <fmt:formatNumber value="${fvo.total_funding_price }" groupingUsed="true"/>원을 후원하셨습니다.</span>
						</td>
						<td rowspan="3">
							<div id="funding_edit_button">
								<a href="http://localhost:9090/tumblbugs/myfunding/${fvo.funding_id }/edit_gift">
								<button type="button" id="btn_edit"><i class="fas fa-undo-alt"></i>&nbsp;&nbsp;후원사항 변경 및 취소하기</button></a>
							</div>
						</td>
					</tr>
					<c:forEach items="${giftList }" var="gift">
					<tr>
						<td><span class="circle_span"><i class="fas fa-gift"></i></span></td>
						<td>
							<div id="reward">
								<label>${gift.gift_title }</label>
								<ul id="reward_component">
									<c:forEach items="${gift.itemList }" var="item">
									<li>• &nbsp;&nbsp;${item.item_title } ( x ${item.item_count } )</li>
									</c:forEach>
								</ul>
								<div>
								<c:if test="${not empty gift.gift_option}">선택 옵션: ${gift.gift_option } / </c:if>수량 : ${gift.gift_quantity }개 / <fmt:formatNumber value="${gift.funding_gift_price }" groupingUsed="true"/>원</div>
							</div>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td><span class="circle_span"><i class="fas fa-gifts"></i></span></td>
						<td>
							<div id="reward"><label>추가 후원금 ${fvo.extra_funding_price }원</label></div>
						</td>
					</tr>
				</table>
			</div>
			<div class="payment_wrap">
				<div class="table_title">결제 정보</div>
				<table>
					<tr>
						<td class="data_td">
							<div class="data_title">결제 수단</div>
							<div class="data_value">${fvo.payment_info }</div>
						</td>
						<td class="button_td">
							<div id="funding_edit_button">
								<a href="http://localhost:9090/tumblbugs/myfunding/${fvo.funding_id }/edit_payment">
									<button type="button"><i class="fas fa-edit"></i> 변경하기</button>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<td class="data_td" colspan="2">
							<div class="data_title">결제 금액</div>
							<div class="data_value"><fmt:formatNumber value="${fvo.total_funding_price }" groupingUsed="true"/>원</div>
						</td>
					</tr>
					<tr>
						<td class="data_td" colspan="2">
							<div class="data_title">결제 상태</div>
							<div class="data_value">
								<c:choose>
									<c:when test="${fvo.payment_complete_yn eq 'y' }">결제가 완료되었습니다.</c:when>
									<c:otherwise>${fvo.pj_pay_date }</c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="delivery_wrap">
				<div class="table_title">배송 정보</div>
				<form name="delivery_update_form">
					<table>
						<tr class="data_tr" id="recipient_name">
							<td class="data_td">
								<div class="data_title">받는 분 이름</div>
								<div class="data_value">${fvo.recipient_name }</div>
							</td>
							<td class="button_td">
								<div id="funding_edit_button">
									<button type="button" id="btn_update"><i class="fas fa-edit"></i> 수정하기</button>
								</div>
							</td>
						</tr>
						<tr class="data_tr_update" id="recipient_name">
							<td class="data_td_update" colspan="2">
								<div class="data_title">받는 분 이름</div>
								<div class="data_value"><input type="text" value="${fvo.recipient_name }"></div>
								<div class="button_div">
									<button type="button" id="btn_update_cancel"><i class="fas fa-times"></i> &nbsp;취소하기</button>
									<button type="button" class="disabled" id="btn_update_submit" disabled><i class="fas fa-check"></i> &nbsp;저장하기</button>
								</div>
							</td>
						</tr>
						<tr class="data_tr" id="recipient_phone">
							<td class="data_td">
								<div class="data_title">받는 분 연락처</div>
								<div class="data_value">${fvo.recipient_phone }</div>
							</td>
							<td class="button_td">
								<div id="funding_edit_button">
									<button type="button" id="btn_update"><i class="fas fa-edit"></i> 수정하기</button>
								</div>
							</td>
						</tr>
						<tr class="data_tr_update" id="recipient_phone">
							<td class="data_td_update" colspan="2">
								<div class="data_title">받는 분 연락처</div>
								<div class="data_value"><input type="text" value="${fvo.recipient_phone }"></div>
								<div class="button_div">
									<button type="button" id="btn_update_cancel"><i class="fas fa-times"></i> &nbsp;취소하기</button>
									<button type="button" class="disabled" id="btn_update_submit" disabled><i class="fas fa-check"></i> &nbsp;저장하기</button>
								</div>
							</td>
						</tr>
						<tr class="data_tr" id="recipient_addr">
							<td class="data_td">
								<div class="data_title">배송 주소</div>
								<div class="data_value">${fvo.recipient_addr }</div>
							</td>
							<td class="button_td">
								<div id="funding_edit_button">
									<button type="button" id="btn_update"><i class="fas fa-edit"></i> 수정하기</button>
								</div>
							</td>
						</tr>
						<tr class="data_tr_update" id="recipient_addr">
							<td class="data_td_update" colspan="2">
								<div class="data_title">배송 주소</div>
								<div class="data_value">
									<div>
										<div>
											<label class="data_subtitle">선택한 주소</label>
											<button type="button" id="btnAddrSearch">다시 선택</button>
										</div>
										<div>
											<label id="zipcode"><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;<span>00000</span></label>
											<input type="text" id="address" disabled>
										</div>
									</div>
									<div>
										<div class="data_subtitle">나머지 주소</div>
										<input type="text" id="address_detail">
									</div>
									<input type="hidden" id="new_address">
								</div>
								<div class="button_div">
									<button type="button" id="btn_update_cancel"><i class="fas fa-times"></i> &nbsp;취소하기</button>
									<button type="button" class="disabled" id="btn_update_submit" disabled><i class="fas fa-check"></i> &nbsp;저장하기</button>
								</div>
							</td>
						</tr>
						<tr id="invoice_number">
							<td class="data_td" colspan="2">
								<div class="data_title">운송장 정보</div>
								<div class="data_value">
									<c:choose>
										<c:when test="${not empty fvo.delivery_start_date }">${fvo.courier }&nbsp;${fvo.invoice_number }</c:when>
										<c:otherwise>운송장 번호가 등록되지 않았습니다.</c:otherwise>
									</c:choose>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>