<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" charset="utf8" src="http://localhost:9090/tumblbugs/js/datatables.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<title>Insert title here</title>
<style>
div#admin_banner_body{
	margin-left:320px;
	background-color: #f6f5f5;
	height:100%;
}
div#admin_banner_table_box{
	margin-left:20px;
	margin-top:20px;
}
div#admin_header{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
	height: 70px;
	width:100%;
	line-height:70px;
	background-color: #ffffff;
	color: #1e90ff;
}
div#admin_header p {
	margin-left: 20px;
	cursor:default;
}
tbody img{
	width:250px;
}
div#admin_banner_content{
	width:980px;
	display: inline-block;
	clear:both;
}
table#admin_banner_table.dataTable tbody{
	text-align: center;
}
table#admin_banner_table.dataTable tbody tr:hover{
    background-color: #ebe8e8;
}
#admin_banner_table th{
	text-align: center;
}
#admin_banner_table, #admin_banner_table th, #admin_banner_table td {
   border: 1px solid lightgray;
   border-collapse: collapse;
   cursor: pointer;
}
table#admin_banner_table{
	font-size: 14px;
}
input[switch] {
  display: none;
}
input[switch] + label {
  font-size: 1em;
  line-height: 1;
  width: 4rem;
  height: 2rem;
  background-color: #ddd;
  background-image: none;
  border-radius: 2rem;
  padding: 0.16667rem;
  cursor: pointer;
  display: inline-block;
  text-align: center;
  position: relative;
  box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.2) inset;
  font-family: inherit;
  -webkit-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
