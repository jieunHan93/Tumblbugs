<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관리자 페이지 메인</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
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
	div#admin_answer {
		width: 1080px;
		margin-left: 20px;
	}
	table#answer{
		width: 1080px;
		margin-top: 20px;
		text-align: left;
	}
	table#answer tr th {
		background-color: #eeeded;
		text-align: center;
	}
	table#answer, table#answer tr th, table#answer tr td {
		border: 1px solid gray;
		border-collapse: collapse;
	} 
	table#answer tr td {
		background-color: #ffffff;
		padding-left: 10px;
		height: 30px;
	}
	table#answer tr:last-child td{
		background-color: #f7f7f7;
		border-left: 1px solid #f7f7f7;
		border-right: 1px solid #f7f7f7;
		border-bottom: 1px solid #f7f7f7;
		text-align: right;
	}
	table#answer tr:last-child td a button{
		background-color: #eeeded;
		padding: 10px;
		margin-top: 10px;
		border: 1px solid #ccc;
		width: 100px;
	}
	table#answer tr td textarea {
		width:300px;
		height:150px;
		margin: 10px 0px;
	}
	#qfile_loc{
		display: block;
		position: relative;
		width: 120px;
		top:-22px;
		left:200px;
		background-color: white;
	}
</style>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>FAQ 상세페이지</p>
			</div>
			<div id="admin_answer">
				<table id="answer">
					<tr>
						<th>질문 유형</th>
						<td>${vo.faq_category}</td>
					</tr>
					<tr>
						<th>리스트 번호</th>
						<td>${vo.faq_list_num}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${vo.faq_list_title}</td>
					</tr>
					<tr>
						<th>등록 일시</th>
						<td>${vo.reg_date}</td>
					</tr>
					<tr>
						<th>메인 노출</th>
						<td>${vo.faq_main_check}</td>
					</tr>
					<tr>
						<td colspan="5">
							<input type="hidden" name="faq_num" value="${vo.faq_num}">
							<a href="faq_update?faq_num=${vo.faq_num}"><button type="button" style="margin-right: 10px;cursor: pointer;" id="btnAnswer">수정</button></a>
							<a href="faq_delete?faq_num=${vo.faq_num}"><button type="button" style="margin-right: 10px;cursor: pointer;">삭제</button></a>
							<a href="http://localhost:9090/tumblbugs/admin/faq"><button type="button" style="cursor: pointer;">목록</button></a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>