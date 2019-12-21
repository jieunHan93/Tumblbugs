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
body>div#logindiv1{

width:1080px;
margin: auto;

}
body>div#logindiv1>section#section1 {
border:1px solid #dcdcdc;
display: inline-block;
margin: 100px 0 100px 360px;
padding: 20px 50px 50px 50px;
box-shadow: 0px 0px 0px 1px rgba(0,0,0,0.1);
border-radius: 5px 5px 5px 5px; 
}



body>div#logindiv1>section#section1>div#div1>b#b2{
display: inline-block;
color:Gray;
font-size: 25px;
border-bottom: 1px solid #dcdcdc;
margin-bottom: 10px;
padding-right: 100px;
}



input#email {
margin: 20px 0 0 0;
padding: 10px 40px 10px 10px;
width: 260px;
border: 1px solid #dcdcdc;
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
button#btnlogin{
border  : none;
background  : none;
border-radius:5px 5px 5px 5px;
background-color:#1e90ff;
color: white;
margin: 20px 0 0 0 ;
padding: 13px 61px 13px 61px;
}
button#btnlogin:hover{
border-color: #1d85ea;
}


div#div3 a{
margin:-20px 0 0px 25px;
text-align: center;
color: #F07878;
text-decoration:none;
}
b#b4{
border-bottom: 1px solid #dcdcdc;
padding-right: 260px;
}
b#b5{
text-decoration: none;
color: Gray;
}
span#emailcheck,
span#emailcheckform{
color: #1e90ff;
font-size: 12px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#emailcheck").hide();
	$("#emailcheckform").hide();
	
	$("#email").focusout(function(){
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
		
	})
	
});
</script>
</head>
<body> 

<jsp:include page="../header.jsp"></jsp:include>
	<div id="logindiv1">
		<section id="section1">
				<div id="div1">
				
				<b id="b2">��й�ȣ ã��</b>
				
				<br><b id="b5">�Һ�� ���� �� ����Ͻ� �̸����� <br>
				�Է��Ͻø� �� ��й�ȣ�� ������ <br>
				�� �ִ� ��ũ�� �����帳�ϴ�.<br>
				���̽���/���̹��� �����Ͻ� ���,<br>
				���̽���/���̹� ������ ���̴�<br>
				�̸����� 	�Է����ּ���.</b>
					<form action="/idfound_proc" method="post" class="login" id="login">
						<ul id="ul1">
							<li id="li1">
								<b id="b4"></b><br>
								<input type="text" name="email" id="email" placeholder="�����Ͻ� �̸��� �ּ�">
								<br><span id="emailcheck">�̸����� �Է��� �ּ���.</span>
								<span id="emailcheckform">�̸����� ������ �ùٸ��� �ʽ��ϴ�.</span>
							</li> 
							
							<li>
								<button type="submit" id="btnlogin">��й�ȣ ��ũ �ޱ�</button>
							</li>
						</ul>
					</form>

					
				</div>
			
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>