input[switch] + label:before {
  /* Label */
  text-transform: uppercase;
  color: #b7b7b7;
  content: attr(data-off-label);
  display: block;
  font-family: inherit;
  font-family: FontAwesome, inherit;
  font-weight: 500;
  font-size: 0.7rem;
  line-height: 1.74rem;
  position: absolute;
  right: 0.21667rem;
  margin: 0.21667rem;
  top: 0;
  text-align: center;
  min-width: 1.66667rem;
  overflow: hidden;
  -webkit-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
input[switch] + label:after {
  /* Slider */
  content: '';
  position: absolute;
  left: 0.16667rem;
  background-color: #f7f7f7;
  box-shadow: none;
  border-radius: 2rem;
  height: 1.66667rem;
  width: 1.66667rem;
  -webkit-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}
input[switch]:checked + label.checked {
  background-color: lightblue;
  background-image: -webkit-linear-gradient(rgba(255, 255, 255, 0.15), rgba(0, 0, 0, 0.2));
  background-image: linear-gradient(rgba(255, 255, 255, 0.15), rgba(0, 0, 0, 0.2));
  box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.3) inset;
}
input[switch]:checked + label.checked:before {
  color: #fff;
  content: attr(data-on-label);
  right: auto;
  left: 0.21667rem;
}
input[switch]:checked + label.checked:after {
  left: 2.16667rem;
  background-color: #f7f7f7;
  box-shadow: 1px 1px 10px 0 rgba(0, 0, 0, 0.3);
}
button#add_banner i,
button#add_banner_write i,
button#update_banner_button i,
button#delete_banner_button i {
	padding-right:5px;
}
button#add_banner,
button#add_banner_write, 
button#update_banner_button,
button#delete_banner_button{
	border :none;
	border-radius: 5px;
	background-color: #1e90ff;
	color:white;
	font-size:15px;
	font-weight: bold;
	padding:5px 10px; 
}
button#add_banner{
	margin-left:20px;
	z-index: 0;
    position: relative;
    margin-top: -30px;
}
button#add_banner:hover,
button#add_banner_write:hover,
button#update_banner_button:hover,
button#delete_banner_button:hover{
	background-color: #1d85ea;
}
button#add_banner_write{
	margin-top:10px;
	float:right;
}
div#add_banner_content{
	margin-left:20px;
	margin-top:20px;
	display:none;
	width:960px;
	/*width:800px;*/
}
table#add_banner_table, table#add_banner_table td, table#add_banner_table th,
table#banner_update_table, table#banner_update_table td, table#banner_update_table th{
    border: 1px solid lightgray;
    border-collapse: collapse;
}
table#add_banner_table, table#banner_update_table{ 
	font-size: 14px; 
	width:100%;
}
table#add_banner_table th, table#banner_update_table th {
	text-align:center;
	padding: 8px 10px;
    background-color: #e3f1ff;
}
table#add_banner_table td, table#banner_update_table td {
	padding: 5px 10px;
	background-color: white;
}
table#add_banner_table input, table#banner_update_table input {
    border: 1px solid #E6E6E6;
    border-radius: 5px;
    padding: 5px 10px;
}
table#add_banner_table input[type=file], table#banner_update_table input[type=file]{
	border:none;
}
table#add_banner_table input[type=date], table#banner_update_table input[type=date]{
	width:185px;
}
input#ba_title, input#ba_content{
	width:500px;
}
table#banner_update_table input#ba_title, table#banner_update_table input#ba_content{
	width: 400px;
}
span#pj_addr_check{
	padding-left:10px;
	font-size: 14px;
	color:#999999;
}
div#admin_banner_detail_box{
	display:none;
	width:600px;
	float:right;
	margin-top:66px;
	margin-right:10px;
	padding:15px 0px 15px 0px;
	background-color: white;
	border: 1px solid #ccc;
    border-radius: 5px;
}
div#admin_banner_detail_box>div{
	width:550px;
	margin:auto;
}
div#update_from_button{
	margin-top:10px;
	text-align: right;
}
div#banner_preview{
	margin-top:20px;
}
div#preview_img{
	width:550px;
	height:130px;
	background-image: url("http://localhost:9090/tumblbugs/upload/hero_nyoot.jpg");
	background-size: 550px;
	background-repeat: no-repeat;
	margin:10px 0px;
}
div#preview_content{
	margin-left:80px;
	color:white;
	padding-top:45px;
}
div#preview_content .preview_title{
	font-size:20px;
	font-weight: bold;
	margin-bottom: 0px;
}
div#preview_content .preview_subtitle{
	font-size:10px;
}
span#banner_detail_exit{
	color:#A4A4A4;
	float:right;
	margin-bottom:5px;
	cursor:pointer;
}
span#banner_detail_exit:hover{
	color: #1e90ff;
}
table#banner_update_table input#ba_cimg{
	display: inline-block;
}
span#ba_img{
	margin-left: -200px;
    background-color: white;
    padding-left: 15px;
    color: #333333;
}
</style>
<script>
$(document).ready(function(){
	var table = $('#admin_banner_table').DataTable({
		bPaginate: true, //페이징처리
		pageLength :5,
        bLengthChange: false, // n개씩보기
        bAutoWidth: false, //자동너비
        ordering: true, //칼럼별 정렬
       	searching: true, //검색기능
       	ajax: {
            'url':'http://localhost:9090/tumblbugs/admin/banner_list', 
            //'type': 'POST',
            'dataSrc':'data',
         },
        
        columns: [
            {"data": "rno"}, 
            {"data":  function (data, type, dataToSet) {
            	return data.ba_title + '<input type="hidden" id="ba_id" name="ba_id" value="'+data.ba_id+'"><input type="hidden" name="ba_order" class="ba_order">';
        		}
            },
            {"data": function (data, type, dataToSet) {
            	return '<img src="http://localhost:9090/tumblbugs/upload/'+data.ba_simg+'">'
            	}
            },
            {"data": function (data, type, dataToSet) {
            	return data.ba_startdate+"~ "+ data.ba_enddate +
				'<input type="hidden" name="ba_startdate" id="ba_startdate" value="'+data.ba_startdate+'">'+
				'<input type="hidden" name="ba_enddate" id="ba_enddate" value="'+data.ba_enddate+'">';
            	}
            }, 
            {"data": function (data, type, dataToSet) {
            	var str = "";
	            	if(data.ba_controll == '1'){
	            		str='<input type="checkbox" name="ba_controll" id="switch_'+data.ba_id+'" switch="none" checked /><label class="switchBtn checked" for="switch_'+data.ba_id+'" data-on-label="On" data-off-label="Off"></label>';
	            	} else if(data.ba_controll == '0' && data.ba_status == '종료'){
	            		str='<input type="checkbox" name="ba_controll" id="switch_'+data.ba_id+'" switch="none" disabled/><label class="switchBtn disabled" for="switch_'+data.ba_id+'" data-on-label="On" data-off-label="Off"></label>';
	            	} else {
	            		str='<input type="checkbox" name="ba_controll" id="switch_'+data.ba_id+'" switch="none" /><label class="switchBtn " for="switch_'+data.ba_id+'" data-on-label="On" data-off-label="Off"></label>';
	            	}
	            	return str;
                }
            },
            {"data" : function (data, type, dataToSet) {
            	return data.ba_status + "<input type='hidden' name='ba_status' value='"+data.ba_status+"'><input type='hidden' name='ba_controll' value='"+data.ba_controll+"'>";
            	}
            }
        ],
       	
        "language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "_MENU_ 줄보기",
            "infoEmpty": "",
            "search": "",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": ">",
                "previous": "<"
            },
            "sSearchPlaceholder" : "검색어를 입력하세요"
        },
        'columnDefs' : [ // see https://datatables.net/reference/option/columns.searchable
        	{ 'searchable'    : false, 'targets'       : [0] },
            { 'searchable'    : false, 'targets'       : [2] },
            { 'searchable'    : false, 'targets'       : [4] },
            { 'orderable'    : false, 'targets'       : [2] },
            { "orderDataType": "dom-checkbox", "targets": [4] },
        ],
        /** 리스트 로딩 후 sortable을 위한 클래스 부여 **/
        "drawCallback": function(){
        	$(".switchBtn.checked").each(function(){
    			$(this).closest("tr").addClass("switchon");
    		});
        }
	});
	
	/** 배너 순서 변경 **/
	$(".dataRow").sortable({
		items:'.switchon',
		stop:function(event, i){
			$(".dataRow tr").each(function(){
				ba_order = $(this).prevAll().length + 1;
				$(this).find("input.ba_order").val(ba_order);
				console.log($(this).find("td:nth-child(2)").text()+$(this).find("input.ba_order").val());
				$("#excelUploadForm").ajaxSubmit({
					success : function(data) {
						// AJAX 성공
						alert("순서 재정렬을 완료했습니다.");
					},
					type : "POST"
				});
			});
		}
		
	});
	
	/** 설정 스위치 **/
	$("#admin_banner_table tbody").on('click', 'label.switchBtn', function(){
		$(this).toggleClass("checked");
		if($(this).hasClass("disabled") === false) {
			var ba_id = $(this).closest("tr").find("input#ba_id").val();
			var checkbox = $(this).parent().find("input:checkbox");
			var startdate = $(this).closest("tr").find("input#ba_startdate").val();
			var enddate = $(this).closest("tr").find("input#ba_enddate").val();
			var ba_controll = "";
			//alert("ba_id:" + ba_id + "checkbox:"+checkbox +"startdate:" + startdate +"enddate:" +enddate);
			
	        if($(checkbox).is(":checked")){
	        	//alert("체크박스 체크 해제!");
	            ba_controll="0";
	        }else{
	            //alert("체크박스 체크했음!");
	            ba_controll="1";
	        }
	       	$.ajax({
					url: "http://localhost:9090/tumblbugs/admin/banner_checkbox?ba_id="+ba_id+"&ba_controll="+ba_controll+"&ba_startdate="+startdate+"&ba_enddate="+enddate,
					success:function(result){
						if(result != "fail"){
							var td_select = $(this).closest("tr").find("input.ba_status").parent();
							$(td_select).text(result);
							table.ajax.reload(null, false);
						} else {
							alert("해당 기획전에 등록된 프로젝트가 없습니다.먼저 등록을 진행해주세요.");
						}
						
					},
					fail:function(result){
						alert("시스템 관리자에게 문의하세요.");
					}
			}); // ajax
		} else {
			alert("기획전 기간이 지나 종료되었습니다.");
		}
	});
	
	/** 배너 추가 버튼 클릭시  **/
	$("button#add_banner").click(function(){
		$('#add_banner_content').fadeToggle("200");
	});
	
	/** 추가 validation check **/
	var insert_ba_cimg = "";
	 $("#add_banner_table #ba_cimg").change(function(){
		//FileReader
		if(window.FileReader){
			insert_ba_cimg = $(this)[0].files[0].name;
		}
	});
	 // 시작일 종료일 체크
	$("#add_banner_write #ba_enddate").change(function(){
		if($("#add_banner_write #ba_startdate").val() != "" && $("#add_banner_write #ba_enddate").val() !=""){
			var startDate = $( "#add_banner_write #ba_startdate" ).val();
	        var startDateArr = startDate.split('-');
	        var endDate = $( "#add_banner_write #ba_enddate" ).val();
	        var endDateArr = endDate.split('-');
	                 
	        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
		    var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
		    
		    if(startDateCompare.getTime() > endDateCompare.getTime()) {
		            alert("시작일과 마감일을 확인해 주세요.");
		            $("#add_banner_write #ba_enddate").val("");
		            $("#add_banner_write #ba_enddate").focus();
		    } 
		}
	});
	$("button#add_banner_write").click(function(){
		if($("#add_banner_table #ba_title").val() == ""){
			alert("배너 제목을 입력하세요");
			$("#add_banner_table #ba_title").focus();
		} else if($("#add_banner_table #ba_content").val() == ""){
			alert("배너 내용을 입력하세요");
			$("#add_banner_table #ba_content").focus();
		} else if($("#add_banner_table #pj_addr").val() == ""){
			alert("프로젝트 아이디를 입력하세요");
			$("#add_banner_table #pj_addr").focus();
		} else if($("#add_banner_table #ba_startdate").val() == ""){
			alert("프로젝트 시작일을 입력하세요");
			$("#add_banner_table #ba_startdate").focus();
		} else if($("#add_banner_table #ba_enddate").val() == ""){
			alert("프로젝트 종료일을 입력하세요");
			$("#add_banner_table #ba_startdate").focus();
		} else if(insert_ba_cimg == ""){
			alert("배너 이미지를 선택하세요");
		} else {
			var options = {
				type : "POST",
				success : function(data) {
					// AJAX 성공
					if(data="success"){
						alert("정보를 저장했습니다.");
						$("#bannerWrite")[0].reset();
						$('#add_banner_content').css("display", "none");
						table.ajax.reload(null, false);
					} else {
						alert("정보 저장을 실패했습니다.");
					}
				}
			}
			$("#bannerWrite").ajaxSubmit(options);
		}
	});
	/** 프로젝트 주소 체크 **/
	$("#add_banner_table #pj_addr").focusout(function(){
		var pj_addr = $("#add_banner_table #pj_addr").val();
		$.ajax({
			url: "http://localhost:9090/tumblbugs/admin/banner_pj_addr_check?pj_addr="+pj_addr,
			success:function(result){
				if(result == 0){
					$("#add_banner_table #pj_addr_check").text("없는 프로젝트 주소입니다. 다시 입력해주세요.").css("color", "#FF6666");
					$("#add_banner_table #pj_addr").val("");
					$("#add_banner_table #pj_addr").focus();
				} else {
					$("#add_banner_table #pj_addr_check").text("존재하는 프로젝트 주소입니다.").css("color", "#999999");
				}
			}
		});
	});
	
	
	/** 상세 정보 불러오기 **/
	$("#admin_banner_table tbody").on('click','tr>td:nth-child(2)',function() {
		var ba_id = $(this).find("input#ba_id").val();
		if($("div#admin_banner_detail_box").css("display") == 'none'){
			$("div#admin_banner_detail_box").fadeIn("200");
		}
		$.ajax({
			url: "http://localhost:9090/tumblbugs/admin/banner_content?ba_id="+ba_id,
			success:function(result){
				var obj = JSON.parse(result);
				$("form#bannerUpdate").find("input#ba_id").val(obj.data[0].ba_id);
				$("form#bannerUpdate").find("input#del_simg").val(obj.data[0].ba_simg);
				$("form#bannerUpdate").find("input#ba_status").val(obj.data[0].ba_status);
				$("form#bannerUpdate").find("input#ba_controll").val(obj.data[0].ba_controll);
				$("table#banner_update_table").find("input#ba_title").val(obj.data[0].ba_title);
				$("table#banner_update_table").find("input#ba_content").val(obj.data[0].ba_content);
				$("table#banner_update_table").find("input#pj_addr").val(obj.data[0].pj_addr);
				$("table#banner_update_table").find("input#ba_startdate").val(obj.data[0].ba_startdate);
				$("table#banner_update_table").find("input#ba_enddate").val(obj.data[0].ba_enddate);
				$("table#banner_update_table").find("span#ba_img").text(obj.data[0].ba_img);
				
				$("div#preview_img").css("background-image", "url('http://localhost:9090/tumblbugs/upload/"+obj.data[0].ba_simg+"')");
				var str = obj.data[0].ba_title;
				str = str.replace(',','<br>');
				$(".preview_title").html(str);
				$(".preview_subtitle").text(obj.data[0].ba_content);
			}
		});
	});
	$("span#banner_detail_exit").click(function(){
		$("div#admin_banner_detail_box").fadeOut("200");
	});
	/** 새로운 이미지 선택 **/
	var update_ba_cimg = "";
	$("#banner_update_table #ba_cimg").change(function(){
		if(window.FileReader){
			update_ba_cimg = $(this)[0].files[0].name;
			$("#banner_update_table span#ba_img").text("").text(update_ba_cimg);
			readInputFile($(this)[0]);
		}
	});
	/** 이미지 미리보기 **/
  	function readInputFile(input) {
       if(input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('#preview_img').css("background-image", 'url(\"' + e.target.result + '\")');
           }
           reader.readAsDataURL(input.files[0]);
       }
   	}
	$("#banner_update_table #ba_title").change(function(){
		var ba_title = $(this).val();
		ba_title = ba_title.replace(',','<br>');
		$(".preview_title").html(ba_title);
	});
	$("#banner_update_table #ba_content").change(function(){
		var ba_content = $(this).val();
		$(".preview_subtitle").text(ba_content);
	});
	
	/** 수정버튼 클릭 **/
	$("button#update_banner_button").click(function(){
		if($("#banner_update_table #ba_title").val() == ""){
			alert("배너 제목을 입력하세요");
			$("#banner_update_table #ba_title").focus();
		} else if($("#banner_update_table #ba_content").val() == ""){
			alert("배너 내용을 입력하세요");
			$("#banner_update_table #ba_content").focus();
		} else if($("#banner_update_table #pj_addr").val() == ""){
			alert("프로젝트 아이디를 입력하세요");
			$("#banner_update_table #pj_addr").focus();
		} else if($("#banner_update_table #ba_startdate").val() == ""){
			alert("프로젝트 시작일을 입력하세요");
			$("#banner_update_table #ba_startdate").focus();
		} else if($("#banner_update_table #ba_enddate").val() == ""){
			alert("프로젝트 종료일을 입력하세요");
			$("#banner_update_table #ba_startdate").focus();
		} else {
			var options = {
				type : "POST",
				success : function(data) {
					// AJAX 성공
					if(data="success"){
						alert("정보 수정을 완료해습니다");
						table.ajax.reload(null, false);
					} else {
						alert("정보 수정을 실패했습니다.");
					}
				}
			}
			$("#bannerUpdate").ajaxSubmit(options);
		}
	});
	 // 시작일 종료일 체크
	$("#banner_update_table #ba_enddate").change(function(){
		if($("#banner_update_table #ba_startdate").val() != "" && $("#banner_update_table #ba_enddate").val() !=""){
			var startDate = $( "#banner_update_table #ba_startdate" ).val();
	        var startDateArr = startDate.split('-');
	        var endDate = $( "#banner_update_table #ba_enddate" ).val();
	        var endDateArr = endDate.split('-');
	                 
	        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
		    var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
		    
		    if(startDateCompare.getTime() > endDateCompare.getTime()) {
		            alert("시작일과 마감일을 확인해 주세요.");
		            $("#banner_update_table #ba_enddate").val("");
		            $("#banner_update_table #ba_enddate").focus();
		    } 
		}
	});
	/** 프로젝트 주소 체크 **/
	$("#banner_update_table #pj_addr").focusout(function(){
		var pj_addr = $("#banner_update_table #pj_addr").val();
		$.ajax({
			url: "http://localhost:9090/tumblbugs/admin/banner_pj_addr_check?pj_addr="+pj_addr,
			success:function(result){
				if(result == 0){
					$("#banner_update_table #pj_addr_check").text("없는 프로젝트 주소입니다.").css("color", "#FF6666");
					$("#banner_update_table #pj_addr").val("");
					$("#banner_update_table #pj_addr").focus();
				} else {
					$("#banner_update_table #pj_addr_check").text("존재하는 프로젝트 주소입니다.").css("color", "#999999");
				}
			}
		});
	});
	
	/** 배너 삭제 **/
	$("button#delete_banner_button").click(function(){
		if(confirm('해당 배너를 삭제하시겠습니까?')){
			var ba_id = $("form#bannerUpdate").find("input#ba_id").val();
			var ba_simg =$("form#bannerUpdate").find("input#del_simg").val();
			$.ajax({
				url: "http://localhost:9090/tumblbugs/admin/banner_delete?ba_id="+ba_id+"&ba_simg="+ba_simg,
				success:function(result){
					$("#bannerUpdate")[0].reset();
					$('#admin_banner_detail_box').css("display", "none");
					table.ajax.reload(null,false);
				}
			});
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="admin_sidebar.jsp" />
	<div id="admin_banner_body">
		<section>
			<div id="admin_header">
				<p>배너 관리</p>
			</div>
			
			<div id="admin_banner_detail_box">
				<div>
					<span id="banner_detail_exit"><i class="fas fa-times"></i></span>
					<form action="http://localhost:9090/tumblbugs/admin/banner_update" method="post" enctype="multipart/form-data" id="bannerUpdate">
						<table id="banner_update_table">											
							<tr>
								<th>배너 제목</th>
								<td><input type="text" name="ba_title" id="ba_title" autocomplete="off" placeholder="줄바꿈은 , 로 구분해주세요"></td>
							</tr>
							<tr>
								<th>배너 내용</th>
								<td><input type="text" name="ba_content" id="ba_content" autocomplete="off"></td>
							</tr>
							<tr>
								<th>프로젝트 주소</th>
								<td>
									<input type="text" name="pj_addr" id="pj_addr" autocomplete="off">
									<span id="pj_addr_check"></span>
								</td>
							</tr>
							<tr>
								<th>노출 기간</th>
								<td><input type="date" id="ba_startdate" name="ba_startdate">~<input type="date" id="ba_enddate" name="ba_enddate"></td>
							</tr>
							<tr>
								<th>배너 이미지</th>
								<td>
									<input type="file" id="ba_cimg" name="ba_cimg">
									<span id="ba_img"></span>
								</td>						
						</table>
						<input type="hidden" id="ba_id" name="ba_id">
						<input type="hidden" id="del_simg" name="del_simg">
						<input type="hidden" id="ba_status" name="ba_status">
						<input type="hidden" id="ba_controll" name="ba_controll">
						<div id="update_from_button">
							<button type="button" id="update_banner_button"><i class="fas fa-save" aria-hidden="true"></i>수정</button>
							<button type="button" id="delete_banner_button"><i class="fas fa-trash-alt" aria-hidden="true"></i>삭제</button>
						</div>
					</form>
					
					<div id="banner_preview">
						<div id="preview_img">
							<div id="preview_content">
					     	 	<h1 class="preview_title">수면을 위한<br>차, 옷, 향</h1>
					     	 	<div class="preview_subtitle">일상에 스며들어 수면 루틴을 살표시 바꿔주는 것들</div>
					     	 </div>
						</div>
					</div>
				
				</div>
			</div>
			
			<div id="admin_banner_content">
				<div id="admin_banner_table_box">
					<form>
						<table id="admin_banner_table">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>이미지</th>
									<th>노출 기간</th>
									<th>노출 설정</th>
									<th>상태</th>
								</tr>
							</thead>
							
							<tbody class="dataRow"></tbody>
						</table>
					</form>
				</div>
				<button type="button" id="add_banner"><i class="fas fa-ad"></i>배너 추가</button>
				
				<div id="add_banner_content">
					<form action="http://localhost:9090/tumblbugs/admin/banner_insert" method="post" id="bannerWrite" enctype="multipart/form-data">
						<table id="add_banner_table">
							<tr>
								<th>배너 제목</th>
								<td><input type="text" name="ba_title" id="ba_title" autocomplete="off" placeholder="줄바꿈은 , 로 구분해주세요"></td>
							</tr>
							<tr>
								<th>배너 내용</th>
								<td><input type="text" name="ba_content" id="ba_content" autocomplete="off"></td>
							</tr>
							<tr>
								<th>프로젝트 주소</th>
								<td>
									<input type="text" name="pj_addr" id="pj_addr" autocomplete="off">
									<span id="pj_addr_check"></span>
								</td>
							</tr>
							<tr>
								<th>노출 기간</th>
								<td><input type="date" id="ba_startdate" name="ba_startdate">~<input type="date" id="ba_enddate" name="ba_enddate"></td>
							</tr>
							<tr>
								<th>배너 이미지</th>
								<td><input type="file" id="ba_cimg" name="ba_cimg"></td>
							</tr>
						</table>
						<button type="button" id="add_banner_write"><i class="fas fa-save" aria-hidden="true"></i>저장</button>
					</form>
				</div>
			</div>
			
		</section>
	</div>
</body>
</html>