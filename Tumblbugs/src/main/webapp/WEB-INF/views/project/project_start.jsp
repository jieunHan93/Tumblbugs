<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Һ����� :: tumblbugs</title>
   <link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<style>
	*{
		font-family: SpoqaHanSans;
	}
	#project_start{
		width:100%;
	}
	#project_start #start_sec1{
		height:420px;
		background: linear-gradient(135deg, rgb(74,186,164),rgb(214,146,70),rgb(217,98,74),rgb(184,73,93),rgb(140,51,120)) fixed;
	/* 	background-image: url('http://localhost:9090/tumblbugs/images/project_start/project_start_back1.png'); */
		background-size: cover;
		text-align:center;
		margin:auto;
	}
	#project_start #start_title_img{
		display:inline-block;
	}
	#project_start #start_title_img img{
		width:250px;
		position:relative;
		top:40px;
		right:50px;
	}
	#project_start #start_title_txt{
		display:inline-block;
		position:relative;
		top:72px;
	}
	#project_start #start_sec1>div{
		color: white;
		margin:auto;
	}
	#project_start #start_sec1>div>div:first-child label{
		display:block;
		font-size:30pt;
		font-weight:bold;
		text-align:left;
		line-height:120%;
	}
	#project_start #start_sec1>div>div:nth-child(2) label{
		display:block;
		text-align:left;	
		font-size:15pt;
	}
	#project_start #start_sec1>div>div:last-child{
		float:left;
		padding-top:20px;
	}	
	#project_start #start_sec1  #start_btn button{
		font-size:15pt;
		font-weight:bold;
		border:none;
		padding:14px 45px 14px 45px;
		color:rgb(241,92,72);
		background:rgb(255,233,85);
		border-radius:5px;
	}
	#project_start section:nth-child(2){
		background:white;
		height:420px;
		margin:auto;
	}
	#project_start section:nth-child(3){
		background:rgb(246,245,245);
		height:675px;
	}
	#project_start section:nth-child(4){
		background:white;
		height:610px;
		margin:auto;
	}
	#project_start section:nth-child(2)>div{
		display:inline-block;
	}
	#project_start #start_sec2_txt{
		position:absolute;
		left:26%;
		padding-top:83px;
	}
	#project_start section:nth-child(2)>div>div:first-child>label{
		display:block;
		font-size:22pt;
		font-weight:bold;
		text-align:left;
		margin:auto;
		letter-spacing:0.5px;
	}
	#project_start section:nth-child(2)>div>div:nth-child(2)>p{
		display:block;
		width:400px;
		font-size:11pt;
		padding-top:30px;
		line-height:180%;
		letter-spacing:1px;
		color:#555555;
	}
	#project_start section:nth-child(2) #project_start_img1{
		float:right;
		width:700px;
		height:420px;
	    background-image: url('http://localhost:9090/tumblbugs/images/project_start/project_start_img1.jpg');
	    background-size:100%;
	    background-repeat:no-repeat;
		overflow:hidden;
	}
	#project_start section:nth-child(3){
		text-align:center;
	}
	#project_start #start_sec3_txt{
		margin:auto
	}
	#project_start #start_sec3_txt div{
		margin:auto;
	}
	#project_start #start_sec3_txt>div:first-child{
		width:920px;
		display:inline-block;
		font-size:22pt;
		font-weight:bold;
		text-align:left;
		margin:auto;
		padding-top:40px;
		letter-spacing:0.5px;
	}
	#project_start #start_sec3_txt p{
		display:inline-block;
		width:920px;
		font-size:11pt;
		padding-top:30px;
		line-height:180%;
		color:#555555;
		text-align:left;
	}
	#project_start section:nth-child(3) li {
		display:inline-block;
		text-align:center;
		padding:20px 30px 20px 30px;
	}
	#project_start section:nth-child(3) li div {
		padding-top:15px;
	}
	#project_start section:nth-child(3) li div:nth-child(2){
		font-size:13pt;
		font-weight:bold;
		letter-spacing:0.5px;
	}
	#project_start section:nth-child(3) li div:nth-child(3){
		width:285px;
		font-size:11pt;
		letter-spacing:0.5px;
		line-height:180%;
		color:#555555;
	}
	#project_start section:nth-child(3) li img{
		width:170px;
	}
	#project_start #start_btn2{
		text-align:center;
	}
	#project_start section:nth-child(3) button{
		font-size:13pt;
		font-weight:bold;
		border:none;
		padding:12px 32px 12px 32px;
		color:white;
		background:#1e90ff;
		border-radius:5px;
	}
	
	
	#project_start section:nth-child(3) button:hover{
		background:#1d85ea; 
		transition: all 0.2s;
	}
	#project_start section:nth-child(4){
		display:block;
		text-align:center;
	}
	#project_start section:nth-child(4)>div:first-child{
		width:920px;
		display:inline-block;
		font-size:22pt;
		font-weight:bold;
		text-align:left;
		margin:auto;
		padding-top:40px;
		letter-spacing:0.5px;
	}
	#project_start section:nth-child(4) ul{
		padding-top:20px;
	}
	#project_start section:nth-child(4) li{
		display:inline-block;
		padding:30px 20px 0px 20px;
		text-align:left;
	}
	#project_start section:nth-child(4) li div:first-child{
		font-size:15pt;
		font-weight:bold;
		padding-bottom:15px;
	}
	#project_start section:nth-child(4) li:first-child div:first-child{
		border-bottom:5px solid rgb(255,230,230);
	}
	#project_start section:nth-child(4) li:nth-child(2) div:first-child{
		border-bottom:5px solid rgb(230,237,255);
	}
	#project_start section:nth-child(4) li:nth-child(3) div:first-child{
		border-bottom:5px solid rgb(223,248,252);
	}
	#project_start section:nth-child(4) li:first-child div:last-child button{
		background:rgb(255,230,230);
	}
	#project_start section:nth-child(4) li:nth-child(2) div:last-child button{
		background:rgb(230,237,255);
	}
	#project_start section:nth-child(4) li:nth-child(3) div:last-child button{
		background:rgb(223,248,252);
	}
		#project_start section:nth-child(4) li:first-child div:last-child button:hover{
		background:rgb(255,181,181);
		transition: all 0.2s;
	}
	#project_start section:nth-child(4) li:nth-child(2) div:last-child button:hover{
		background:rgb(179,200,255);
		transition: all 0.2s;
	}
	#project_start section:nth-child(4) li:nth-child(3) div:last-child button:hover{
		background:rgb(185,239,250);
		transition: all 0.2s;
	}
	#project_start section:nth-child(4) .start_btn3{
		position:relative;
		bottom:300px;
	}
	#project_start section:nth-child(4) .start_btn3 button{
		font-size:10pt;
		font-weight:bold;
		border:none;
		width:100%;
		padding:9px 0px 9px 0px;
		border-radius:4px;
	}
	#project_start section:nth-child(4) li div:nth-child(2){
		padding-top:15px;
		width:280px;
		font-size:13pt;
	}
	#project_start section:nth-child(4) p{
		width:280px;
		height:500px;
		font-size:11pt;
		line-height:180%;
		color:#444444;
		padding-top:30px;
	}
	#project_start section:nth-child(5){
		height:400px;
		background:rgb(246,245,245);
		margin:auto;
		text-align:center;
	}
	#project_start section:nth-child(5)>div:first-child{
		width:920px;
		display:inline-block;
		font-size:22pt;
		font-weight:bold;
		text-align:left;
		margin:auto;
		padding-top:40px;
		letter-spacing:0.5px;
	}
	#project_start section:nth-child(5)>div:nth-child(2){
		width:920px;
		margin:auto;
	}
	#project_start section:nth-child(5)>div:nth-child(2) p{
		display:block;
		font-size:11pt;
		padding-top:30px;
		line-height:180%;
		color:#333333;
		text-align:left;
	}
	#project_start section:nth-child(5) a{
		color:rgb(250,100,98);
	}
	#project_start section:nth-child(5) li>div:first-child{
		font-size:15pt;
		font-weight:bold;
		text-align:left;
	}
	#project_start section:nth-child(5) li{
		padding:0px 5px 0px 5px;
	}
	#project_start section:nth-child(5) li p{
		width:300px;
		height:150px;
		display:block;
		font-size:10pt;
		padding-top:10px;
		line-height:180%;
		color:#333333;
		text-align:left;
	}
	#project_start section:nth-child(5) li{
		display:inline-block;
		padding-top:20px;
	}
	#project_start section:nth-child(6){
		width:100%;
		height:425px;
		background: linear-gradient(135deg, rgb(148,70,210),rgb(117,76,215),rgb(94,95,213),rgb(59,147,202)) fixed;
		margin:auto;
		text-align:center;
	}
	#project_start #start_sec6_txt {
		padding-top:45px;
	}
	#project_start #start_sec6_txt div:first-child{
		color:white;
		display:inline-block;
		font-size:30pt;
		font-weight:bold;
		text-align:left;
		line-height:120%;
		padding-bottom:30px;
	}
	#project_start #start_sec6_txt div:nth-child(2) label{
		color:white;
		display:block;
		font-size:13pt;
		line-height:120%;
		letter-spacing:0.5px;
	}
	#project_start #start_sec6 #start_btn{
		padding-top:30px;
	}
	#project_start #start_sec6 #start_btn button{
		font-size:15pt;
		font-weight:bold;
		border:none;
		padding:14px 45px 14px 45px;
		color:rgb(241,92,72);
		background:rgb(255,233,85);
		border-radius:4px;
	}
	#project_start #start_sec6>div:last-child{
		padding-top:30px;
	}
	#project_start #start_sec6>div:last-child>label{
		color:white;
		display:block;
		font-size:9pt;
		line-height:120%;
		letter-spacing:0.5px;
	}
	#project_start #start_sec6 span{
		border-bottom:1px solid white;
		padding-bottom:2px;
	}
	#project_start #start_btn>button:hover{
		box-shadow: 0px 0px 12px 12px rgba(249,249,249,0.2);
		transition: all 0.2s;
	}
