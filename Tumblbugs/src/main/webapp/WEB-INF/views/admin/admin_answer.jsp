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
		//1:1문의 답변
		$("#btnAnswer").click(function() {
			if($("#question_ans_content").val() == "") {
				alert("답변을 등록해 주세요.");
				$("#question_ans_content").focus();
				return false;
			}else{
				var answer = confirm("다시 한번 확인부탁드립니다. 확인 시 메일이 발송됩니다.");
				if(answer == true) {
					$("#answerForm").submit();
				}
			}
		});
	});
</script>
<style>
body {background-color: #f7f7f7;}
div#admin_mainconent{
	display: inline-block;
	margin: 0;
	position: absolute;
	margin-left: 320px;
}
div#admin_mainconent>div#admin_header{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
	width: 1100px;
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
</style>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>1:1 문의 상세페이지</p>
			</div>
			<div id="admin_answer">
				<form action="answer_proc" method="post" name="answerForm" id="answerForm">
					<input type="hidden" name="question_email" value="jmoon0316@naver.com">
					<input type="hidden" name="question_title" value="[텀블벅스 문의 답변입니다]">
					<table id="answer">
						<tr>
							<th>문의 분류</th>
							<td>창작자</td>
							<th>문의 일시</th>
							<td>2019-12-02</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>jmy0316</td>
							<th>이름</th>
							<td>장문용</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>jmoon0316@naver.com</td>
							<th>연락처</th>
							<td>010-2548-9065</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">관리자님 문의입니다~</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">창작자는 어떻게 할 수 있나요?</td>
						</tr>
						<tr>
							<th>첨부 파일</th>
							<td colspan="3"><input type="file"></td>
						</tr>
						<tr>
							<th>답변</th>
							<td colspan="3"><textarea id="question_ans_content" name="question_ans_content"></textarea></td>
						</tr>
						<tr>
							<td colspan="5">
								<input type="hidden" name="question_num" value="${vo.question_num}">
								<a href="#"><button type="button" style="margin-right: 10px;cursor: pointer;" id="btnAnswer">저장</button></a>
								<a href="#"><button type="button" style="margin-right: 10px;cursor: pointer;">삭제</button></a>
								<a href="http://localhost:9090/tumblbugs/admin"><button type="button" style="cursor: pointer;">목록</button></a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>