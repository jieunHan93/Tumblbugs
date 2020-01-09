<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<style>
*{
list-style-type: none;
}
#passFound{
	width:1080px;
	margin: auto;
	padding: 100px 0px;
}
#passFound>section#section1 {
	width: 310px;
	padding: 30px;
	border: 1px solid #e4e4e4;
	box-shadow: 0 1px 2px 1px #efefef;
	border-radius: 5px;
	margin: auto;
	font-size: 10pt;
}
#passFound #b2 {
	color: rgba(0,0,0,.87);
	font-size: 18pt;
	font-weight: bold;
}

input#email {
	padding: 12px;
	width: 100%;
	border: 1px solid #e4e4e4;
	border-radius: 5px 5px 5px 5px; 
}
input#email:hover{
border-color: #1d85ea;
}
input#email:focus{
border-color: #1d85ea;
}
input#pw{
margin: 10px 0 0 0;
padding: 10px 40px 10px 10px;
width: 260px;
}
	button#btnPassFound{
		width: 100%;
		border: none;
		border-radius:5px;
		background-color:#1e90ff;
		color: white;
		margin-top: 10px;
		padding: 13px 0px;
		font-weight: bold;
	}
	button#btnPassFound:hover{
		border-color: #1d85ea;
	}
	p#b5{
		color: gray;
		line-height: 1.7;
		font-size: 10.5pt;
		padding: 20px 0px;
		border-top: 1px solid #e4e4e4;
		border-bottom: 1px solid #e4e4e4;
	}
	span#emailcheck,
	span#emailcheckform,
	span#email_true,
	span#email_false
	{
		color: #1e90ff;
		font-size: 12px;
	}
</style>
<script>
$(document).ready(function(){
	$("#emailcheck").hide();
	$("#emailcheckform").hide();
	$("#email_true").hide();
	$("#email_false").hide();
	
	/* $("#email").keyup(function(){
		$("#email_true").hide();
		$("#email_false").hide();
		if($("#email").val() == "" ){
			$("#emailcheck").show();
			$("#emailcheckform").hide();
			
		}else{
			$("#emailcheck").hide();
			$("#emailcheckform").hide();
			
			var emailVal = $("#email").val();
			var emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if (emailVal.match(emailExp) != null) {
				$("#emailcheck").hide();
				$("#emailcheckform").hide();
			  }
			  else {
				  $("#emailcheck").hide();
				  $("#emailcheckform").show();
			  }
		}
		
	}; */
	
	$("#btnPassFound").click(function(){
		 $.ajax({
			 url: "found_ajax?email="+$("#email").val(), 
			 success: function(result){
				if(result == '1'){
					$(location).attr('href', "http://localhost:9090/tumblbugs/found_proc?email="+$('#email').val());
				}else{
					alert("��ϵ��� ���� �̸����Դϴ�.");
				}		 		
			}
		});
				
	});
	
});
</script>
</head>
<body> 

<jsp:include page="../header.jsp"></jsp:include>
	<div id="passFound">
		<section id="section1">
				<div id="div1">
				
				<div id="b2">��й�ȣ ã��</div><br>
				<p id="b5">�Һ�� ���� �� ����Ͻ� �̸����� <br>
				�Է��Ͻø� ���� ��й�ȣ�� Ȯ���� <br>
				�� �ִ� ��ũ�� �����帳�ϴ�.</p>
				<form action="/tumblbugs/found_proc" method="get" class="login" id="login">
					<ul id="ul1">
						<li id="li1">
							<input type="text" name="email" id="email" placeholder="�����Ͻ� �̸��� �ּ�">
							<br>
							<!-- <span id="emailcheck">�̸����� �Է��� �ּ���.</span>
							<span id="emailcheckform">�̸����� ������ �ùٸ��� �ʽ��ϴ�.</span>
							<span id="email_true">�̸�������</span>
							<span id="email_false">�̸��Ͼ���</span> -->
						</li> 
						<li>
							<button type="button" id="btnPassFound">��й�ȣ ã��</button>
						</li>
					</ul>
				</form>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>