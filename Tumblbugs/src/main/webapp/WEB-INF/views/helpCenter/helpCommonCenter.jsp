<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
				<li><span id="s_right">></span>&nbsp;&nbsp; ���� ����</li>
			</ul>
			<input type="search" id="query" placeholder="�˻�">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>���� ����</h1>
				<p id="category_header_p">�Һ������ ���� �Ϲ����� ������ �� ���� ��뿡 ���� �������� �ȳ������.</p>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/commoncenter/a1">1. �Һ���� �Ұ�</a></h3>
					<ul id="article_list">
						<li id="article_list_item"><a href="#">�Һ���� ���񽺿� ����, ������ �����ϰ� �ͽ��ϴ�.</a></li>
						<li id="article_list_item"><a href="#">�Һ����(tumblbugs)�� �����ΰ���? </a></li>
						<li id="article_list_item"><a href="#">�� ��� �Һ������ ������ �� �ֳ���?</a></li>
					</ul>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/commoncenter/a2">2. ���� ���� �� ��Ÿ</a></h3>
					<ul id="article_list">
						<li id="article_list_item"><a href="#">���̹� ���̵�� ������ �� ���� �ʾƿ�.(������ ���� ����)</a></li>
						<li id="article_list_item"><a href="#">�Һ�����κ��� ����/īī�� �˸����� �޾Ҿ��.</a></li>
						<li id="article_list_item"><a href="#">�ָ��̳� ���Ͽ� �������� �ʴ� ���񽺴� �����ΰ���?</a></li>
						<li id="article_list_item"><a href="#">�������� ���� ������ ��� ������ �� �ֳ���?</a></li>
						<li id="article_list_item"><a href="#">��й�ȣ�� �ؾ���Ƚ��ϴ�. ��� �ϸ� ����?</a></li>
						<li id="article_list_item"><a href="#">������ ����� �̸��� �ּҴ� ��� ������ �� ������?</a></li>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/commoncenter/a2" id="doc">���� 7�� ��� ����</a>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>