<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<title>텀블벅스 :: tumblbugs</title>
	<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" charset="utf8" src="http://localhost:9090/tumblbugs/js/datatables.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/myproject.css">
	
	<script>
	function checkFileType(filePath) {
		var fileFormat = filePath.split(".");
		//console.log(fileFormat.indexOf("xls")); xls 파일 허용하려면 조건에 추가
		if (fileFormat.indexOf("xlsx") > -1) {
			return true;
		} else {
			return false;
		}
	}
	
	
	/* Create an array with the values of all the input boxes in a column */
	$.fn.dataTable.ext.order['dom-text'] = function  ( settings, col )
	{
	    return this.api().column( col, {order:'index'} ).nodes().map( function ( td, i ) {
	        return $('input', td).val();
	    } );
	}
	 
	/* Create an array with the values of all the input boxes in a column, parsed as numbers */
	$.fn.dataTable.ext.order['dom-text-numeric'] = function  ( settings, col )
	{
	    return this.api().column( col, {order:'index'} ).nodes().map( function ( td, i ) {
	        return $('input', td).val() * 1;
	    } );
	}
	
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();   
		// 테이블 필터링
		var table = $('#myproject_delivery_table').DataTable({
			bPaginate: true, //페이징처리
            bLengthChange: true, // n개씩보기
            lengthMenu : [ [-1, 15, 30], ["전체", 15, 30] ], // 10/25/50/All 개씩보기
            bAutoWidth: false, //자동너비
            ordering: true, //칼럼별 정렬
           	searching: true, //검색기능
            sScrollX: "100%",
            'columnDefs' : [ // see https://datatables.net/reference/option/columns.searchable
                { 'searchable'    : false, 'targets'       : [0] },
                { 'searchable'    : false, 'targets'       : [2] },
                { 'searchable'    : false, 'targets'       : [3] },
                { 'orderable'    : false, 'targets'       : [4] },
                { 'orderable'    : false, 'targets'       : [5] },
                { 'orderable'    : false, 'targets'       : [6] },
                { 'orderable'    : false, 'targets'       : [7] },
                { 'orderable'    : false, 'targets'       : [8] },
                { 'orderable'    : false, 'targets'       : [9] },
                { 'orderable'    : false, 'targets'       : [13] },
                { 'orderable'    : false, 'targets'       : [15] },
                { 'orderable'    : false, 'targets'       : [16] },
                { "orderDataType": "dom-text-numeric" , "targets": [10,11,12] },
                { "orderDataType": "dom-text", "targets": [14] },
            ],
		});
		
		// excel업로드
		$("#excelFile").change(function() {
			var file = $("#excelFile").val();
			//alert("file::" + file);
			if (file == "" || file == null) {
				alert("파일을 선택해주세요.");
				return false;
			} else if (!checkFileType(file)) {
				alert("엑셀 파일만 업로드 가능합니다.");
				return false;
			}

			if (confirm("업로드 하시겠습니까?")) {
				var options = {
					success : function(data) {
						var jsonObj = JSON.parse(data);
						
						for(i=0;i<jsonObj.list.length;i++){
							var id_name = "input#"+i+".name";
							var id_addr = "input#"+i+".addr";
							var id_phone_num = "input#"+i+".phone_num";
							var id_memo = "input#"+i+".memo";
							var id_product = "input#"+i+".product";
							var id_option = "input#"+i+".option";
							var id_quantity = "input#"+i+".quantity";
							var id_cost = "input#"+i+".cost";
							var id_tip = "input#"+i+".tip";
							var id_delivery_com = "input#"+i+".delivery_com";
							var id_delivery_num = "input#"+i+".delivery_num";
							var id_delivery_date = "input#"+i+".delivery_date";
							$(id_name).val(jsonObj.list[i].E);
							$(id_addr).val(jsonObj.list[i].F);
							$(id_phone_num).val(jsonObj.list[i].G);
							$(id_memo).val(jsonObj.list[i].H);
							$(id_product).val(jsonObj.list[i].I);
							$(id_option).val(jsonObj.list[i].J);
							$(id_quantity).val(jsonObj.list[i].K);
							$(id_cost).val(jsonObj.list[i].L);
							$(id_tip).val(jsonObj.list[i].M);
							$(id_delivery_com).val(jsonObj.list[i].N);
							$(id_delivery_num).val(jsonObj.list[i].O);
							$(id_delivery_date).val(jsonObj.list[i].P);
						}
						alert("모든 데이터가 업로드 되었습니다.");
					},
					type : "POST"
				};
				$("#excelUploadForm").ajaxSubmit(options);

			}
		});
		
		//excel 다운로드
		$("#btn-download").click(function(){
			if(confirm("다운로드 하시겠습니까?")){
				location.href="http://localhost:9090/tumblbugs/myproject/excelDownload";
			};
		});
		
		// DB업데이트
		$("button#btn-save").click(function(){
			$(".name").each(function(){
				//alert("11");
				if($(this).val() == ""){
					$(this).css("border","1px solid red");
					$(this).focus();
					return false;
				}
				
			})
			
			//$("#delivery_update").submit();
		});
		
		$("input[type=text]").keypress(function(){
			$(this).css("border","1px solid #ebe8e8")
		});
	});
	</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div>
		<div id="myproject_delivery_bc">
			<section id="myproject_delivery_bk">
				<div id="myproject_delivery_info">
					<div id="myproject_info_upper">
						<div>펀딩 진행중</div><!-- <div>펀딩 성공</div><div>펀딩 실패</div> -->
						<a href="http://localhost:9090/tumblbugs/project_content">2019년을 정리하는 100가지 질문 <연말정산> 5주년</a><span>Day-off</span>
					</div>
					<div id="myproject_info_lower">
						<div><span>모인 금액</span><span>20,881,500원</span></div>
						<div><span>달성률</span><span>4176%</span></div>
						<div><span>남은 시간</span><span>7일</span></div>
					</div>
				</div>
			</section>
		</div>
		<section>
			<div id="myproject_delivery_body">
				<div id="myproject_delivery_nav">
					<div>
						<button type="button" id="btn-download"><i class="fas fa-file-download"></i>다운로드</button>
						<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="http://localhost:9090/tumblbugs/myproject/excelUploadAjax">
							<div class="filebox">
								<label for="excelFile"><i class="fas fa-file-upload"></i>업로드</label>
								<input id="excelFile" type="file" name="excelFile" />
							</div>
						</form>
					</div>
					<div id="myproject_tooltip">
						<span data-toggle="tooltip" placement="top" data-html="true" title="<div id='tooltip_div'>데이터의 변경이 있다면 <span>저장</span> 후<br>다운로드를 진행해주세요<br>업로드 후에 꼭 <span>저장</span>을 눌러주세요.<br>업로드와 저장은 <span>전체줄보기</span> 설정 후 진행해주세요.<div id='tooltip_space'></div>일부 항복은 수정이 불가능합니다.</div>"><i class="fas fa-question-circle"></i></span>
					</div>
				</div>
				<form id="delivery_update" name="delivery_update" enctype="multipart/form-data" method="post" action="http://localhost:9090/tumblbugs/myproject/delivery_update" >
				<div id="myproject_delivery_table_box">
					<table id="myproject_delivery_table" >
						<thead>
							<tr id="delivery_table_titles">
								<th class="title_rno">번호</th>
								<th class="title_pay_num">후원번호</th>
								<th class="title_pay_name">후원자명</th>
								<th class="title_payday">후원일자</th>
								<th class="title_name">수령자명</th>
								<th>배송주소</th>
								<th>핸드폰번호</th>
								<th>배송요청사항</th>
								<th>선물</th>
								<th>선택옵션</th>
								<th>수량</th>
								<th>후원액</th>
								<th>추가후원금</th>
								<th>택배사</th>
								<th>송장번호</th>
								<th>배송시작일</th>
								<th class="title_end">수령완료</th>
							</tr>
						</thead>
						<tbody>
							<% for(int i=0; i<30;i++){ %> 
							<tr class="delivery_table_loaddata">
								<td class="rno"><%= i+1 %></td>
								<td class="pay_num"><%= 838765+i %></td>
								<td class="pay_person">홍길동</td>
								<td class="payday">2019-12-01</td>
								<td><input type="text" id="<%= i %>" class="name" name="list[<%=i%>].name" value="한지은" required/></td>
								<td><input type="text" id="<%= i %>" class="addr" value="[17095]경기도 용인시 기흥구 덕영대로2077번길 53 (청현마을 태영데시앙) 200동 1001호"></td>
								<td><input type="text" id="<%= i %>" class="phone_num" value="01053519617"></td>
								<td><input type="text" id="<%= i %>" class="memo" value="부재시 문앞에 놔주세요"></td>
								<td><input type="text" id="<%= i %>" class="product" value="혼자서 탱탱볼"></td>
								<td><input type="text" id="<%= i %>" class="option" value="<연말정산> ( ✕ 1 )"></td>
								<td><input type="number" id="<%= i %>" class="quantity" value="1"></td>
								<td><input type="number" id="<%= i %>" class="cost" value="13000"></td>
								<td><input type="number" id="<%= i %>" class="tip" value="0"></td>
								<td><input type="text" id="<%= i %>" class="delivery_com" value="우체국 택배"></td>
								<td><input type="text" id="<%= i %>" class="delivery_num" value="12586184620500"></td>
								<td><input type="date" id="<%= i %>" class="delivery_date" value="2019-12-02"></td>
								<td>미완료</td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
				
				<div id="btn-save_reset">
					<button type="button" id="btn-save"><i class="fas fa-save"></i>저장</button>
					<button type="reset"><i class="fas fa-sync"></i>다시쓰기</button>
				</div>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>