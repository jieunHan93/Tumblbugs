<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
							var id_name = "input"+jsonObj.list[i].B+".name";
							var id_addr = "input"+jsonObj.list[i].B+".addr";
							var id_phone_num = "input"+jsonObj.list[i].B+".phone_num";
							var id_memo = "input"+jsonObj.list[i].B+".memo";
							var id_product = "input"+jsonObj.list[i].B+".product";
							var id_option = "input"+jsonObj.list[i].B+".option";
							var id_quantity = "input"+jsonObj.list[i].B+".quantity";
							var id_cost = "input"+jsonObj.list[i].B+".cost";
							var id_tip = "input"+jsonObj.list[i].B+".tip";
							var id_delivery_com = "input"+jsonObj.list[i].B+".delivery_com";
							var id_delivery_num = "input"+jsonObj.list[i].B+".delivery_num";
							var id_delivery_date = "input"+jsonObj.list[i].B+".delivery_date";
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
				location.href="http://localhost:9090/tumblbugs/myproject/excelDownload?pj_id=${vo.pj_id}";
			};
		});
		
		// DB업데이트
		$("button#btn-save").click(function(){
			/* $(".name").each(function(){
				//alert("11");
				if($(this).val() == ""){
					$(this).css("border","1px solid red");
					$(this).focus();
					return false;
				}
				
			}) */
			
			$("#delivery_update").submit();
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
		<div id="myproject_delivery_bc" style="background-image:url('http://localhost:9090/tumblbugs/upload/${vo.pj_simg}')">
			<section id="myproject_delivery_bk">
				<div id="myproject_delivery_info">
					<div id="myproject_info_upper">
						<div>${vo.status }</div>
						<a href="http://localhost:9090/tumblbugs/project/${vo.pj_addr }">${vo.pj_title }</a><span>${vo.name }</span>
					</div>
					<div id="myproject_info_lower">
						<div><span>모인 금액</span><span>${vo.funding }원</span></div>
						<div><span>달성률</span><span>${vo.progress }%</span></div>
						<div><span>남은 시간</span>
						<span>
						<c:choose>
							<c:when test="${vo.remaining_days < 0 }">0일</c:when>
							<c:otherwise>${vo.remaining_days }일</c:otherwise>
						</c:choose>
						</span></div>
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
				<form id="delivery_update" name="delivery_update" enctype="multipart/form-data" method="post" action="http://localhost:9090/tumblbugs/myproject/delivery_update?pj_id=${vo.pj_id }" >
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
							<%-- <c:forEach var="vo" items="${list }"> --%>
							<c:forEach items="${list}" var="vo" varStatus="status">
							<tr class="delivery_table_loaddata">
								<td class="rno">${vo.rno}<input type="hidden" name="rno" value="${vo.rno }"></td>
								<td class="pay_num">${vo.funding_id}<input type="hidden" name="funding_id" value="${vo.funding_id}"></td>
								<td class="pay_person">${vo.name }<input type="hidden" name="list[${status.index}].name" value=${vo.name }></td>
								<td class="payday">${vo.funding_date }<input type="hidden" name="funding_date" value="${vo.funding_date }"></td>
								<td><input type="text" id="${vo.funding_id}" class="name" name="recipient_name" value="${vo.recipient_name }"/></td>
								<td><input type="text" id="${vo.funding_id}" class="addr" name="recipient_addr" value="${vo.recipient_addr }"></td>
								<td><input type="text" id="${vo.funding_id}" class="phone_num" name="recipient_phone" value="${vo.recipient_phone }"></td>
								<td><input type="text" id="${vo.funding_id}" class="memo" name="recipient_request" value="${vo.recipient_request }"></td>
								<td><input type="text" id="${vo.funding_id}" class="product" name="gift_title" value="${vo.gift_title }"></td>
								<td><input type="text" id="${vo.funding_id}" class="option" name="gift_option" value="${vo.gift_option }"></td>
								<td><input type="number" id="${vo.funding_id}" class="quantity" name="gift_quantity" value="${vo.gift_quantity }"></td>
								<td><input type="text" id="${vo.funding_id}" class="cost" name="funding_gift_price" value="${vo.funding_gift_price }"></td>
								<td><input type="text" id="${vo.funding_id}" class="tip" name="extra_funding_price" value="${vo.extra_funding_price }"></td>
								<td><input type="text" id="${vo.funding_id}" class="delivery_com" name="courier" value="${vo.courier }"></td>
								<td><input type="text" id="${vo.funding_id}" class="delivery_num" name="invoice_number" value="${vo.invoice_number }"></td>
								<td><input type="date" id="${vo.funding_id}" class="delivery_date" name="delivery_start_date" value="${vo.delivery_start_date }"></td>
								<td>${vo.delivery_complete_yn }<input type="hidden" name="delivery_complete_yn" value=${vo.delivery_complete_yn }></td>
							</tr>
							</c:forEach>
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