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
				<li><span id="s_right">></span>&nbsp;&nbsp; â���� ����</li>
			</ul>
			<input type="search" id="query" placeholder="�˻�">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>â���� ����</h1>
				<p id="category_header_p">������Ʈ �������� �ݵ� ����, ���� ����, �ļ� ó�� �� �Ŀ��ڿ��� ����� �����Ͽ� �˷��帳�ϴ�.</p>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a1">1. �Һ���� �÷��� �˾ƺ���</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_1}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/createcenter/a1" id="doc">���� ${createCount1}�� ��� ����</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a2">2. �Һ���� �ݵ� �غ��ϱ�</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_2}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/createcenter/a2" id="doc">���� ${createCount2}�� ��� ����</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a3">3. �Һ������ ������Ʈ �ø���</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_3}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/createcenter/a3" id="doc">���� ${createCount3}�� ��� ����</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a4">4. �ݵ� �����ϰ� �Ŀ��� ������</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_4}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/createcenter/a4" id="doc">���� ${createCount4}�� ��� ����</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a5">5. �ݵ� ���� �� ���� �����ϱ�/�������ϱ�</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_5}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>