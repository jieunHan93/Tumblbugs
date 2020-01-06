<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지 메인</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$(".funding_list#list_all").show();
		$("nav #list_all #list_count").css("background-color", "#1d85ea");
		
		//탭 선택
		$("nav li").click(function() {
			var id = $(this).attr("id");
			
			$("nav li").removeClass("select_tab");
			$("nav li #list_count").css("background-color", "#999999");
			$(this).addClass("select_tab");
			$(this).find("#list_count").css("background-color", "#1d85ea");
			
			$(".funding_list").hide();
			$(".funding_list#" + id).show();
		});
		
		//리스트
		var table = $('#qna_list').DataTable({
			bPaginate: true, //페이징처리
            bLengthChange: false, // n개씩보기
            //lengthMenu : [ [10, 20, -1], [10, 20, "전체"] ], // 10/25/50/All 개씩보기
            bAutoWidth: false, //자동너비
            ordering: true, //칼럼별 정렬
            searching: false, //검색기능
		}); 
	});
</script>
<style>
body {background-color: #f7f7f7;}
div#admin_mainconent{
	margin: 0;
	margin-left: 320px;
}
div#admin_mainconent>div#admin_header{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
	width: 100%;
	height: 70px;
	line-height:70px;
	background-color: #ffffff;
	display: inline-block;
	color: #1e90ff;
}
div#admin_mainconent>div#admin_header p {
	margin-left: 20px;
}

	#funding_history{
		position: absolute;
		margin-left: 20px;
	}
	#funding_history section.page_content {
		background-color: #f6f5f5;
	}
	#funding_history article {
		width: 1200px;
		margin: auto;
	}
	#funding_history li {list-style-type: none;}
	
	
	/* 탭 */
	#funding_history article#page_content_tab {
		padding: 20px 0px 20px 0px;
	}
	#funding_history #page_content_tab nav,
	#funding_history #page_content_tab li,
	#funding_history .search {
		display: inline-block;
		font-size: 10.5pt;
	}
	#funding_history #page_content_tab li {
		border-radius: 4px;
		padding: 8px 10px 8px 10px;
		margin-right: 8px;
		cursor: pointer;
		/* background-color: #eeeded; */
	}
	#funding_history #page_content_tab li:hover {
		background-color: rgba(0,0,0,.05);
	}
	#funding_history #page_content_tab li span#list_count {
		display: inline-block;
		margin-left: 10px;
		border-radius: 5px;
		width: 26px;
		font-size: 10pt;
		text-align: center;
		background-color: #999999;
		color: white;
	}
	
	#funding_history .select_tab {
		background-color: rgba(0,0,0,.05);
		color: #1d85ea;
	}
	
	/* 검색창 */
	#funding_history .search {
		float: right;
		text-align: right;
	}
	#funding_history .search input {
		border: 1px solid lightgray;
		border-radius: 5px;
		width: 350px;
		padding: 7px 7px 7px 12px;
	}
	
	/* 총 n건의 후원이 있습니다. */
	#funding_history div.list_count {
		color: #545454;
		background-color: #eeeded;
		padding: 15px 15px 15px 15px;
		margin-bottom: 17px;
		border-radius: 5px;
	}
	.funding_list{
		display: none;
	}
	#funding_history div.list_count i {
		font-size:16px;
		margin-right: 15px;
		margin-left: 15px;
	}
	div#admin_qna {
		width: 1200px;
		position: absolute;
		margin: 200px 0px 0px 20px;
	}
	 table#qna_list {
		width: 1200px;
		text-align: center;
		font-size: 14px;
	}
	 table#qna_list, table#qna_list th, table#qna_list td {
	 	border: 1px solid gray;
		border-collapse: collapse;
	}
	 table#qna_list td {
	 	height: 30px;
	 }
	 table#qna_list tr#qna_list_item {
	 	background-color: #eeeded;
	 }
	 
	 table#qna_list thead tr#qna_list_item th:first-child{width: 40px;}
	 table#qna_list tr#qna_list_item th:nth-child(2){width: 80px;}
	 table#qna_list tr#qna_list_item th:nth-child(3){width: 230px;}
	 table#qna_list tr#qna_list_item th:nth-child(4){width: 621px;}
	 table#qna_list tr#qna_list_item th:nth-child(6){width: 120px;}
	 
	 table#qna_list tr#qna_list_item2 {background-color: #ffffff;}
	 table#qna_list tr#qna_list_item2 td:nth-child(3){
	 	text-align: left;
	 	padding-left: 5px;
	 }  
	 table#qna_list tr#qna_list_item2 a#td_a{
	 	text-decoration: underline;
	 	color: #1e90ff;
	 }
	 div#admin_write{
		position: absolute;
		margin-top: 150px;
		margin-left: 1000px;
	}
	div#admin_write a button#btnAdmin_write {
		background-color: #eeeded;
		border-radius: 5px;
    	padding: 5px;
    	margin-top: 10px;
    	margin-left:120px;
    	border: 1px solid #ccc;
    	width: 100px;
    	cursor: pointer;
    	color: #545454;
	}
</style>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>자주 묻는 질문</p>
			</div>
			<div id="funding_history">
				<section class="page_content">
					<article id="page_content_tab">
						<nav>
							<li class="select_tab" id="list_all">
								<span>모두 보기</span>
								<span id="list_count">12</span>
							</li>
							<li id="list_ongoing">
								<span>메인 문의</span>
								<span id="list_count">8</span>
							</li>
							<li id="list_finish">
								<span>일반 문의</span>
								<span id="list_count">4</span>
							</li>
						</nav>
						<div class="search">
							<span><input type="text" placeholder="검색"></span>
						</div>
					</article>
					<article class="page_content_funding_list">
						<div class="funding_list" id="list_all">
							<div class="list_count"><i class="fas fa-list"></i>총 12건의 등록된 문의가 있습니다.</div>
						</div>
						<div class="funding_list" id="list_ongoing">
							<div class="list_count"><i class="fas fa-question"></i></i>총 8건의 메인 노출 문의가 있습니다.</div>
						</div>
						<div class="funding_list" id="list_finish">
							<div class="list_count"><i class="far fa-check-circle"></i></i>총 4건의 일반 문의가 있습니다.</div>
						</div>
					</article>
				</section>
			</div>
			<div id="admin_write">
				<a href="http://localhost:9090/tumblbugs/admin/faq_write"><button type="button" id="btnAdmin_write">새 질문 등록</button></a>
			</div>
			<div id="admin_qna">
				<table id="qna_list">
					<thead>
						<tr id="qna_list_item">
							<th>번호</th>
							<th>질문 유형</th>
							<th>리스트 번호</th>
							<th>제목</th>
							<th>등록 일시</th>
							<th>메인 노출</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list}">
							<tr id="qna_list_item2">
								<td>${vo.rno}</td>
								<td>${vo.faq_category }</td>
								<td>${vo.faq_list_num }</td>
								<td><a href="http://localhost:9090/tumblbugs/admin/faq_content?faq_num=${vo.faq_num}" id="td_a">${vo.faq_list_title}</a></td>
								<td>${vo.reg_date}</td>
								<c:choose>
									<c:when test="${vo.faq_main_check eq 'YES'}">
										<td style="color: #1e90ff;">${vo.faq_main_check}</td>
									</c:when>
									<c:otherwise>
										<td>${vo.faq_main_check}</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>