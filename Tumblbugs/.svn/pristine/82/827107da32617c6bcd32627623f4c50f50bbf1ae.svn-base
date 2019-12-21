<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	body>section>div#div1{
		margin: auto;
		width:1080px;
		height: 200px; 
		background-color: white;
	}
	img#img1{
		margin: 50px 0 0 500px;
		width: 120px;
		height: 120px;
		display: table;
	}
	b#b1{
	
		margin: -20px 0 0 500px;
		display: table;		
															
	}
	div#div2{
		background-color: #f6f5f5; 
	}
	section#section1{
		display: table;
		margin: auto;
		width: 1080px;
		height: 400px;
	
		
	}
	button#allview{
		background-color: #f6f5f5;
		border-style: none;
		border-radius: 5px 5px 5px 5px;
		width: 150px;
		height: 40px;
	
	}
	button#allview:hover{
		background-color:#e9e9e9;
		
	}
	button#FundingProgress{
		margin: 20px 0 0 0;
		background-color: #f6f5f5;
		border-style: none;
		border-radius: 5px 5px 5px 5px;
		width: 150px;
		height: 40px;
	
	}
	button#FundingProgress:hover{
		background-color:#e9e9e9;
		
	}
	button#PaymentComplete{
		background-color: #f6f5f5;
		border-style: none;
		border-radius: 5px 5px 5px 5px;
		width: 150px;
		height: 40px;
		
	}
	button#PaymentComplete:hover{
		background-color:#e9e9e9;
	}
	b#allviewcount{
		background-color: #999999;
		border-radius: 5px 5px 5px 5px;
		margin: 0 0px 0 10px;
		padding: 0px 10px 0px 10px;
		color: white;
	}
	b#FundingProgresscount{
		background-color: #999999;
		border-radius: 5px 5px 5px 5px;
		margin: 0 0px 0 10px;
		padding: 0px 10px 0px 10px;
		color: white;
	}
	b#PaymentCompletecount{
		background-color: #999999;
		border-radius: 5px 5px 5px 5px;
		margin: 0 0px 0 10px;
		padding: 0px 10px 0px 10px;
		color: white;
	}
	input#SearchHistory{
		width: 350px;
		padding-left:20px;
		margin-left: 200px;
		border: 1px solid #e5e5e5;
		border-style:none;
		height: 40px;
		width: 400px;
		border-radius: 5px 5px 5px 5px;
	}
	button#magnifying{
		border:1px solid red;
		display:table;
		margin: -30px 0 0 1030px;
		background: none;
	}
	div#SponsorResultdiv{
		
		margin: 30px 0 0 0;
		display: table;
		width: 1080px;
		height: 0px;
	}
	span#SponsorResultspan{
		border-radius: 5px 5px 5px 5px;
		background-color: #eeeded;
		height: 50px;
		width: 1080px;
		display: table;
		padding: 10px 0 0 15px;
		margin-bottom: 10px;
	}
	
	div#resultlistall{
		border: 2px solid #eeeced;
		display: table;
		background-color: white;
		border-radius: 5px 5px 5px 5px;
		margin: 5px 0 0 0;
		width: 1080px;
		height: 260px;
	}
	s#resultlisttimenumber{
		border-bottom: 1px solid  #dbd9da;
		padding: 5px 0 0 20px;
		display: block;
		height: 35px;
	}
	b#Sponsornumber{
		float: right;
		padding: 0 20px 0 0; 
	}
	div#orderimgdiv{
		border-right: 1px solid
		display: table;
		width: 200px;
		height: 220px;
	}
	img#orderimg{
		display: table;
		margin: 30px 0 0 25px;
	}
	div#pundingproceeding{
		display: table;
		border: 1px solid #0078FF;
		border-radius: 5px 5px 5px 5px;
		margin: -240px 0 0 220px;	
		width: 120px;
		height: 30px;
		padding: 2px 0 0 15px;
	}
	div#pundingproceedinginfo{

		display: table;
		margin: 0 0 0 220px;
	}
	div#arrowimg{
		margin: -130px 0 0 1020px;
		display: table;
	}
	div#nosponsor{
		display: table;
		margin: 50px 0 0 480px;
	
	}
	d#etc1,d#etc2{
	display: table;
	margin: 0 0 0 -20px;
	}
