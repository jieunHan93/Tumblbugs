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
				<li><span id="s_right">></span>&nbsp;&nbsp; ���ǵ��</li>
			</ul>
			<input type="search" id="query" placeholder="�˻�">
		</nav>
		<h1>�Һ������ �����ϱ�</h1>
		<div id="q_warning">
			<ul>
				<li>�̸��� �ּҿ� �Բ� ���Ǹ� �����ּ���. ������ ���� 2�� ���� �亯 �帮�ڽ��ϴ�.</li>
				<li style="margin-top: 0.5em;">Ư�� ������Ʈ�� ���� ������ �ش� ������Ʈ ������ <b>â���ڿ��� �����ϱ�</b>�� �̿��� �ּ���.</li>
			</ul>
		</div>
		<div id="q_type">
			<h3>���� ����</h3>
			<select onchange="location.href=this.value">
				<option value="http://localhost:9090/tumblbugs/help/helpq">������ �ʿ��� ������ ����ּ���</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/spon1">[�Ŀ���] �о��ֱ�(�Ŀ�), ����</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/spon2">[�Ŀ���] �Ŀ����� ����, ���� ����</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/create1" selected="selected">[â����] ������Ʈ �ø���, ��������</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/create2">[â����] ������Ʈ ����, ����, ���� ����</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/common1">[�Ϲ�] ����, Ż��, ���� ����</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/common2">[�Ϲ�] ������ ����, ����</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/common3">[�Ϲ�] ��Ÿ ����</option>
			</select>
			<h3>�Һ������ ���Ե� �̸��� �ּ� <b style="color:red;">*</b></h3>
			<input type="text" id="h_common1">
			<p id="help_email">�� �̸��� �ּҷ� �亯�� �����帳�ϴ�. �� �̸����� Ȯ���Ͻñ� ������ ��� ���� ���뿡 ����ó<br>�� �����ּ���. ��ȸ���̽ø� ����Ͻô� �̸����� �����ּ���.</p>
			<h3>���� ���� <b style="color:red;">*</b></h3>
			<input type="text" id="h_common2">
			<h3>���� ���� <b style="color:red;">*</b></h3>
			<textarea></textarea>
			<h3>������Ʈ ���� �Ǵ� �����ּ�</h3>
			<input type="text" id="h_common1">
			<p id="help_email">�����ּҶ� ������Ʈ ������ �ּ� �� �޺κ��� ���մϴ�. (��: tumblbugs.com/project�� ��� 'project')</p>
			<input type="checkbox" style="display: inline-block;">
			<p id="help_id">&nbsp;&nbsp;�������� �������̿뿡 �����մϴ�.<b style="color:red;">*</b></p>
			<p id="help_email">����: �̿��� �ĺ� �� ���� �亯 / ���� �׸�: �̸��� �ּ�, ���� ���� / �����Ⱓ: ���� �ذ� �� 30�ϱ���</p>
			<h3>÷�� ����</h3>
			<div id="h_fileUpload">
				<input type="file">
				<span><a style="color:#1e90ff;">���� �߰�</a> �Ǵ� ������ ����� �巡��</span>
			</div>
			<button type="button">����</button>
			<p id="help_footer">������ ���� �ִ� 2�� ���� �亯�� �帮�ڽ��ϴ�. ���ݸ� ��ٷ��ּ���!</p>
		</div>
		<div id="q_question">
			<section id="sec2">
				<h2>���� ���� ������</h2>
				<ul id="ul1">
					<li id="sec2_item"><a href="#">ũ�����ݵ��� �Ŀ��̶� �����ΰ���?</a></li>
					<li id="sec2_item"><a href="#" style="margin-left: 12px;">������ �����߽��ϴ�. ������� ��� �ϳ���?</a></li>
					<li id="sec2_item"><a href="#">������ �� ���������� �����ϰ� �;��.</a></li>
					<li id="sec2_item"><a href="#" style="margin-left: 12px;">�Һ�� ������Ʈ ��Ģ</a></li>
					<li id="sec2_item"><a href="#">�ݵ� ������� ���ΰ���?</a></li>
					<li id="sec2_item"><a href="#" style="margin-left: 12px;">������Ʈ�� �ø����� ��� �ؾ� �ϳ���?</a></li>
					<li id="sec2_item"><a href="#">��� �ϸ� ������Ʈ ȫ���� �� �� �� �������?</a></li>
					<li id="sec2_item"><a href="#" style="margin-left: 12px;">��ݾ� ���� ������ �˰� �;��.</a></li>
				</ul>
			</section>
		</div>
		<div id="q_partnership">
			<section id="sec2">
				<h2>��Ʈ�ʽ� ����</h2>
				<ul id="ul2">
					<li id="sec2_item">�Һ������ ��� ���� ������ �����ϰ� �����Ű���? ���� <b><a href="#" style="color:#1e90ff;">��Ʈ�ʽ� �̸���</a></b>
						<small>(partnership@tumblbugs.com)</small>�� ���� ��Ź�帳�ϴ�.
					</li>
				</ul>
			</section>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>