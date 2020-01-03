<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_project_member.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
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
             lengthMenu : [ [15, 30, -1], [15, 30, "전체"] ], // 10/25/50/All 개씩보기
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
			
			/* $.ajax({
				url: "http://localhost:9090/tumblbugs/project_bill/pj_id=" + pj_id,
				success: function(data) {
					
				}
			}); */
			
			$(".modal").modal("show");
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
					<a href="http://localhost:9090/tumblbugs/admin/projects/success" id="success">
						<li>
							<span>펀딩 성공</span>
							<span id="list_count">${adminProjectCount.successCount}</span>
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
						<th class="pj_start_date">시작일</th>
						<th class="pj_end_date">마감일</th>
						<th class="pj_price">목표 금액</th>
						<th class="total_funding_price">달성 금액</th>
						<th class="achievement_rate">달성률</th>
						<th class="pj_bill">정산</th>
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
						<td class="pj_start_date">${vo.pj_start_date}</td>
						<td class="pj_end_date">${vo.pj_end_date}</td>
						<td class="pj_price">${vo.pj_price}</td>
						<td class="total_funding_price">${vo.total_funding_price}</td>
						<td class="achievement_rate">${vo.achievement_rate}%</td>
						<td class="pj_bill">
							<button class="btn btn-default" data-target="#layerpop" data-toggle="modal" id="btn_bill_open">정산</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="modal">
			<div class="admin_project_bill">
				<div class="title">모금액 명세서</div>
				<table id="bill_table">
					<tr class="subtitle">
						<td>출금 성공액 (21명)</td>
						<td>1,005,130원</td>
					</tr>
					<tr>
						<td>- 신용카드 (9명)</td>
						<td>1,005,130원</td>
					</tr>
					<tr>
						<td>- 계좌이체 (12명)</td>
						<td>1,005,130원</td>
					</tr>
					<tr class="subtitle">
						<td>수수료 내역</td>
						<td>-68,127원</td>
					</tr>
					<tr class="bold_content">
						<td>- Tumblbugs (5% + VAT)</td>
						<td>1,005,130원</td>
					</tr>
					<tr class="bold_content">
						<td>- 결제 수수료</td>
						<td>1,005,130원</td>
					</tr>
					<tr class="tab_content">
						<td>- 신용카드 (3.5% + VAT)</td>
						<td>1,005,130원</td>
					</tr>
					<tr class="tab_content">
						<td>- 계좌이체 (건당 250원 + VAT)</td>
						<td>1,005,130원</td>
					</tr>
					<tr class="bold_content">
						<td>- 최종 수령액 송금 수수료 (신한은행 외 타은행 이체 수수료)</td>
						<td>1,000원</td>
					</tr>
					<tr class="subtitle">
						<td>최종 수령액(출금 성공액 - 수수료 내역)</td>
						<td>937,003원</td>
					</tr>
				</table>
				<div>
					<button id="btn_bill_complete" type="button">정산하기</button>
					<button id="btn_bill_close" type="button">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>