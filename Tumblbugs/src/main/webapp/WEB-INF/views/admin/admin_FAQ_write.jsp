<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>새 질문 등록</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/ckeditor/ckeditor.js"></script>
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<style>
body {background-color: #f7f7f7;}
div#admin_mainconent{
	margin: 0;
	margin-left: 320px;
}
div#admin_mainconent>div#admin_header{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
	width: 100%;
	height: 70px;
	line-height:70px;
	background-color: #ffffff;
	display: inline-block;
	color: #1e90ff;
}
div#admin_mainconent>div#admin_header p {
	margin-left: 20px;
}
	div#admin_answer {
		width: 1080px;
		margin-left: 20px;
	}
	table#answer{
		width: 1080px;
		margin-top: 20px;
		text-align: left;
	}
	table#answer tr th {
		background-color: #eeeded;
		text-align: center;
		width: 230px;
		height: 40px;
	}
	table#answer, table#answer tr th, table#answer tr td {
		border: 1px solid gray;
		border-collapse: collapse;
	} 
	table#answer tr td {
		background-color: #ffffff;
		padding-left: 10px;
		height: 30px;
	}
	table#answer tr:last-child td{
		background-color: #f7f7f7;
		border-left: 1px solid #f7f7f7;
		border-right: 1px solid #f7f7f7;
		border-bottom: 1px solid #f7f7f7;
		text-align: right;
	}
	table#answer tr:last-child td a button{
		background-color: #eeeded;
		padding: 10px;
		margin-top: 10px;
		border: 1px solid #ccc;
		width: 100px;
	}
	table#answer tr td textarea {
		width:300px;
		height:150px;
		margin: 10px 0px;
	}
</style>
<script>
	function Rradio_OnOff(id) {

	   if(id == "Radio_On_Spon"){
		   
	      document.all["Radio_On_Spon"].style.display = '';         // 보이게
	      document.all["Radio_On_Create"].style.display = 'none';  // 안보이게
	      document.all["Radio_On_Common"].style.display = 'none';  // 안보이게
	      
	   }else if(id == "Radio_On_Create"){
		   
	      document.all["Radio_On_Spon"].style.display = 'none';         // 안보이게
          document.all["Radio_On_Create"].style.display = '';  			// 보이게
          document.all["Radio_On_Common"].style.display = 'none';  		// 안보이게
          
	   }else if(id == "Radio_On_Common"){
		   
	      document.all["Radio_On_Spon"].style.display = 'none';         // 안보이게
          document.all["Radio_On_Create"].style.display = 'none';  		// 안보이게
          document.all["Radio_On_Common"].style.display = '';  			// 보이게 
          
	   }
	}
	
	$(function() {
		$("#btnInsert").click(function() {
			if($(':radio[name="faq_list_num"]:checked').length<1) {
				alert("리스트 번호를 선택해주세요");
				event.preventDefault();
			}else if($("#faq_category_explain").val() == "") {
				alert("유형 설명을 입력해주세요");
				$("#faq_category_explain").focus();
				return false;
			}else if($("#faq_list_title").val() == "") {
				alert("제목을 입력해주세요");
				$("#faq_list_title").focus();
				return false;
			}else if($("#faq_content").val() == null){
				alert("내용을 입력해주세요");
				$("#faq_content").focus();
				return false;
			}else if($(':radio[name="faq_main_check"]:checked').length<1) {
				alert("메인 노출 여부를 선택해주세요");
			}else{
				$("#faqForm").submit();
			}
		});
	});
	$(function() {
		var editorConfig = {
		   filebrowserUploadUrl : "http://localhost:9090/tumblbugs/fileupload.do", //이미지 업로드
		};
		ck = CKEDITOR.replace("faq_content", editorConfig);
		
		CKEDITOR.on('dialogDefinition', function( ev ){
		   var dialogName = ev.data.name;
		   var dialogDefinition = ev.data.definition;
		
		   switch (dialogName) {
		       case 'image': //Image Properties dialog
		       //dialogDefinition.removeContents('info');
		       dialogDefinition.removeContents('Link');
		       dialogDefinition.removeContents('advanced');
		       break;
		    }
		}); 
	});
