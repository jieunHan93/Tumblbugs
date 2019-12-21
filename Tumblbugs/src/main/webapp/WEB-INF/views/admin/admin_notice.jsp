<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ������ ����</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$(".funding_list#list_all").show();
		$("nav #list_all #list_count").css("background-color", "#1d85ea");
		
		//�� ����
		$("nav li").click(function() {
			var id = $(this).attr("id");
			
			$("nav li").removeClass("select_tab");
			$("nav li #list_count").css("background-color", "#999999");
			$(this).addClass("select_tab");
			$(this).find("#list_count").css("background-color", "#1d85ea");
			
			$(".funding_list").hide();
			$(".funding_list#" + id).show();
		});
		//1:1����
	});
</script>
<style>
body {background-color: #f7f7f7;}
div#admin_mainpage{
	/* display: inline-block; */
}
div#admin_mainconent{
	display: inline-block;
	margin: 0;
	position: absolute;
	margin-left: 320px;
}
div#admin_mainconent>div#admin_header{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
	width: 1100px;
	height: 70px;
	line-height:70px;
	background-color: #ffffff;
	display: inline-block;
	color: #1e90ff;
}
div#admin_mainconent>div#admin_header p {
	margin-left: 20px;
}

	#funding_history{
		position: absolute;
		margin-left: 20px;
	}
	#funding_history section.page_content {
		background-color: #f6f5f5;
	}
	#funding_history article {
		width: 1080px;
		margin: auto;
	}
	#funding_history li {list-style-type: none;}
	
	
	/* �� */
	#funding_history article#page_content_tab {
		padding: 20px 0px 20px 0px;
	}
	#funding_history #page_content_tab nav,
	#funding_history #page_content_tab li,
	#funding_history .search {
		display: inline-block;
		font-size: 10.5pt;
	}
	#funding_history #page_content_tab li {
		border-radius: 4px;
		padding: 8px 10px 8px 10px;
		margin-right: 8px;
		cursor: pointer;
		/* background-color: #eeeded; */
	}
	#funding_history #page_content_tab li:hover {
		background-color: rgba(0,0,0,.05);
	}
	#funding_history #page_content_tab li span#list_count {
		display: inline-block;
		margin-left: 10px;
		border-radius: 5px;
		width: 26px;
		font-size: 10pt;
		text-align: center;
		background-color: #999999;
		color: white;
	}
	
	#funding_history .select_tab {
		background-color: rgba(0,0,0,.05);
		color: #1d85ea;
	}
	
	/* �˻�â */
	#funding_history .search {
		float: right;
		text-align: right;
	}
	#funding_history .search input {
		border: 1px solid lightgray;
		border-radius: 5px;
		width: 350px;
		padding: 7px 7px 7px 12px;
	}
	
	/* �� n���� �Ŀ��� �ֽ��ϴ�. */
	#funding_history div.list_count {
		color: #545454;
		background-color: #eeeded;
		padding: 15px 15px 15px 15px;
		margin-bottom: 17px;
		border-radius: 5px;
	}
	.funding_list{
		display: none;
	}
	#funding_history div.list_count i {
		font-size:16px;
		margin-right: 15px;
		margin-left: 15px;
	}
	div#admin_notice {
		width: 1080px;
		position: absolute;
		margin: 200px 0px 0px 20px;
	}
	 table#notice_list {
		width: 1080px;
		text-align: center;
	}
	 table#notice_list, table#notice_list th, table#notice_list td {
	 	border: 1px solid gray;
		border-collapse: collapse;
	}
	 table#notice_list td {
	 	height: 30px;
	 }
	 table#notice_list tr#notice_list_item {
	 	background-color: #eeeded;
	 }
	 table#notice_list tr#notice_list_item2 {
	 	background-color: #ffffff;
	 } 
	 table#notice_list tr#notice_list_item2 a#td_a{
	 	text-decoration: underline;
	 	color: #1e90ff;
	 }
	 #notice_btn_div{
	 	display:inline-block;
	 }
	 #notice_write_btn{
	 	padding:8px 30px 8px 30px;
	 	position:relative;
	 	top:200px;
	 	right:102px;
	 	color:white;
	 	border:none;
	 	font-weight:500;
	 	border-radius:4px;
	 	background:#343434;
	 	letter-spacing:0.5px;
	 	cursor:pointer;
	 }
	 
</style>
<script>
	
</script>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>��������</p>
			</div>
		   <div id="funding_history">
				<section class="page_content">
					<article id="page_content_tab">
						<nav>
							<li class="select_tab" id="list_all">
								<span>��� ����</span>
								<span id="list_count">1</span>
							</li>
							<li id="list_ongoing">
								<span>��������</span>
								<span id="list_count">1</span>
							</li>
							<li id="list_finish">
								<span>�̺�Ʈ</span>
								<span id="list_count">0</span>
							</li>
						</nav>
						<div class="search">
							<span><input type="text" placeholder="�˻�"></span>
						</div>
					</article>
					<article class="page_content_funding_list">
						<div class="funding_list" id="list_all">
							<div class="list_count"><i class="fas fa-list"></i>�� 1���� �Խñ��� �ֽ��ϴ�.</div>
						</div>
						<div class="funding_list" id="list_ongoing">
							<div class="list_count"><i class="fas fa-question"></i></i>�� 1���� ���������� �ֽ��ϴ�.</div>
						</div>
						<div class="funding_list" id="list_finish">
							<div class="list_count"><i class="far fa-check-circle"></i></i>�� 0���� �̺�Ʈ�� �ֽ��ϴ�.</div>
						</div>
					</article>
				</section>
			</div>
			<div id="notice_btn_div">
				<a href="http://localhost:9090/tumblbugs/admin/notice_write"><button type="button" id="notice_write_btn">�۾���</button></a>
			</div>
			<div id="admin_notice">
				<table id="notice_list">
					<tr id="notice_list_item">
						<th>��ȣ</th>
						<th>�з�</th>
						<th>����</th>
						<th>�������</th>
						<th>�����Ȳ</th>
					</tr>
					
					<tr id="notice_list_item2">
						<td>2</td>
						<td>��������</td>
						<td><a href="http://localhost:9090/tumblbugs/admin/notice_content" id="td_a">�����ڴ� �����Դϴ�~</a></td>
						<td>2019-12-02</td>
						<td>������</td>
					</tr>
					<!-- <tr id="notice_list_item2">
						<td>3</td>
						<td>�Ϲ�</td>
						<td>bmlbmlbml</td>
						<td>��ȣ3</td>
						<td><a href="#" id="td_a">�����ڴ� �����Դϴ�~</a></td>
						<td>2019-12-02</td>
						<td>�亯�Ϸ�</td>
					</tr>
					<tr id="notice_list_item2">
						<td>3</td>
						<td>�Ϲ�</td>
						<td>bmlbmlbml</td>
						<td>��ȣ3</td>
						<td><a href="#" id="td_a">�����ڴ� �����Դϴ�~</a></td>
						<td>2019-12-02</td>
						<td>�亯�Ϸ�</td>
					</tr>
					<tr id="notice_list_item2">
						<td>3</td>
						<td>�Ϲ�</td>
						<td>bmlbmlbml</td>
						<td>��ȣ3</td>
						<td><a href="#" id="td_a">�����ڴ� �����Դϴ�~</a></td>
						<td>2019-12-02</td>
						<td>�亯�Ϸ�</td>
					</tr> -->
				</table>
			</div>
		</div>
	</div>
</body>
</html>