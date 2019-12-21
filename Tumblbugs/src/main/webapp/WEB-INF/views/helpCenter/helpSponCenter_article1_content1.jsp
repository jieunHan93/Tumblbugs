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
		<div id="article_container">
			<section id="article_sidebar">
				<h3>�� ������ ����</h3>
				<ul>
					<c:forEach var="vo" items="${list}" begin="0" end="9">
						<li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c1">${vo.faq_list_title}</a></li>
						<!-- <li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c2">�� �Ŀ���Ȳ�� �Ŀ������� ������ �ʾƿ�.</a></li>
						<li><a href="#">������Ʈ �о��ֱⰡ �����ΰ���?</a></li>
						<li><a href="#">���� �о��� ������Ʈ�� ��� Ȯ���� �� �ֳ���?</a></li>
						<li><a href="#">������ ������ ��� �ϳ���?</a></li>
						<li><a href="#">�̹� �ݵ��� ���� ������Ʈ���� ������ �� ���°ǰ���?</a></li>
						<li><a href="#">�����ڿ��� ������ �� �ִ� ������� � ���� �ֳ���?</a></li>
						<li><a href="#">�ϳ��� ������Ʈ���� ���� �� �о��ִ� �͵� �����Ѱ���?(���� �Ŀ�)</a></li>
						<li><a href="#">������ ������Ʈ�� ���� ���ݿ����� �߱��� �����Ѱ���?</a></li>
						<li><a href="#">�о��� ������Ʈ �����ڰ� �� �� �ִ� �� ������ ������ �ֳ���?</a></li>	 -->
					</c:forEach>									
				</ul>
				<a href="http://localhost:9090/tumblbugs/help/sponcenter/a1">������</a>
			</section>
			<article id="article">
				<div id="article_main">
					<div id="article_header">
						<h2 id="article_title">ũ���� �ݵ��� �Ŀ��̶� �����ΰ���?</h2>
						<p>16�ð� �� ������Ʈ</p>
					</div>
					<div id="article_info">
						${aaa}
						<!-- <h2 id="title_info">ũ�����ݵ��̶� ��������?</h2>
						<p>ũ�����ݵ��� ���̵��� ������ ������ ���� �ڱ��� ������ ���� �Ǵ� ���� 
						�ټ��� �����(Crowd)�κ��� ���� ���(Funding)�ϴ� ���� ���մϴ�.
						</p>
						<p>&nbsp;</p>
						<h2 id="title_info">�Һ�������� �ݵ��� � ������� ����ǳ���?</h2>
						<p>â���ڴ� ������� �ϴ� â�۹��� ���� �̾߱�� ���̵��, ��ü���� ��ȹ, ������ ���� ���� ���� ������Ʈ �������� �����Ͽ� �÷����� �Խ��մϴ�.
						 �Խõ� ������Ʈ�� �÷����� ���� ��Ư�� �ټ����� ����ǰ�, �̿��ڵ��� ���ϴ� ������Ʈ�� �о��ֱ�(�Ŀ�)�� ���� �ݵ��� �����Ͽ� �Ŀ��ڰ� �˴ϴ�.
						 ������ ��� ������� �ʰ� ������ ������ ������ ���� ��ǥ �ݾ��� �޼��� ��쿡�� ����˴ϴ�.
						 �Ŀ����� ������Ʈ ���� ��� ������ ��ǥ �ݾ׿� �������� ���� ��� ����� ������ ��ҵǸ� â���ڿ��� ���޵Ǵ� �ݾ��� �����ϴ�.
						</p>
						<p>������ �ݾ��� â���ڿ��� ���޵Ǿ� �Ŀ��ڿ� ����� ������Ʈ�� �����ϰ� ������ ����� ���� ���̰� �˴ϴ�.
						 �̸� ���� ������� â���� ������� �ݵ��� ������ �Ŀ��ڿ��� ������ �����˴ϴ�.
						</p>
						<p>â���ڴ� ���޹��� �ݾ��� �ݵ�� ������Ʈ�� ���� �Ŀ��ڿ� ����� â�۹��� ����� ���� ����ϰ�,
						 ������ ����Ѵ�� ���޵� �� �ֵ��� �ּ��� ����� ���ؾ� �մϴ�. ��, �Ұ����� ������ ���� �� ���� ���� �߻��� ���
						 â���ڴ� �Ŀ��ڿ��� �̸� ������ �����ϰ� �����ؾ� �� �ǹ��� �ֽ��ϴ�.
						 ���� �� ���и� ����� ������Ʈ�� ����� �ٸ� ���� ������ �߻��� ��� �� å���� â���ڿ��� �ֽ��ϴ�.
						</p>
						<p>&nbsp;</p>
						<h2 id="title_info">�о��ֱ�(�Ŀ�)�� �����ΰ���?</h2>
						<p>������Ʈ �о��ֱ�� â���ڵ��� �����ϴ� ������Ʈ�� ������ ������ �� �ֵ��� ������ �ݾ��� �����Ͽ� ���� ���Դϴ�.
						 �������� â���ڸ� ���� ������ ������ ���ϰ�, ������Ʈ�� ���� ��������� ������ �޾ƺ��ð� �˴ϴ�.
						</p>
						<p>�ٸ� �Һ������ �̷������ �ݵ��� ���� �������� ���� ���̵� �Ŀ��� ���� �Բ� �ϼ��س����� ���Դϴ�.
						 �� ������ �÷��� Ư���� �о��ֱ�(�Ŀ�)�� �ϼ��� ��ǰ�� �ֹ��޾� ��� ����ϴ� ���ſʹ� �ƶ��� �ٸ��ϴ�.
						 ���̵��� ����ǰ �ܰ迡�� �Ŀ��� �޴� ���̱⿡ ��ȹ�� ������Ʈ �� ������ ����� �޸� ����� ���ɼ��� �����ϴ� ���� ����Դϴ�.
						 �׷��� �Һ���� �Ŀ��� �Ϲ����� ���ſ� �ƶ��� ��¦ �ٸ����� �����ڴ� â���� ���� ���� �Ŀ��� �����ϴ� ������ �����ϰ� ������ å���� �ֽ��ϴ�.
						</p>
						<p>&nbsp;</p>
						<h2 id="title_info">�Һ���� �� �������� ������ �ϳ���?</h2>
						<p>�Һ���� â���� ���� ���ο� �õ��� �Ұ��ϰ� ���̵� �Ŀ��ڸ� ���� ���� ���� �� �ְ� �ϴ� �÷��� ���񽺸� �����մϴ�.</p> -->
					</div>
				</div>
				<footer>
					<div id="article_footer">
						<span id="s1">������ �Ǿ����ϱ�?</span>
						<div id="article_footer_ox">
							<a href="#">��</a>
							<a href="#">�ƴϿ�</a>
						</div>
						<span id="s2">550�� �� 517���� ������ �Ǿ��ٰ� �߽��ϴ�.</span>
					</div>
				</footer>
				<div id="article_relatives">
					<div id="recent_article">
						<h3>�ֱ� �� ����</h3>
						<ul id="ul_article">
							<li><a href="#">�� �Ŀ���Ȳ�� �Ŀ������� ������ �ʾƿ�.</a></li>
							<li><a href="#">������ ������ ��� �ϳ���?</a></li>
							<li><a href="#">�Һ�� ������Ʈ ��Ģ</a></li>
							<li><a href="#">�о��� ������Ʈ �����ڰ� �� �� �ִ� �� ������ ������ �ֳ���?</a></li>
							<li><a href="#">������ ������Ʈ�� ���� ���ݿ����� �߱��� �����Ѱ���?</a></li>
						</ul>
					</div>
					<div id="related_article">
						<h3>���� ����</h3>
						<ul id="ul_article">
							<li><a href="#">�ݵ� ������� ���ΰ���?</a></li>
							<li><a href="#">������Ʈ �ø����� ��� �ؾ� �ϳ���?</a></li>
							<li><a href="#">������ �����߽��ϴ�. ������� ��� �ϳ���?</a></li>
							<li><a href="#">�� �Ŀ���Ȳ�� �Ŀ������� ������ �ʾƿ�.</a></li>
							<li><a href="#">�Ŀ� ������ �����Ǵ� ǰ�� ���� �ʼ� Ȯ�λ���</a></li>
						</ul>
					</div>
				</div>
				<div id="article_more_question">
					<p>������ ���� ���� ã�� ���ϼ̳���?</p>
					<a href="http://localhost:9090/tumblbugs/help/helpq">1:1 �����ϱ�</a>
				</div>
			</article>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>