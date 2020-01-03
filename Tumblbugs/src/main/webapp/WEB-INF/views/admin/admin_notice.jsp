<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_notice.css">
<script src="http://localhost:9090/tumblbugs/js/admin_notice.js"></script>
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_project_member.css">


<script>
	$(document).ready(function() {
		$(".funding_list#list_all").show();
		$("nav #list_all #list_count").css("background-color", "#1d85ea");
		
		var table = $('#project_table').DataTable({
			bPaginate: true, //페이징처리
            bLengthChange: true, // n개씩보기
            lengthMenu : [ [10, 30, -1], [10, 30, "전체"] ], // 10/25/50/All 개씩보기
            bAutoWidth: false, //자동너비
            ordering: true,//칼럼별 정렬
            searching: true,
            columnDefs: [
                { targets: [0,1,4,5], searchable: false  } ]
		});
		
		table.on( 'order.dt search.dt', function () {
			table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		            cell.innerHTML = i+1;
		        } );
		    } ).draw();

		//선택 탭 css
		var list_name = '${list_name}';
		
		if(list_name == "") {
			$("nav #all li").addClass("select_tab");
			$("nav #all #list_count").css("background-color", "#1d85ea");
		} else {
			$("nav #" + list_name + " li").addClass("select_tab");
			$("nav #" + list_name + " #list_count").css("background-color", "#1d85ea");
		}
		
		//탭 선택
		$("nav li").click(function() {
			var id = $(this).attr("id");
			
			$("nav li").removeClass("select_tab");
			$("nav li #list_count").css("background-color", "#999999");
			$(this).addClass("select_tab");
			$(this).find("#list_count").css("background-color", "#1d85ea");
			
			$(".funding_list").hide();
			$(".funding_list#" + id).show();
			
			if($(this).attr("id") == "list_notice"){
				// Apply a search to the second table for the demo
				table.search( '' ).draw();
				table.columns(2).search( '공지사항' ).draw();
			}else if($(this).attr("id") == "list_event"){
				table.search( '' ).draw();
				table.columns(2).search( '이벤트' ).draw();
				
			}else{
				table.columns().search( '' ).draw();
			}
			
		});
		
	
	});
</script>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>공지사항</p>
			</div>
		   <div id="funding_history">
				<section class="page_content">
					<article id="page_content_tab">
						<nav>
							<li class="select_tab" id="list_all">
								<span>모두 보기</span>
								<span id="list_count">${allCount}</span>
							</li>
							<li id="list_notice">
								<span>공지사항</span>
								<span id="list_count">${noticeCount}</span>
							</li>
							<li id="list_event">
								<span>이벤트</span>
								<span id="list_count">${eventCount}</span>
							</li>
						</nav>
					</article>
					<article class="page_content_funding_list">
						<div class="funding_list" id="list_all">
							<div class="list_count"><i class="fas fa-list"></i>총 ${allCount}건의 게시글이 있습니다.</div>
						</div>
						<div class="funding_list" id="list_notice" >
							<div class="list_count"><i class="fas fa-question"></i>총 ${noticeCount}건의 공지사항이 있습니다.</div>
						</div>
						<div class="funding_list" id="list_event">
							<div class="list_count"><i class="far fa-check-circle"></i>총${eventCount}건의 이벤트가 있습니다.</div>
						</div>
					</article>
				</section>
			</div>
			<div id="notice_btn_div">
				<a href="http://localhost:9090/tumblbugs/admin/notice_write"><button type="button" id="notice_write_btn">글쓰기</button></a>
			</div>
			<div id="admin_notice">
				<table id="project_table">
				<thead>
					<tr id="project_table_item">
						<th>번호</th>
						<th>ID</th>
						<th>분류</th>
						<th>제목</th>
						<th>등록일자</th>
						<th>진행상황</th>
					</tr>
					<tbody id="noticeTbody">
						<c:forEach var="vo" items="${list}" >
							<tr id="project_table_item${vo.rno}" class="noticeTableTr" style="cursor:pointer" 
								onClick = 'location.href="http://localhost:9090/tumblbugs/admin/notice_content?notice_id=${vo.notice_id}"'>
								<td>${vo.rno}</td>
								<td>${vo.notice_id}</td>
								<td class="list_tab">${vo.notice_category}</td>
								<td class="title">${vo.notice_title }</td>
								<td>${vo.notice_reg_date}</td>
								
								<c:if test="${vo.event_waiting_date > 0}">
									<td>진행대기</td>
								</c:if>
								<c:if test="${vo.event_waiting_date <= 0}"> 
									<c:if test="${vo.event_extra_date >= 0}"> 
										<td>진행중</td>
									</c:if>
									<c:if test="${vo.event_extra_date < 0}"> 
										<td>종료</td>
									</c:if>
								</c:if>
								<c:if test="${vo.event_extra_date == null}"> 
									<td>-</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</thead>
				</table>
			</div>
		</div>
	</div>
</body>
</html>