</script>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>새 질문 등록</p>
			</div>
			<div id="admin_answer">
				<form action="faq_write_proc" method="post" name="faqForm" id="faqForm">
					<table id="answer">
						<tr>
							<th>유형 선택</th>
							<td>
								<input type="radio" value="후원자" name="faq_category" id="faq_category1" onclick="Rradio_OnOff('Radio_On_Spon');" checked="checked"/> 후원자센터&nbsp;&nbsp;
								<input type="radio" value="창작자" name="faq_category" id="faq_category2" onclick="Rradio_OnOff('Radio_On_Create');"/> 창작자센터&nbsp;&nbsp;
								<input type="radio" value="공통사항" name="faq_category" id="faq_category3" onclick="Rradio_OnOff('Radio_On_Common');"/> 일반
							</td>
						</tr>
						<tr id="Radio_On_Spon" style="display:'';">
							<th>리스트 번호</th>
							<td>
								<input type="radio" value="spon_1. 후원하기" name="faq_list_num" id="faq_list_num1"/> 1. 후원하기&nbsp;&nbsp;
								<input type="radio" value="spon_2. 결제하기" name="faq_list_num" id="faq_list_num2"/> 2. 결제하기&nbsp;&nbsp;
								<input type="radio" value="spon_3. 선물 전달받기" name="faq_list_num" id="faq_list_num3"/> 3. 선물 전달받기&nbsp;&nbsp;
								<input type="radio" value="spon_4. 기타" name="faq_list_num" id="faq_list_num4"/> 4. 기타&nbsp;&nbsp;
							</td>
						</tr>
						<tr id="Radio_On_Create" style="display: none;">
							<th>리스트 번호</th>
							<td>
								<input type="radio" value="create_1. 플랫폼 준비하기 " name="faq_list_num" id="faq_list_num5"/> 1. 플랫폼 알아보기&nbsp;&nbsp;
								<input type="radio" value="create_2. 펀딩 준비하기" name="faq_list_num" id="faq_list_num6"/> 2. 펀딩 준비하기&nbsp;&nbsp;
								<input type="radio" value="create_3. 프로젝트 올리기" name="faq_list_num" id="faq_list_num7"/> 3. 프로젝트 올리기&nbsp;&nbsp;
								<input type="radio" value="create_4. 후원자 만나기" name="faq_list_num" id="faq_list_num8"/> 4. 후원자 만나기&nbsp;&nbsp;
								<input type="radio" value="create_5. 선물 전달/마무리하기" name="faq_list_num" id="faq_list_num9"/> 5. 선물 전달/마무리하기&nbsp;&nbsp;
							</td>
						</tr>
						<tr id="Radio_On_Common" style="display: none;">
							<th>리스트 번호</th>
							<td>
								<input type="radio" value="common_1. 텀블벅스 소개" name="faq_list_num" id="faq_list_num10"/> 1. 텀블벅스 소개&nbsp;&nbsp;
								<input type="radio" value="common_2. 계정 설정 및 기타" name="faq_list_num" id="faq_list_num11"/> 2. 계정 설정 및 기타&nbsp;&nbsp;
							</td>
						</tr>
						<!-- <tr>
							<th>유형 설명</th>
							<td><input type="text" name="faq_category_explain" "id="faq_category_explain" style="width: 500px;"></td>
						</tr> -->
						<tr>
							<th>리스트 제목</th>
							<td><input type="text" name="faq_list_title" id="faq_list_title" style="width: 500px;"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="faq_content" id="faq_content"></textarea></td>
						</tr>
						<tr>
							<th>메인 노출 여부</th>
							<td>
								<input type="radio" value="YES" name="faq_main_check" id="faq_main_check1"/> 예&nbsp;&nbsp;
								<input type="radio" value="NO" name="faq_main_check" id="faq_main_check2"/> 아니오&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<a href="#"><button type="button" id="btnInsert" style="margin-right: 10px;cursor: pointer;">등록</button></a>
								<a href="#"><button type="button" style="margin-right: 10px;cursor: pointer;">삭제</button></a>
								<a href="http://localhost:9090/tumblbugs/admin/faq"><button type="button" style="cursor: pointer;">목록</button></a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>