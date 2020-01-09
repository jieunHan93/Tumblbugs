<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_project_member.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/js/jquery.number.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<title>Insert title here</title>
<style>
	#btn_bill_open {
		font-size: 10pt;
		color: white;
		background-color: #fa6462;
		padding: 3px 6px;
	}

	.admin_project_bill {
		width: 520px;
		margin: auto;
		background-color: white;
		border-radius: 5px;
	}
	#bill_table {	
		width: 100%;
		font-size: 10pt;
		border: 1px solid lightgray;
		border-collapse: collapse;
	}
	#bill_table td {
		padding: 12px 20px;
		border-bottom: 1px solid lightgray;
	}
	#bill_table td:nth-child(2) {
		text-align: right;
	}
	.admin_project_bill .title {
		font-size: 12pt;
		font-weight: bold;
	}
	#bill_table .subtitle td {
		font-size: 10.5pt;
		font-weight: bold;
		background-color: #f1f1f1;
	}
	#bill_table .bold_content td {
		font-weight: bold;
		color: #595959;
	}
	#bill_table .tab_content td:first-child {
		padding-left: 30px;
	}
	
	.admin_project_bill div {
		text-align: center;
		padding: 30px 0px 20px 0px;
	}
	.admin_project_bill button {
		padding: 7px 12px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 10.5pt;
		font-weight: bold;
		outline: none;
	}
	#btn_bill_complete {
		background-color: #1e90ff;
		color: white;
		margin-right: 5px;
	}
	
	.modal {
		margin-top: 100px;
	}
</style>
<script>
	$(document).ready(function() {
		var table = $('#project_table').DataTable({
			 bPaginate: true, //페이징처리
             bLengthChange: true, // n개씩보기
             lengthMenu : [ [-1, 15, 30], ["전체", 15, 30] ], // 10/25/50/All 개씩보기
             bAutoWidth: false, //자동너비
             order: [[ 0, "desc" ]],	//정렬
             searching: true, //검색기능
		});
		
		//선택 탭 css
		var category = '${category}';
		
		if(category == "") {
			$("nav #all li").addClass("select_tab");
			$("nav #all #list_count").css("background-color", "#1d85ea");
		} else {
			$("nav #" + category + " li").addClass("select_tab");
			$("nav #" + category + " #list_count").css("background-color", "#1d85ea");
		}
		
		//정산 모달창 띄우기
		$("tbody tr td #btn_bill_open").click(function() {
			var pj_id = $(this).closest("tr").attr("id");
			
			$.ajax({
				url: "http://localhost:9090/tumblbugs/admin/project/bill/" + pj_id,
				success: function(data) {
					var billData = JSON.parse(data);
					$("#total_sponsor_count").text(billData.card_sponsor_count + billData.account_sponsor_count).number(true);
					$("#total_pay_price").text(billData.total_pay_price).number(true);
					$("#card_pay_price").text(billData.card_pay_price).number(true);
					$("#card_sponsor_count").text(billData.card_sponsor_count).number(true);
					$("#account_pay_price").text(billData.account_pay_price).number(true);
					$("#account_sponsor_count").text(billData.account_sponsor_count).number(true);
					$("#total_comm").text(billData.total_comm).number(true);
					$("#tumblbugs_comm").text(billData.tumblbugs_comm).number(true);
					$("#pay_comm").text(billData.pay_comm).number(true);
					$("#card_comm").text(billData.card_comm).number(true);
					$("#account_comm").text(billData.account_comm).number(true);
					$("#transfer_comm").text(billData.transfer_comm).number(true);
					$("#total_receipts").text(billData.total_receipts).number(true);
					
					//form data set
					$("input[name='pj_id']").val(billData.pj_id);
					$("input[name='total_pay_price']").val(billData.total_pay_price);
					$("input[name='card_pay_price']").val(billData.card_pay_price);
					$("input[name='card_sponsor_count']").val(billData.card_sponsor_count);
					$("input[name='account_pay_price']").val(billData.account_pay_price);
					$("input[name='account_sponsor_count']").val(billData.account_sponsor_count);
					$("input[name='total_comm']").val(billData.total_comm);
					$("input[name='tumblbugs_comm']").val(billData.tumblbugs_comm);
					$("input[name='pay_comm']").val(billData.pay_comm);
					$("input[name='card_comm']").val(billData.card_comm);
					$("input[name='account_comm']").val(billData.account_comm);
					$("input[name='transfer_comm']").val(billData.transfer_comm);
					$("input[name='total_receipts']").val(billData.total_receipts);
					
					if(billData.bill_id != null && billData.bill_id != "") {
						$("#btn_bill_submit").attr("disabled", "disabled").css("cursor", "default").text("정산 완료");
					} else {
						$("#btn_bill_submit").removeAttr("disabled").css("cursor", "pointer").text("정산하기");
					}
				}
			});
			
			$(".modal").modal("show");
		});
		
		//정산 처리
		$("#btn_bill_submit").click(function() {
			var formData = $("form[name='billForm']").serialize();
			$.ajax({
				url: "http://localhost:9090/tumblbugs/bill_proc",
				data: formData,
				type: "post",
				success: function(result) {
					if(result != "0") {
						alert("정산 완료되었습니다.");
						$("#btn_bill_submit").attr("disabled", "disabled").css("cursor", "default").text("정산 완료");
					} else {
						alert("정산 처리에 실패했습니다.");
					}
				}
			});
		});
		
		$("#btn_bill_close").click(function() {
			$(".modal").modal("hide");
		});
	});
