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
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="project_content">
		<input type="hidden" name="pj_id" value="PJ1">
		<jsp:include page="project_content_header.jsp"></jsp:include>
		<section id="menu_content">
			<div>
				<div class="menu_content" id="policy">
					<div id="fundingInfo_content">
						<div class="white_box" id="project_policy">
							<div class="subtitle">이 프로젝트의 환불 및 교환 정책</div>
							<div class="subContent" style="white-space:pre-wrap; text-align: justify">${pvo.pj_refund }<br></div>
						</div>
						<div class="white_box" id="reward_info">
							<div class="subtitle">상품정보 고시</div>
							<div class="subtitle" id="reward_category">${pvo.pj_class }</div>
						</div>
						<div class="white_box" id="request">
							<span class="subtitle">프로젝트에 대해 문의사항이 있으신가요?</span>
							<a href="http://localhost:9090/tumblbugs/sendMessage?pj_id=${pvo.pj_id}"><button type="button" id="btnSendMessage"><i class="fas fa-envelope"></i> &nbsp;창작자에게 문의하기</button></a>
						</div>
					</div>
				</div>
				<jsp:include page="project_content_aside.jsp"></jsp:include>
			</div>
		</section>
	</div>
</body>
</html>