<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_project_member.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		var table = $('#project_table').DataTable({
			 bPaginate: true, //페이징처리
             bLengthChange: true, // n개씩보기
             lengthMenu : [ [15, 30, -1], [15, 30, "전체"] ], // 10/25/50/All 개씩보기
             bAutoWidth: false, //자동너비
             ordering: true, //칼럼별 정렬
             searching: false, //검색기능
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
			<table id="project_table">
				<thead>
					<tr>
						<th class="no">번호</th>
						<th class="email">이메일</th>
						<th class="name">이름</th>
						<th class="reg_date">가입일</th>
						<th class="use_yn">활성 상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
					<tr>
						<td class="no">${vo.rno }</td>
						<td class="email"><a href="http://localhost:9090/tumblbugs/admin/member?email=${vo.email }">${vo.email }</a></td>
						<td class="name">${vo.name }</td>
						<td class="reg_date">${vo.reg_date }</td>
						<td class="use_yn">${vo.use_yn }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>