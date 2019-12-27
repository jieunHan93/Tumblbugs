<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style>
div#admin_banner_body{
	margin-left:320px;
	background-color: #f6f5f5;
	height:100%;
}

div#admin_header{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
	height: 70px;
	width:100%;
	line-height:70px;
	background-color: #ffffff;
	color: #1e90ff;
}
div#admin_header p {
	margin-left: 20px;
	cursor:default;
}
	
</style>
</head>
<body>
	<jsp:include page="admin_sidebar.jsp" />
	<div id="admin_banner_body">
		<section>
			<div id="admin_header">
				<p>배너 관리</p>
			</div>
			<div></div>
		</section>
	</div>
</body>
</html>