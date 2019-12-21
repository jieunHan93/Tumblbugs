<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_project_member.css">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		//반려 사유 글자수 체크
		
		$("#btn_reject_confirm").click(function() {
			if($("textarea").val() == "") {
				alert("반려 사유를 적어주세요.");
				$("textarea").focus();
			} else {
				project_reject_form.submit();
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="admin_sidebar.jsp"></jsp:include>
	<div id="admin_project">
		<div id="admin_header">
			<p>프로젝트 반려</p>
		</div>
		<div id="admin_project_reject_content">
			<form action="http://localhost:9090/tumblbugs/admin/project_reject_proc" method="post" name="project_reject_form">
				<input type="hidden" name="toEmailAddr" value="sooyoon126@gmail.com">
				<input type="hidden" name="title" value="[[공식] 따끈따끈 포근포근 핑크빈 핸드워머] 프로젝트의 검토 결과 안내드립니다.">
				<div id="form_title">프로젝트 반려</div>
				<div id="pj_title">
					<label>프로젝트 제목</label>
					<span>[공식] 따끈따끈 포근포근 핑크빈 핸드워머</span>
				</div>
				<div id="pj_creator">
					<label>받는 사람</label>
					<span>네코장님</span>
				</div>
				<div id="pj_reject_content">
					<textarea name="content" placeholder="프로젝트 창작자에게 전달할 반려 사유를 적어주세요."></textarea>
				</div>
				<div id="pj_reject_button_div">
					<a href="http://localhost:9090/tumblbugs/admin/project_detail"><button type="button" id="btn_project_detail">프로젝트 내용 보기</button></a>
					<button type="button" id="btn_reject_confirm"><i class="fas fa-paper-plane"></i>&nbsp;&nbsp;&nbsp;반려하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>