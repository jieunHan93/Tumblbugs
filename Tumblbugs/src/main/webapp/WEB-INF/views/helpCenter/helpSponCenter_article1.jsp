<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Һ���� 1:1����</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="help_header.jsp"></jsp:include>
	<div id="q_container">
		<nav id="sub-nav">
			<ul>
				<li><a href="http://localhost:9090/tumblbugs/help">�Һ���� ��������</a></li>&nbsp;&nbsp;
				<li><span id="s_right">></span>&nbsp;&nbsp; <a href="http://localhost:9090/tumblbugs/help/sponcenter">�Ŀ��� ����</a></li>&nbsp;&nbsp;
				<li><span id="s_right">></span>&nbsp;&nbsp; <a href="http://localhost:9090/tumblbugs/help/sponcenter/a1">1. ������Ʈ �о��ֱ�(�Ŀ��ϱ�)</a></li>
			</ul>
			<input type="search" id="query" placeholder="�˻�">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>1. ������Ʈ �о��ֱ�(�Ŀ��ϱ�)</h1>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<ul id="article_list">
						<c:forEach var="vo" items="${list}">
							<li id="article_list_item"><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c1">${vo.faq_list_title}</a></li>
							<!-- <li id="article_list_item"><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c2">�� �Ŀ���Ȳ�� �Ŀ������� ������ �ʾƿ�.</a></li>
							<li id="article_list_item"><a href="#">������Ʈ �о��ֱⰡ �����ΰ���?</a></li>
							<li id="article_list_item"><a href="#">���� �о��� ������Ʈ�� ��� Ȯ���� �� �ֳ���?</a></li>
							<li id="article_list_item"><a href="#">������ ������ ��� �ϳ���?</a></li>
							<li id="article_list_item"><a href="#">�̹� �ݵ��� ���� ������Ʈ���� ������ �� ���°ǰ���?</a></li>
							<li id="article_list_item"><a href="#">�����ڿ��� ������ �� �ִ� ������� � ���� �ֳ���?</a></li>
							<li id="article_list_item"><a href="#">�ϳ��� ������Ʈ���� ���� �� �о��ִ� �͵� �����Ѱ���?(���� �Ŀ�)</a></li>
							<li id="article_list_item"><a href="#">������ ������Ʈ�� ���� ���ݿ����� �߱��� �����Ѱ���?</a></li>
							<li id="article_list_item"><a href="#">�о��� ������Ʈ �����ڰ� �� �� �ִ� �� ������ ������ �ֳ���?</a></li>
							<li id="article_list_item"><a href="#">�ݵ� ���� ���� �Ŀ��� öȸ�ϰų� �ݾ��� ������ �� �ֳ���?</a></li> -->
						</c:forEach>
					</ul>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>