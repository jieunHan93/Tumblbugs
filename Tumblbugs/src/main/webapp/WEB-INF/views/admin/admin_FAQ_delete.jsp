<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>새 질문 등록</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/ckeditor/ckeditor.js"></script>
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
		width: 230px;
		height: 40px;
	}
	table#answer, table#answer tr th, table#answer tr td {
		border: 1px solid gray;
		border-collapse: collapse;
	} 
	table#answer tr td {
		background-color: #ffffff;
		padding-left: 10px;
		height: 50px;
		text-align: center;
		font-size:16px;
		font-weight: bold;
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
				<p>FAQ 삭제</p>
			</div>
			<div id="admin_answer">
				<form action="faq_delete_proc" method="post" name="faqForm" id="faqForm">
					<table id="answer">
						<tr>
							<td>정말 삭제하시겠습니까?</td>
						</tr>
						<tr>
							<td colspan="5">
								<input type="hidden" name="faq_num" value="${vo.faq_num}">
								<a><button type="submit" id="btnDelete" style="margin-right: 10px;cursor: pointer;">삭제완료</button></a>
								<a href="faq_content?faq_num=${vo.faq_num}"><button type="button" style="margin-right: 10px;cursor: pointer;">이전페이지</button></a>
								<a href="http://localhost:9090/tumblbugs/admin/faq"><button type="button" style="cursor: pointer;">목록</button></a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>