<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String email = request.getParameter("email");%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<title>회원가입 메세지 페이지</title>
<style type="text/css">

#mainsection{
margin: auto;
width: 1080px;
height: 500px;
}
#maindiv{
border: 1px solid #2ac2ec;
border-radius:5px 5px 5px 5px;
width:500px;
height:300px;
margin: 150px 0 0 300px; 
display: table;
}
#subdiv{

display: table;
margin:10px 0 0 10px;
width: 480px;
height: 280px;
}
#alarm{
font-size:25px;
color:#2ac2ec;
margin: 10px 0 0 200px;
display: table;
}
#maincontent{

display:table;
height: 130px;
width: 400px;
margin: 0 0 0 40px;
}
#mainlink{
display: table;
margin: 10px 0 0 200px;
list-style: none;
color: #2ac2ec;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

		<section id="mainsection">
			<div id="maindiv">
				<div id="subdiv">
					<b id="alarm">알림</b><br>
					<b id="maincontent">신청하신 <%= email %>의 메일주소로 메일이 전송되었습니다.<br> 전송된 메일로 접속하여 인증 주소를 클릭하여 본인 인증해주세요.</b>
					<a href="http://localhost:9090/tumblbugs/index" id="mainlink">메인으로</a>

				</div>
			</div>
		</section>
		
<jsp:include page="../footer.jsp"></jsp:include>		
</body>
</html>