</style>
<script>
	$(document).ready(function(){
		$(".go_agree_btn").click(function(){
			location.href="http://localhost:9090/tumblbugs/project_start_agreement";
		});
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="project_start">
		<section>
			<div id="start_sec1">
				<div id="start_title_img">
					<img src="http://localhost:9090/tumblbugs/images/project_start/project_start_title1.png"/>
				</div>
				<div id="start_title_txt">
					<div>
						<label>���� �� ������Ʈ ���̵��,</label> 
						<label>�Һ������� ���Ƿ�.</label> 
					</div>
					<div>
						<label>ũ�����ݵ����� ������Ʈ�� ���� �ڱݵ� ������,</label>  
						<label>����� �Ŀ��� ��Ʈ��ũ�� Ȯ���� �� �ֽ��ϴ�.</label> 
					</div>
					<div id="start_btn"><button type="button" class="go_agree_btn" >���� �����ϱ�</button></div>
				</div>
			</div>
		</section>
		<section>
			<div id="start_sec2_txt">
				<div>
					<label>�Һ������� �ݵ��� ������</label> 
					<label>12,000�� ������Ʈ�� �Բ� �ϼ���.</label>
				</div>
				<div><p>
						������, ��ȭ, ����, ����, �丮, �м�, �̺�Ʈ ��<br> �о߸� ���� �� ���� ������ â���ڿ� â���ڵ��� 
						������Ʈ���� ���ϰ��� �ö���� �Һ����� �ѱ����� ���� Ȱ��ȭ�� ũ�����ݵ� Ŀ�´�Ƽ�Դϴ�. 
						���ݲ� 12,000�� �Ѵ� â������ �õ����� 70�� ���� �Ŀ��ڸ� ���� ���� ���Խ��ϴ�.</div>
			</div>			
			<div id="project_start_img1"></div>
		</section>	
		<section>
			<div id="start_sec3_txt">
				<div>���� ������ �� �ֽ��ϴ�.</div>
				<div><p>��ũ�����ݵ����� ������� ���� �Һ����� ����� �ʽ��ϴ�. 
					  ������ ���� ������ �����ְų� �������� ������ ���� ������ ������ �ʿ����� �ʽ��ϴ�. 
					  �ݵ����� ���� �ݾ��� ���� ���� ��ǰ �Ǵ� Ư���� ���� �� ��ü�� �Ŀ��ڵ�� ����ϰ� �����ϸ� �˴ϴ�.</div>
			</div>	  
			<div>
				<ul>
					<li>
						<div><img src="http://localhost:9090/tumblbugs/images/project_start/project_start_img2.png"/></div>
						<div>������Ʈ �ø���</div>
						<div>â�� ���̵� �Ұ��ϴ� ������Ʈ �������� �ۼ��մϴ�. �Ŀ��ڵ鿡�� �ݾ״뺰 Ư���� �������� ����մϴ�.</div>
					</li>
					<li>
						<div><img src="http://localhost:9090/tumblbugs/images/project_start/project_start_img3.png"/></div>
						<div>�ݵ� �����ϱ�</div>
						<div>������ �Ⱓ ���� �Ŀ��ڸ� ������ ���� ������ ȫ���մϴ�. ��ǥ �ݾ��� �޼��ؾ߸� �Ŀ����� ���޵˴ϴ�.</div>
					</li>
					<li>
						<div><img src="http://localhost:9090/tumblbugs/images/project_start/project_start_img4.png"/></div>
						<div>����� �����ϱ�</div>
						<div>���޹��� �Ŀ������� â�ۿ� �����մϴ�. ƴƴ�� ��ô������ �˸���, ����� ������ �����ϸ� ������Ʈ�� �����ϴ�.</div>
					</li>
				</ul>
			</div>
			<div><button type="button" id="start_btn2" class="go_agree_btn">������Ʈ �ø��� �����ϱ�</button></div>
		</section>
		<section>
			<div>�������Գ� ���� �ֽ��ϴ�.</div>
			<div>
				<ul>
					<li>
						<div>â����</div>
						<div>��� �����ߴ� �۾��̳� ���� �ϴ� â�� ���̵� �������� �ܰ�� ������ų ��ȸ�� ��ƺ�����.</div>	
						<div><p>�����ϴ� â���ڿ��� �Һ����� ������, ������ ���� ��ĵ麸�� �ξ� �������̰� ���������� ���� �� �۾��� �˸� �� �ִ� ���ο� ���Դϴ�. 
							�̹� �������� ������ Ȯ���� �۰���� �ż��� ��ȹ�� ���� �ҵ��� ������ ���ο� â���� ����� �� ����?</div>	
						<div class="start_btn3"><button type="button">â���� ������� ����</button></div>	
					</li>
					<li>
						<div>�귣��</div>
						<div>�ʱ� ����̳� ��� �δ� ���� ���ο� ��ǰ�̳� ���񽺸� ��Ī�ϰ� �ھ� �� ���̽��� Ȯ���ϼ���.</div>	
						<div><p>�귣�忡 �̸��� ���߽�Ű�� ���丮�� ���� ������ ȿ���� �ش�ȭ�� �� �ֽ��ϴ�. 
								Ʈ�����ϸ鼭�� ������ ����� ��ġ�� �����Ǵ� ���ο� ������ �Һ� â���� �����޴� �Һ������� ���� �Ŀ��ڵ��� �ŷڴ� �Ϲ� 
								��Ŀ�ӽ��������� �ξ� ���� ���� ���� �� ���̽��� �Ǿ��� ���Դϴ�.</div>	
						<div class="start_btn3"><button type="button">�귣�� ������� ����</button></div>	
					</li>
					<li>
						<div>ķ����</div>
						<div>����Ʈ �ִ� ķ������ ���� ��ȸ�� �̽��� ���Ӱ����� ������ �Ŀ����� ��ȯ���Ѻ�����.</div>	
						<div><p>����̳� �Ҽȹ̵��� �������� �̽����� ��ü���� �ൿ���� ��ȯ��Ű�� ���� �Һ��� ������Ʈ�� �����Դϴ�. 
								���Ӱ� ���� ��ġ��������ȸ� ������� �ָ�޴� �Һ��� �ݵ����� �� ���� �����ڸ� ���, ��ȸ�� ��Ҹ��� �������Ѻ�����.</div>	
						<div class="start_btn3"><button type="button">ķ���� ������� ����</button></div>	
					</li>
				</ul>
			</div>
		</section>
		<section>
			<div>â������ ������ �� �ƴ� ������� ����ϴ�.</div>
			<div><p>8�� �� ���л� �� ���� â�� Ȱ���� ���� ���� ���񽺸� ������ �̷� �Һ����� ��ǥ�� �� �ϳ������ϴ�. 
				 ������ ���� ������ �ȶ��ϰ� ���̵� ������ �� �ֵ��� â������ �õ��� ���� ����� ����� ��. 
				 �Һ��� â���ڿ� �Ŀ��ڵ��� ��â���� �õ��� �پ缺�� ���߹޴� ���°踦 �Բ� ������ �ֽ��ϴ�.</div>
			<div>
				<ul>
					<li>
						<div>���� ������, ���� ����</div>
						<div><p>�ݵ��� ������ ��쿡�� 5%�� �����Ḧ �޽��ϴ�. �������� ������Ʈ �ۼ� ������ �̿��� �̸� �߻��� 
								������� ���� ������ ����� �� �� �־� ù ������Ʈ�� ���� ��ȹ�� �� �ֽ��ϴ�.</div>	
					</li>
					<li>
						<div>������ ���� ���ҽ�</div>
						<div><p>�ݵ� ���� ��, �� �о��� ���¸� �� �ƴ� �����Ͱ� ������Ʈ�� �����ϰ� �ǵ���� �帳�ϴ�. 
								<a href="#">�������� �� â���� ����</a>���� �� �ܰ躰 ������ ���� �Ĳ��� ������ �غ�Ǿ� �ֽ��ϴ�.</div>	
					</li>
					<li>
						<div>Ȯ���� ���� Ŀ�´�Ƽ</div>
						<div><p>�Ŀ��� ��� �κ��� 70�� �Һ��� Ŀ�´�Ƽ�� Ȯ��� �Ҽȳ�Ʈ��ũ���� ���Ե˴ϴ�. 
								�����Ϳ� ������ ����Ʈ�� ȫ���� ������ �� �� �ֵ��� ���Ͽ츦 ������ �帮�ڽ��ϴ�.</div>	
					</li>
				</ul>
			</div>
		</section>
		<section>
			<div id="start_sec6">
				<div id="start_sec6_txt">
					<div>������Ʈ�� ��������!</div>
					<div>
						<label>�������� ������Ʈ ���� ������ ��ٷ� �ۼ��� ������ �� �ֽ��ϴ�.</label> 
						<label>������Ʈ�� ������ �غ� �Ǿ��� �� �������� ���並 ��ġ�� �˴ϴ�.</label> 
						<label>�ñ��� ���� ������ �������� <span>���Ǹ� �����ּ���.</span></label> 
					</div>
				</div>
				<div id="start_btn"><button type="button" class="go_agree_btn">���� �����ϱ�</button></div>
				<div>
					<label>���ޡ����� ���Ǵ�</label>  
					<label><span>partnership@tumblbugs.com</span> ���� ��Ź�帳�ϴ�.</label> 
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>