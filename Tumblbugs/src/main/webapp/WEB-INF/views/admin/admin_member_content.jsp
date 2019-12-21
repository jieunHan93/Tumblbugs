<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_project_member.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="admin_sidebar.jsp"></jsp:include>
	<div id="admin_project">
		<div id="admin_header">
			<p>회원 관리</p>
		</div>
		<div class="admin_member_content">
			<div id="mypage_profile_main_container">
				<div id="profile_editor">
					<div>
						<label class="profile_editor_label">프로필 사진</label>
						<div id="profilel_editor_img">
							<span></span>
						</div>
					</div>
					<div>
						<label class="profile_editor_label">아이디</label>
						<input type="text" value="${vo.email }" readonly>
					</div>
					<div>
						<label class="profile_editor_label">이름</label>
						<input type="text" class="form-control" value="${vo.name }" readonly>
					</div>
					<div>
						<label class="profile_editor_label">소개</label>
						<textarea class="form-control" readonly>${vo.intro }</textarea>
					</div>
					<div>
						<label class="profile_editor_label">웹사이트</label>
						<input type="text" class="form-control" value="${vo.website }" readonly>
					</div>
					<div id="profile_editor_phone">
						<label class="profile_editor_label">전화번호</label>
						<input type="text" class="form-control" value="${vo.phone }" readonly>
					</div>
					<div id="profile_button_div">
						<a href="http://localhost:9090/tumblbugs/admin/member"><button type="button">목록보기</button></a>
						<c:if test="${vo.use_yn == 'n' }">
						<a href="http://localhost:9090/tumblbugs/admin/member_unreg_proc"><button id="btn_unreg" type="button">탈퇴 처리하기</button></a>
						</c:if>
					</div>
				</div>
				<div id="profile_pre">
					<div id="profile_pre_header_space"></div>
					<div id="profile_pre_header">
						<div>프로필 카드 미리보기</div>
						<div id="profile_pre_header_card">
							<span id="profile_pre_header_card_icon"></span>
							<span id="profile_pre_header_card_name">${vo.name }</span>
						</div>
					</div>
					<div id="profile_pre_middle"><a href="http://localhost:9090/tumblbugs/myproject"><i class="fas fa-check-circle"></i><span>2개의 프로젝트</span></a>의 창작자</div>
					<a href="http://localhost:9090/tumblbugs/myfunding"><div id="profile_pre_footer"><span>후훤 현황 자세히보기</span></div></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>