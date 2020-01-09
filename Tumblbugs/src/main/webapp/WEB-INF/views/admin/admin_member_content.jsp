<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_project_member.css">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$("#btn_unreg").click(function() {
			var email = '${vo.email}';
			$.ajax({
				url: "http://localhost:9090/tumblbugs/admin/member_unreg_proc?email=" + email,
				success: function(result) {
					if(result != "0") {
						alert("비활성화 처리되었습니다.");
						location.href = "http://localhost:9090/tumblbugs/admin/member?email=" + email;
					} else {
						alert("비활성화 처리에 실패했습니다.");
					}
				}
			});
		});
		
		$("#btn_rereg").click(function() {
			var email = '${vo.email}';
			$.ajax({
				url: "http://localhost:9090/tumblbugs/admin/member_rereg_proc?email=" + email,
				success: function(result) {
					if(result != "0") {
						alert("활성화 처리되었습니다.");
						location.href = "http://localhost:9090/tumblbugs/admin/member?email=" + email;
					} else {
						alert("활성화 처리에 실패했습니다.");
					}
				}
			});
		});
	});
</script>
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
							<span style="background-image: url(http://localhost:9090/tumblbugs/upload/${vo.profile_simg})"></span>
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
						<c:choose>
							<c:when test="${vo.use_yn == 'n'}">
								<button id="btn_rereg" type="button">활성화하기</button>
							</c:when>
							<c:otherwise>
								<button id="btn_unreg" type="button">비활성화하기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="profile_pre">
					<div id="profile_pre_header_space"></div>
					<div id="profile_pre_header">
						<div>프로필 카드 미리보기</div>
						<div id="profile_pre_header_card">
							<span id="profile_pre_header_card_icon" style="background-image: url(http://localhost:9090/tumblbugs/upload/${vo.profile_simg})"></span>
							<span id="profile_pre_header_card_name">${vo.name }</span>
						</div>
					</div>
					<div id="profile_pre_middle"><a href="http://localhost:9090/tumblbugs/projects/${vo.member_id}"><i class="fas fa-check-circle"></i><span>${vo.pj_count}개의 프로젝트</span></a>의 창작자</div>
					<!-- <a href="http://localhost:9090/tumblbugs/myfunding"><div id="profile_pre_footer"><span>후훤 현황 자세히보기</span></div></a> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>