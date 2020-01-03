<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<title>텀블벅스 :: tumblbugs</title>
   <link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
<style>
	*{
		font-family: SpoqaHanSans;
	}
	#start_agreement{
		width:35%;
		margin:auto;
		text-align:center;
		padding:150px 0px 180px 0px;
	}
	#start_agreement>section>div {
		border-bottom:1px solid rgb(239,239,239);
		padding:10px 0px 10px 0px;
	}
	#start_agreement>section>div:first-child{
		display:block;
		font-size:18pt;
		font-weight:bold;
		text-align:left;
		line-height:120%;
	}
	#start_agreement>section>div p {
		display:block;
		font-size:10pt;
		padding-top:10px;
		line-height:180%;
		color:#555555;
		text-align:left;
	}
	#start_agreement>section>div:nth-child(3){
		text-align:left;
		padding:15px 0px 15px 0px;
	}
	#start_agreement>section>div:nth-child(3)>a:first-child{
		border-right:1px solid rgb(239,239,239);
		padding-right:15px;
	}
	#start_agreement>section>div:nth-child(3)>a:last-child{
		padding-left:15px;
	}
	#start_agreement>section>div:nth-child(3)>a{
		font-size:10pt;
		line-height:120%;
		color:#1e90ff;
		font-weight:bold;
	}
	#start_agreement>section>div:nth-child(3)>a:hover{
		color:#1d85ea;
		text-decoration:none;
	}
	#start_agreement #check_list{
		text-align:left;
		padding-top:30px;
	}
	#start_agreement #check_list>div{
		vertical-align: middle;
	}
	#start_agreement #check_list input{
		display:none;
	}
	#start_agreement #check_list span.check_txt{
		display:inline-block;
		font-size:10pt;
		line-height:140%;
		font-weight:bold;
		position:relative;
		bottom:12px;
		text-align:left;
		width:95%;
		height:30px;
		padding-left:10px;
	}
	#start_agreement #check_list .agree_check_lb{
		border:1px solid #ccc;
		border-radius:3px;
		width:18px;
		height:18px;
		cursor:pointer;
	}
	#start_agreement #check_list>div:nth-child(2)>label {
		position:relative;
		bottom:15px;
		display:inline-block;
	}
	#start_agreement>section>div:last-child{
		text-align:left;
		border:none;
		padding-top:30px;
	}
	#start_agreement button{
		font-size:11pt;
		font-weight:bold;
		border:none;
		padding:8px 22px 8px 22px;
		color:white;
		background:#1e90ff;
		border-radius:5px;
	}
	#start_agreement button:hover{
		background:#1d85ea;
	}
</style>
<script>
	$(document).ready(function(){
		$(".agree_check_lb").click(function(){
			var check_status =$(this).attr("id"); 
			
			if(check_status == "no_check"){
				$(this).css('background-image','url(http://localhost:9090/tumblbugs/images/project_start/check.png)')
				.css('background-size','cover').css('border-color','gray');
				$(this).attr("id","yes_check");
			}else{
				$(this).css('background','none').css('border-color','#ccc');
				$(this).attr("id","no_check");
				
			}
		});
		
		$("#con_btn").click(function(){
			var check_len = $("input:checkbox").length;
			var sel_check = $("input:checkbox:checked").length;
			
		 	if(check_len == sel_check){
		 		$.ajax({url: "new_project_proc",
					success: function(data){
						location.href="http://localhost:9090/tumblbugs/project_start_upload?pj_id="+data;
		        }});
				
			}else{
				alert("계속하려면 모든 항목을 선택하세요.");
			} 
		});
		
		
	});
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div id="start_agreement">
		<section>
			<div>프로젝트를 올리기 전에 확인해 주세요.</div>
			<div><p>텀블벅은 공개 검토 절차를 통해 창작자님이 작성한 프로젝트가 텀블벅의 정책을 준수하는지 확인하고 있습니다.<br>
					아래 사항들을 확인한 후 프로젝트를 올려 주세요.</div>
			<div>
				<a href="#">텀블벅 프로젝트 규칙</a>
				<a href="#">창작자 자격 요건</a>
			</div>
			<div id="check_list">
				<div>
					<input type="checkbox" id="agree_check1">
					<label class="agree_check_lb" for="agree_check1" id="no_check"></label>
					<span class="check_txt">새로운 아이디어를 실현하기 위한 프로젝트입니다.</span>
				</div>
				<div>
					<input type="checkbox" id="agree_check2">
					<label class="agree_check_lb" for="agree_check2" id="no_check"></label>
					<span class="check_txt">이미 시판된 제품, 현금이나 지분 등 수익 제공, 선물 없는 단순 기부,
												성인 인증이 필요한 콘텐츠 등 기준에 맞지 않는 선물을 제공하지 않습니다.</span>
				</div>
				<div>
					<input type="checkbox" id="agree_check3">
					<label class="agree_check_lb" for="agree_check3" id="no_check"></label>
					<span class="check_txt">창작자의 신분증 혹은 사업자등록증, 국내 은행 계좌, 연락 가능한 본인 휴대폰 번호가 있습니다.</span>
				</div>
				<div>
					<input type="checkbox" id="agree_check4">
					<label class="agree_check_lb" for="agree_check4" id="no_check"></label>
					<span class="check_txt">창작자 대표자는 19세 이상 성인입니다. (미성년자 참여 방법은 자격 요건을 참고해 주세요)</span>
				</div>
			</div>
			<div><button type="button" id="con_btn">계속하기</button></div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>