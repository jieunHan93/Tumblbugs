<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/project_content.css">
<style>
	* {margin: 0px; padding: 0px; font-family: "SpoqaHanSans";}
	html, body {height: 100%;}
</style>
<script>
	$(document).ready(function() {
		
		$("button#send").click(function(){
			if($("select#msg_type").val() == "문의 유형"){
				alert("문의 유형을 선택해주세요.")
			} else if($("textarea#msg_content").val() == ""){
				alert("문의 내용을 입력해주세요.")
				$("textarea#msg_content").focus();
			} else {
				alert("창작자에게 문의를 등록했습니다.");
				messageWrite.submit();
			}
		});
		
		
		$("#cancel").click(function() {
			location.href = document.referrer;
		});
	});
</script>
</head>
<body>
	<div id="sendMessage">
		<form id="messageWrite" name="messageWrite" action="http://localhost:9090/tumblbugs/messageWrite_proc" method="POST">
			<div id="message_header">창작자에게 문의하기</div>
			<div id="recipient">
				<label>받는 사람</label>
				<span>${name }</span>
			</div>
			<div id="request_type">
				<label>문의 내용</label>
				<select id="msg_type" name="msg_type">
					<option>문의 유형</option>
					<option>선물/후원</option>
					<option>프로젝트</option>
					<option>수령자 정보</option>
					<option>교환/환불</option>
					<option>배송</option>
					<option>기타</option>
				</select>
			</div>
			<div id="request_content"><textarea id="msg_content" name="msg_content" placeholder="프로젝트 진행자에게 문의하고 싶은 내용을 적어주세요"></textarea></div>
			<div id="message_footer">
				<button id="cancel" type="button"><i class="fas fa-times"></i> &nbsp;취소하기</button>
				<button id="send" type="button"><i class="fas fa-envelope"></i> &nbsp;보내기</button>
			</div>
			<input type="hidden" name="pj_id" value="${pj_id}">
		</form>
	</div>
</body>
</html>