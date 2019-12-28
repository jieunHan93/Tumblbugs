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
	width:930px;
}
table#admin_banner_table.dataTable tbody{
	text-align: center;
}
table#admin_banner_table.dataTable tbody tr:hover{
    background-color: #ebe8e8;
}
#admin_banner_table, #admin_banner_table th, #admin_banner_table td {
   border: 1px solid lightgray;
   border-collapse: collapse;
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
button#add_banner i {
	padding-right:5px;
}
button#add_banner{
	border :none;
	border-radius: 5px;
	background-color: #1e90ff;
	color:white;
	font-size:15px;
	font-weight: bold;
	padding:5px 10px; 
	margin-left:20px;
	z-index: 0;
    position: relative;
    margin-top: -30px;
}
button#add_banner:hover{
	background-color: #1d85ea;
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
       	/**ajax: {
            'url':'http://localhost:9090/tumblbugs/admin/collection_list', 
            //'type': 'POST',
            'dataSrc':'data',
         },
         
        columns: [
            {"data": "rno"},
            {"data":  function (data, type, dataToSet) {
            	return data.col_id + '<input type="hidden" id="col_id" value="'+data.col_id+'">';
        		}
            },
            {"data": function (data, type, dataToSet) {
            	return  '<a href="http://localhost:9090/tumblbugs/admin/collection/content?col_id='+data.col_id+'">'+data.col_name+'</a>';
        		}
            }, 
            {"data": function (data, type, dataToSet) {
            	return data.col_startdate+"~ "+ data.col_enddate +
				'<input type="hidden" class="col_startdate" value="'+data.col_startdate+'">'+
				'<input type="hidden" class="col_enddate" value="'+data.col_enddate+'">';
            	}
            }, 
            {"data": function (data, type, dataToSet) {
            	var str = "";
	            	if(data.col_controll == '1'){
	            		str='<input type="checkbox" id="switch_'+data.col_id+'" switch="none" checked /><label class="switchBtn checked" for="switch_'+data.col_id+'" data-on-label="On" data-off-label="Off"></label>';
	            	} else if(data.col_controll == '0' && data.col_status == '종료'){
	            		str='<input type="checkbox" id="switch_'+data.col_id+'" switch="none" disabled/><label class="switchBtn disabled" for="switch_'+data.col_id+'" data-on-label="On" data-off-label="Off"></label>';
	            	} else {
	            		str='<input type="checkbox" id="switch_'+data.col_id+'" switch="none" /><label class="switchBtn " for="switch_'+data.col_id+'" data-on-label="On" data-off-label="Off"></label>';
	            	}
	            	return str;
                }
            },
            {"data" : function (data, type, dataToSet) {
            	return data.col_status + "<input type='hidden' id='col_status'>";
            	}
            }
        ],
       	**/
       	
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
        /*'columnDefs' : [ // see https://datatables.net/reference/option/columns.searchable
            { 'searchable'    : false, 'targets'       : [0] },
            { 'searchable'    : false, 'targets'       : [4] },
            { "orderDataType": "dom-checkbox", "targets": [4] },
        ],*/
	});
	
	$(".dataRow").sortable({
		items:'.switchon',
		stop:function(event, i){
			$(".dataRow tr").each(function(){
				rowIdx = $(this).prevAll().length + 1;
				$(this).find("input.rowIdx").val(rowIdx);
				console.log($(this).find("td:nth-child(2)").text()+$(this).find("input.rowIdx").val());
				
				var options = {
						success : function(data) {
							// AJAX 성공
						
							alert("모든 데이터가 업로드 되었습니다.");
						},
						type : "POST"
					};
					$("#excelUploadForm").ajaxSubmit(options);
			});
		}
		
	});
	/* $(".dataRow").mouseover(function(){
		$(".dataRow").css("border", "1px solid red");
		
		var idx = $(".dataRow").index(this);
		$(".dataRow").eq(idx).css("border","1px solid #FF000");
	}); */
	
	/*function transmit(){
		var bid="";
		$(".dataRow").each(function(idx){
			bid += $(".dataRow").eq(idx).find("input").val() + ",";
			console.log(bid);
		});
		
		console.log(bid.slice(0,-1));
		
	}*/
	
	/** 설정 스위치 **/
	$("#admin_banner_table tbody").on('click', 'label.switchBtn', function(){
		$(this).toggleClass("checked");
		if($(this).hasClass("disabled") === false) {
			var col_id = $(this).closest("tr").find("input#col_id").val();
			var checkbox = $(this).parent().find("input:checkbox");
			var startdate = $(this).closest("tr").find("input.col_startdate").val();
			var enddate = $(this).closest("tr").find("input.col_enddate").val();
			var col_controll = "";
			//alert("col_id:" + col_id + "checkbox:"+checkbox +"startdate:" + startdate +"enddate:" +enddate);
			
	        if($(checkbox).is(":checked")){
	        	//alert("체크박스 체크 해제!");
	            col_controll="0";
	        }else{
	            //alert("체크박스 체크했음!");
	            col_controll="1";
	        }
	       	/* $.ajax({
					url: "http://localhost:9090/tumblbugs/admin/collection_checkbox?col_id="+col_id+"&col_controll="+col_controll+"&col_startdate="+startdate+"&col_enddate="+enddate,
					success:function(result){
						if(result != "fail"){
							$(this).toggleClass("checked");
							var td_select = $(this).closest("tr").find("input.col_status").parent();
							$(td_select).text(result);
							$.ajax({
								url: "http://localhost:9090/tumblbugs/admin/collection/count",
								success:function(result){
									var jsonObj = JSON.parse(result);
									$("div#collection_count1").text(jsonObj.list[0].count1);
									$("div#collection_count2").text(jsonObj.list[0].count2);
									$("div#collection_count3").text(jsonObj.list[0].count3);
								}
							}); // ajax
							table.ajax.reload(null, false);
						} else {
							alert("해당 기획전에 등록된 프로젝트가 없습니다.먼저 등록을 진행해주세요.");
						}
						
					},
					fail:function(result){
						alert("시스템 관리자에게 문의하세요.");
					}
			}); // ajax
			*/
		} else {
			alert("기획전 기간이 지나 종료되었습니다.");
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
								</tr>
							</thead>
							<input type="hidden" id="result">
							
							<tbody class="dataRow">
								<tr class="switchon">
									<input type="hidden" class="rowIdx">
									<td>1</td>
									<td>앨리스가 알려준 이상한 나라 가이드북</td>
									<td><img src="http://localhost:9090/tumblbugs/upload/hero_alice.jpg"></td>
									<td>2019/12/28~2019/12/18</td>
									<td><input type="checkbox" id="switch_1" switch="none" /><label class="switchBtn " for="switch_1" data-on-label="On" data-off-label="Off"></label></td>
								</tr>
								<tr class="switchon">
									<input type="hidden" class="rowIdx">
									<td>2</td>
									<td>새해에는 같이 유튜브 시작해요</td>
									<td><img src="http://localhost:9090/tumblbugs/upload/hero_cypress.jpg"></td>
									<td>2019/12/28~2019/12/18</td>
									<td><input type="checkbox" id="switch_2" switch="none" /><label class="switchBtn " for="switch_2" data-on-label="On" data-off-label="Off"></label></td>
								</tr>
								<tr class="switchon">
									<input type="hidden" class="rowIdx">
									<td>3</td>
									<td>정교하게 재현한 한국 최초의 우표</td>
									<td><img src="http://localhost:9090/tumblbugs/upload/hero_yeon_badge.jpg"></td>
									<td>2019/12/28~2019/12/18</td>
									<td><input type="checkbox" id="switch_3" switch="none" /><label class="switchBtn " for="switch_3" data-on-label="On" data-off-label="Off"></label></td>
								</tr>
								<tr>
									<input type="hidden" class="rowIdx">
									<td>4</td>
									<td>웰컴 투 육지 걷는 상어 샥!</td>
									<td><img src="http://localhost:9090/tumblbugs/upload/hero_sharktoy.jpg"></td>
									<td>2019/12/28~2019/12/18</td>
									<td><input type="checkbox" id="switch_4" switch="none" /><label class="switchBtn " for="switch_4" data-on-label="On" data-off-label="Off"></label></td>
								</tr>
								<tr>
									<input type="hidden" class="rowIdx">
									<td>5</td>
									<td>나뭇결 살아 있는 아름다운 윷가락</td>
									<td><img src="http://localhost:9090/tumblbugs/upload/hero_nyoot.jpg"></td>
									<td>2019/12/28~2019/12/18</td>
									<td><input type="checkbox" id="switch_5" switch="none" /><label class="switchBtn " for="switch_5" data-on-label="On" data-off-label="Off"></label></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<button type="button" id="add_banner"><i class="fas fa-ad"></i>배너 추가</button>
				
				
				<div id="add_banner_content">
					<form>
						<table>
							<tr>1</tr>
						</table>
					</form>
				</div>
			</div>
		</section>
	</div>
</body>
</html>