</script>
</head>
<body>
	<jsp:include page="admin_sidebar.jsp"></jsp:include>
	<div id="admin_project">
		<div id="admin_header">
			<p>프로젝트 검수</p>
		</div>
		<div class="admin_project_content">
			<article id="page_content_tab">
				<nav>
					<a href="http://localhost:9090/tumblbugs/admin/projects/all" id="all">
						<li>
							<span>모두 보기</span>
							<span id="list_count">${adminProjectCount.totalCount}</span>
						</li>
					</a>
					<a href="http://localhost:9090/tumblbugs/admin/projects/check" id="check">
						<li>
							<span>검토 요청</span>
							<span id="list_count">${adminProjectCount.checkRequestCount}</span>
						</li>
					</a>
					<a href="http://localhost:9090/tumblbugs/admin/projects/bill" id="bill">
						<li>
							<span>정산 대기</span>
							<span id="list_count">${adminProjectCount.billCount}</span>
						</li>
					</a>
				</nav>
			</article>
			<table id="project_table">
				<thead>
					<tr>
						<th class="no">번호</th>
						<th class="id">프로젝트 ID</th>
						<th class="title">제목</th>
						<th class="creator_name">창작자</th>
						<th class="pj_check_request_date">검토 요청일</th>
						<th class="pj_check_yn">검토 결과</th>
						<th class="editor_recommend">에디터 추천</th>
						<th class="pj_start_date">시작일</th>
						<th class="pj_end_date">마감일</th>
						<th class="pj_price">목표 금액</th>
						<th class="total_funding_price">달성 금액</th>
						<th class="achievement_rate">달성률</th>
						<th class="pj_bill">명세서</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
					<tr id="${vo.pj_id}">
						<td class="no">${vo.rno}</td>
						<td class="id">${vo.pj_id}</td>
						<td class="title"><a href="http://localhost:9090/tumblbugs/admin/project/${vo.pj_id}">${vo.pj_title}</a></td>
						<td class="creator_name">${vo.name}</td>
						<td class="pj_check_request_date">${vo.pj_check_request_date}</td>
						<td class="pj_check_yn">
							<c:choose>
								<c:when test="${vo.pj_check_yn eq 'y'}">승인</c:when>
								<c:when test="${vo.pj_check_yn eq 'n'}">반려</c:when>
								<c:when test="${(empty vo.pj_check_yn) or (vo.pj_check_yn eq 'c')}">검토 중</c:when>
							</c:choose>
						</td>
						<td class="editor_recommend">
							<c:choose>
								<c:when test="${vo.editor_recommend eq '1'}"><i class="fas fa-award"></i></c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</td>
						<td class="pj_start_date">${vo.pj_start_date}</td>
						<td class="pj_end_date">${vo.pj_end_date}</td>
						<td class="pj_price">${vo.pj_price}</td>
						<td class="total_funding_price">${vo.total_funding_price}</td>
						<td class="achievement_rate">${vo.achievement_rate}%</td>
						<td class="pj_bill">
							<c:set var="remaining_days" value="${vo.remaining_days}"/>
							<fmt:parseNumber var="rdays" type="number" value="${remaining_days}" />
							<c:if test="${vo.total_funding_price >= vo.pj_price and rdays < 0}">
								<button class="btn btn-default" data-target="#layerpop" data-toggle="modal" id="btn_bill_open">보기</button>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="modal">
			<form action="http://localhost:9090/tumblbugs/bill_proc" method="post" name="billForm">
				<!-- 전송 데이터 -->
				<input type="hidden" name="pj_id">
				<input type="hidden" name="total_pay_price">
				<input type="hidden" name="card_pay_price">
				<input type="hidden" name="card_sponsor_count">
				<input type="hidden" name="account_pay_price">
				<input type="hidden" name="account_sponsor_count">
				<input type="hidden" name="total_comm">
				<input type="hidden" name="tumblbugs_comm">
				<input type="hidden" name="pay_comm">
				<input type="hidden" name="card_comm">
				<input type="hidden" name="account_comm">
				<input type="hidden" name="transfer_comm">
				<input type="hidden" name="total_receipts">
				
				<div class="admin_project_bill">
					<div class="title">모금액 명세서</div>
					<table id="bill_table">
						<tr class="subtitle">
							<td>출금 성공액 (<span id="total_sponsor_count">0</span>명)</td>
							<td><span id="total_pay_price">0</span>원</td>
						</tr>
						<tr>
							<td>- 신용카드 (<span id="card_sponsor_count">0</span>명)</td>
							<td><span id="card_pay_price">0</span>원</td>
						</tr>
						<tr>
							<td>- 계좌이체 (<span id="account_sponsor_count">0</span>명)</td>
							<td><span id="account_pay_price">0</span>원</td>
						</tr>
						<tr class="subtitle">
							<td>수수료 내역</td>
							<td>-<span id="total_comm">0</span>원</td>
						</tr>
						<tr class="bold_content">
							<td>- Tumblbugs (VAT 5%)</td>
							<td><span id="tumblbugs_comm">0</span>원</td>
						</tr>
						<tr class="bold_content">
							<td>- 결제 수수료</td>
							<td><span id="pay_comm">0</span>원</td>
						</tr>
						<tr class="tab_content">
							<td>- 신용카드 (VAT 3.5%)</td>
							<td><span id="card_comm">0</span>원</td>
						</tr>
						<tr class="tab_content">
							<td>- 계좌이체 (VAT 건당 250원)</td>
							<td><span id="account_comm">0</span>원</td>
						</tr>
						<tr class="bold_content">
							<td>- 최종 수령액 송금 수수료 (신한은행 외 타은행 이체 수수료)</td>
							<td><span id="transfer_comm">0</span>원</td>
						</tr>
						<tr class="subtitle">
							<td>최종 수령액(출금 성공액 - 수수료 내역)</td>
							<td><span id="total_receipts">0</span>원</td>
						</tr>
					</table>
					<div>
						<button id="btn_bill_submit" type="button">정산하기</button>
						<button id="btn_bill_close" type="button">닫기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>