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
<script src="http://localhost:9090/tumblbugs/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>공지사항 삭제</p>
			</div>
		   <div id="funding_history">
				<div class="funding_list" id="list_all">
				</div>
			</div>
			<div id="admin_notice_delete">
				<div>정말 삭제하시겠습니까?</div>
				<div id="deleteBtnDiv">
					<a href="http://localhost:9090/tumblbugs/admin/notice_content?notice_id=${notice_id}"><button>뒤로</button></a>
					<a href="http://localhost:9090/tumblbugs/admin/notice"><button>목록</button></a>
					<a href="http://localhost:9090/tumblbugs/admin/notice_delete_proc?notice_id=${notice_id}"><button>삭제</button></a>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>