</style>
<script >
$(document).ready(function(){
	$('.form1').show();
	/* nosponsor는 정보없을때 if문 추가예정 */
	$('.nosponsor1').hide();
	$('.nosponsor2').hide();
	$('.nosponsor3').hide();
	$('.form2').hide();
	$('.form3').hide();
	
	$('#allview').css('color', '#3a6ff2');
	$('#allviewcount').css('background', '#3a6ff2');
	
	$("#allview").click(function(){
		$('.form1').show();
		$('.form2').hide();
		$('.form3').hide();
		
		$('#allview').css('color', '#3a6ff2');
		$('#allviewcount').css('background', '#3a6ff2');
		
		$('#FundingProgress').css('color', '#999999');
		$('#FundingProgresscount').css('background', '#999999');
		
		$('#PaymentComplete').css('color', '#999999');
		$('#PaymentCompletecount').css('background', '#999999');
		
		
	 });
	
		$("#FundingProgress").click(function(){
			$(".form1").hide();
			$(".form2").show();
			$(".form3").hide();
			$('#allview').css('color', '#999999');
			$('#allviewcount').css('background', '#999999');
			
			$('#FundingProgress').css('color', '#3a6ff2');
			$('#FundingProgresscount').css('background', '#3a6ff2');
			
			$('#PaymentComplete').css('color', '#999999');
			$('#PaymentCompletecount').css('background', '#999999');
		});
		
		$("#PaymentComplete").click(function(){
			$(".form1").hide();
			$(".form2").hide();
			$(".form3").show();
			$('#allview').css('color', '#999999');
			$('#allviewcount').css('background', '#999999');
			
			$('#FundingProgress').css('color', '#999999');
			$('#FundingProgresscount').css('background', '#999999');
			
			$('#PaymentComplete').css('color', '#3a6ff2');
			$('#PaymentCompletecount').css('background', '#3a6ff2');
		});
	
});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="myFunding">
		<div id="page_title">
			<img alt="" src="http://localhost:9090/tumblbugs/images/kurby.gif" id="img1"><br>	
			<div>커비님의 후원 현황</div>
		</div>
		<div id="div2">
			<section id="section1">
				<div>
					<button type="button" id="allview" value="1">모두 보기 <b id="allviewcount">0</b> </button>
					<button type="button" id="FundingProgress">펀딩 진행중 <b id="FundingProgresscount">0</b></button>
					<button type="button" id="PaymentComplete">결제 완료 <b id="PaymentCompletecount">0</b></button>
					<input type="text" id="SearchHistory" placeholder="프로젝트,선물,창작자를 검색해주세요." >
					<button type="button" id="magnifying"><img src="http://localhost:9090/tumblbugs/images/magnifying.PNG" style="height: 20px;width:20px;"></button>
					
					<!-- 1번폼 -->
					<div id="SponsorResultdiv" class="form1">			
						<span id="SponsorResultspan"><img src="http://localhost:9090/tumblbugs/images/Threelineimage.PNG" style="width: 15px;height: 15px;"> 총 0건의 후원 결과가 있습니다.</span>	
						
						<div id="resultlistall">
							<s id="resultlisttimenumber">
								<b id="Sponsordate">date 2019.11.26</b>
								<b id="Sponsornumber">후원 번호 999999999</b>
							</s>
							<s>
								<div id="orderimgdiv"><img id="orderimg"src="http://localhost:9090/tumblbugs/images/orderimg.PNG" style="width: 150px;height: 150px;"></div>
								<div id="pundingproceeding">펀딩진행중?</div>
								<div id="pundingproceedinginfo">
								펀딩내역:단순하게적어보자1<br>
								[클립보드]	배송비포함<br>
								먼슬리<br>
								위클리<br>
								줄노트<br>
								아크릴보드<br>
								18,000원 후원<br>								
								</div>
								<div id="arrowimg"><img src="http://localhost:9090/tumblbugs/images/arrowimg.PNG" style="width: 25px;height: 40px;"></div>
							</s>
						</div>							
						<div id="nosponsor" class="nosponsor1"><img src="http://localhost:9090/tumblbugs/images/sponsorboximg.PNG" style="width: 150px;height: 150px;"><br> 후원 내역이 없습니다.</div>							
					</div>
					<!-- 2번폼 -->
					<div id="SponsorResultdiv" class="form2">
						<span id="SponsorResultspan"><img src="http://localhost:9090/tumblbugs/images/Rocketimages.PNG" style="width: 15px;height: 15px;"> 총 0건의 후원 결과가 있습니다.</span>	
						
						<div id="resultlistall">
							<s id="resultlisttimenumber">
								<b id="Sponsordate">date 2019.11.26</b>
								<b id="Sponsornumber">후원 번호 999999999</b>
							</s>
							<s>
								<div id="orderimgdiv"><img id="orderimg"src="http://localhost:9090/tumblbugs/images/orderimg.PNG" style="width: 150px;height: 150px;"></div>
								<div id="pundingproceeding">펀딩진행중?</div>
								<div id="pundingproceedinginfo">
								펀딩내역:단순하게적어보자2<br>
								[클립보드]	배송비포함<br>
								먼슬리<br>
								위클리<br>
								줄노트<br>
								아크릴보드<br>
								18,000원 후원<br>		
								</div>
								<div id="arrowimg"><img src="http://localhost:9090/tumblbugs/images/arrowimg.PNG" style="width: 25px;height: 40px;"></div>
							</s>
						</div>							
						<div id="nosponsor" class="nosponsor2"><img src="http://localhost:9090/tumblbugs/images/Rocketimages.PNG" style="width: 150px;height: 150px;"><br > <d id="etc1">펀딩 진행중인 후원이 없습니다</d></div>							
					</div>
					<!-- 3번폼 -->
					<div id="SponsorResultdiv" class="form3">					
						<span id="SponsorResultspan"><img src="http://localhost:9090/tumblbugs/images/Cardimg.PNG" style="width: 15px;height: 15px;"> 총 0건의 후원 결과가 있습니다.</span>	
						
						<div id="resultlistall">
							<s id="resultlisttimenumber">
								<b id="Sponsordate">date 2019.11.26</b>
								<b id="Sponsornumber">후원 번호 999999999</b>
							</s>
							<s>
								<div id="orderimgdiv"><img id="orderimg"src="http://localhost:9090/tumblbugs/images/orderimg.PNG" style="width: 150px;height: 150px;"></div>
								<div id="pundingproceeding">펀딩진행중?</div>
								<div id="pundingproceedinginfo">
								펀딩내역:단순하게적어보자3<br>
								[클립보드]	배송비포함<br>
								먼슬리<br>
								위클리<br>
								줄노트<br>
								아크릴보드<br>
								18,000원 후원<br>								
								</div>
								<div id="arrowimg"><img src="http://localhost:9090/tumblbugs/images/arrowimg.PNG" style="width: 25px;height: 40px;"></div>
							</s>
						</div>							
						<div id="nosponsor" class="nosponsor3"><img src="http://localhost:9090/tumblbugs/images/Cardimg.PNG" style="width: 150px;height: 150px;"><br> <d id="etc2">결제 완료된 후원이 없습니다.</d></div>							
					</div>
				</div>
			</section>			
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>