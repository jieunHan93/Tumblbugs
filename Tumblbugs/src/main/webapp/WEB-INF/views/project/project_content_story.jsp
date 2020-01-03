<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/project_content.css">
<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="project_content">
		<input type="hidden" name="pj_id" value="PJ1">
		<jsp:include page="project_content_header.jsp"></jsp:include>
		<section id="menu_content">
			<div>
				<div class="menu_content" id="story">
					<div class="white_box" id="story_content">${pvo.pj_story }</div>
				</div>
				<jsp:include page="project_content_aside.jsp"></jsp:include>
			</div>
		</section>
	</div>
</body>
</html>