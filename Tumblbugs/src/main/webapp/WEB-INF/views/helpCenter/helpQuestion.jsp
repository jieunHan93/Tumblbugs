<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>텀블벅스 1:1문의</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$("#form1").css('display','none');
		$("#form2").css('display','none');
		$("#form3").css('display','none');
	    $("#select").change(function () {
			$("#form1").css('display','none');
			$("#form2").css('display','none');
			$("#form3").css('display','none');
			$('#form' + $(this).find('option:selected').attr('id')).show();
		});
	    
	    $("#btnQuestion").click(function() {
			if($("#question_email").val() == "") {
				alert("이메일을 입력해주세요");
				$("#question_email").focus();
				return false;
			}else if($("#question_title").val() == "") {
				alert("문의 제목을 입력해주세요");
				$("#question_title").focus();
				return false;
			}else if($("#question_ques_content").val() == ""){
				alert("문의 내용을 입력해주세요");
				$("#question_ques_content").focus();
				return false;
			}else if($(':checkbox[name="checkbox"]:checked').length<1) {
				alert("개인정보 수집·이용에 동의에 체크해주세요");
			}else{
				$("#spon1Form").submit();
			}
		});
	    
	    $("#btnQuestion2").click(function() {
			if($("#question_email").val() == "") {
				alert("이메일을 입력해주세요");
				$("#question_email").focus();
				return false;
			}else if($("#question_title").val() == "") {
				alert("문의 제목을 입력해주세요");
				$("#question_title").focus();
				return false;
			}else if($("#question_ques_content").val() == ""){
				alert("문의 내용을 입력해주세요");
				$("#question_ques_content").focus();
				return false;
			}else if($(':checkbox[name="checkbox"]:checked').length<1) {
				alert("개인정보 수집·이용에 동의에 체크해주세요");
			}else{
				$("#spon1Form").submit();
			}
		});
	    
	    $("#btnQuestion3").click(function() {
			if($("#question_email").val() == "") {
				alert("이메일을 입력해주세요");
				$("#question_email").focus();
				return false;
			}else if($("#question_title").val() == "") {
				alert("문의 제목을 입력해주세요");
				$("#question_title").focus();
				return false;
			}else if($("#question_ques_content").val() == ""){
				alert("문의 내용을 입력해주세요");
				$("#question_ques_content").focus();
				return false;
			}else if($(':checkbox[name="checkbox"]:checked').length<1) {
				alert("개인정보 수집·이용에 동의에 체크해주세요");
			}else{
				$("#spon1Form").submit();
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="help_header.jsp"></jsp:include>
	<div id="q_container">
		<nav id="sub-nav">
			<ul>
				<li><a href="#">텀블벅스 헬프센터</a></li>&nbsp;&nbsp;
				<li><span id="s_right">></span>&nbsp;&nbsp; 문의등록</li>
			</ul>
			<input type="search" id="query" placeholder="검색">
		</nav>
		<h1>텀블벅스에 문의하기</h1>
		<div id="q_warning">
			<ul>
				<li>이메일 주소와 함께 문의를 남겨주세요. 영업일 기준 2일 내에 답변 드리겠습니다.</li>
				<li style="margin-top: 0.5em;">특정 프로젝트에 관한 질문은 해당 프로젝트 페이지 <b>창작자에게 문의하기</b>를 이용해 주세요.</li>
			</ul>
		</div>
		<div id="q_type">
			<form action="spon1_proc" method="post" name="spon1Form" id="spon1Form" enctype="multipart/form-data">
				<h3>문의 유형</h3>
				<select id="select" name="question_category">
					<option>도움이 필요한 주제를 골라주세요</option>
					<option id="1" value="[후원자]">[후원자] 밀어주기(후원), 결제</option>
					<option id="1" value="[후원자]">[후원자] 후원내역 관리, 선물 수령</option>
					<option id="2" value="[창작자]">[창작자] 프로젝트 올리기, 공개검토</option>
					<option id="2" value="[창작자]">[창작자] 프로젝트 관리, 정산, 선물 실행</option>
					<option id="3" value="[일반]">[일반] 가입, 탈퇴, 계정 관리</option>
					<option id="3" value="[일반]">[일반] 사용상의 불편, 버그</option>
					<option id="3" value="[일반]">[일반] 기타 문의</option>
				</select>
				<div id="form1">
					<h3>텀블벅스에 가입된 이메일 주소 <b style="color:red;">*</b></h3>
					<input type="text" name="question_email" id="question_email">
					<p id="help_email">이 이메일 주소로 답변을 보내드립니다. 이 이메일을 확인하시기 어려우신 경우 문의 내용에 연락처<br>를 남겨주세요. 비회원이시면 사용하시는 이메일을 적어주세요.</p>
					<h3>문의 제목 <b style="color:red;">*</b></h3>
					<input type="text" name="question_title" id="question_title">
					<h3>문의 내용 <b style="color:red;">*</b></h3>
					<textarea name="question_ques_content" id="question_ques_content"></textarea>
					<h3>후원 번호</h3>
					<input type="text" name="question_spon_number" id="question_spon_number">
					<p id="help_email">이미 후원을 하셨다면 후원번호를 알려주세요. <a href="#" style="color:#1e90ff;">내 후원 현황</a>에서 확인할 수 있습니다.</p>
					<input type="checkbox" name="checkbox" style="display: inline-block;">
					<p id="help_id">&nbsp;&nbsp;개인정보 수집·이용에 동의합니다.<b style="color:red;">*</b></p>
					<p id="help_email">목적: 이용자 식별 및 문의 답변 / 제공 항목: 이메일 주소, 문의 내용 / 보유기간: 문의 해결 후 30일까지</p>
					<h3>첨부 파일</h3>
					<div id="h_fileUpload">
						<input type="file" name="question_qcfile" id="question_qfile">
						<span><a style="color:#1e90ff;">파일을 추가해 주세요</a></span>
					</div>
					<button type="button" id="btnQuestion">제출</button>
					<p id="help_footer">영업일 기준 최대 2일 내에 답변을 드리겠습니다. 조금만 기다려주세요!</p>
				</div>
				<div id="form2">
					<h3>텀블벅스에 가입된 이메일 주소 <b style="color:red;">*</b></h3>
					<input type="text" name="question_email" id="question_email">
					<p id="help_email">이 이메일 주소로 답변을 보내드립니다. 이 이메일을 확인하시기 어려우신 경우 문의 내용에 연락처<br>를 남겨주세요. 비회원이시면 사용하시는 이메일을 적어주세요.</p>
					<h3>문의 제목 <b style="color:red;">*</b></h3>
					<input type="text" name="question_title" id="question_title">
					<h3>문의 내용 <b style="color:red;">*</b></h3>
					<textarea name="question_ques_content" id="question_ques_content"></textarea>
					<h3>프로젝트 제목 또는 고유주소</h3>
					<input type="text" name="question_project_title" id="question_project_title">
					<p id="help_email">고유주소란 프로젝트 페이지 주소 중 뒷부분을 말합니다. (예: tumblbugs.com/project의 경우 'project')</p>
					<input type="checkbox" name="checkbox" style="display: inline-block;">
					<p id="help_id">&nbsp;&nbsp;개인정보 수집·이용에 동의합니다.<b style="color:red;">*</b></p>
					<p id="help_email">목적: 이용자 식별 및 문의 답변 / 제공 항목: 이메일 주소, 문의 내용 / 보유기간: 문의 해결 후 30일까지</p>
					<h3>첨부 파일</h3>
					<div id="h_fileUpload">
						<input type="file" name="question_qcfile" id="question_qfile">
						<span><a style="color:#1e90ff;">파일을 추가해 주세요</a></span>
					</div>
					<button type="button" id="btnQuestion2">제출</button>
					<p id="help_footer">영업일 기준 최대 2일 내에 답변을 드리겠습니다. 조금만 기다려주세요!</p>
				</div>
				<div id="form3">
					<h3>텀블벅스에 가입된 이메일 주소 <b style="color:red;">*</b></h3>
					<input type="text" name="question_email" id="question_email">
					<p id="help_email">이 이메일 주소로 답변을 보내드립니다. 이 이메일을 확인하시기 어려우신 경우 문의 내용에 연락처<br>를 남겨주세요. 비회원이시면 사용하시는 이메일을 적어주세요.</p>
					<h3>문의 제목 <b style="color:red;">*</b></h3>
					<input type="text" name="question_title" id="question_title">
					<h3>문의 내용 <b style="color:red;">*</b></h3>
					<textarea name="question_ques_content" id="question_ques_content"></textarea>
					<input type="checkbox" name="checkbox" style="display: inline-block;">
					<p id="help_id">&nbsp;&nbsp;개인정보 수집·이용에 동의합니다.<b style="color:red;">*</b></p>
					<p id="help_email">목적: 이용자 식별 및 문의 답변 / 제공 항목: 이메일 주소, 문의 내용 / 보유기간: 문의 해결 후 30일까지</p>
					<h3>첨부 파일</h3>
					<div id="h_fileUpload">
						<input type="file" name="question_qcfile" id="question_qfile">
						<span><a style="color:#1e90ff;">파일을 추가해 주세요</a></span>
					</div>
					<button type="button" id="btnQuestion3">제출</button>
					<p id="help_footer">영업일 기준 최대 2일 내에 답변을 드리겠습니다. 조금만 기다려주세요!</p>
				</div>
			</form>
		</div>
		<div id="q_question">
			<section id="sec2">
				<h2>자주 묻는 질문들</h2>
				<ul id="ul1">
					<c:forEach var="vo" items="${flist}">
						<li id="sec2_item"><a href="#">${vo.faq_list_title}</a></li>
					</c:forEach>
				</ul>
			</section>
		</div>
		<div id="q_partnership">
			<section id="sec2">
				<h2>파트너십 문의</h2>
				<ul id="ul2">
					<li id="sec2_item">텀블벅스에 기업 차원 협력을 제안하고 싶으신가요? 저희 <b><a href="#" id="partner_a" style="color:#1e90ff;">파트너십 이메일</a></b>
						<small>(partnership@tumblbugs.com)</small>로 문의 부탁드립니다.
					</li>
				</ul>
			</section>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>