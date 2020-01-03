<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_project_member.css">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		//승인/반려 처리 되어있으면 체크 리스트 숨김
		if('${vo.pj_check_yn}' != null && '${vo.pj_check_yn}' != "" && '${vo.pj_check_yn}' != "c") {
			$(".checklist_sidebar").hide();
		}
		
		//체크된 아이콘 숨김
		$("i#true").hide();
		
		//체크박스 체크 표시
		$("input[type='checkbox']").change(function() {
			var status = $(this).is(":checked");

			if(status) {
				//체크
				$(this).siblings("i#false").hide();
				$(this).siblings("i#true").show();
			} else {
				//체크해제
				$(this).siblings("i#true").hide();
				$(this).siblings("i#false").show();
			}
		});
		
		$("#menu_content>div").hide();
		$("#menu_content>div#menu1").show();
		
		//메뉴 탭
		$("#upload_menu label").click(function() {
			var id = $(this).attr("id");
			$("#menu_content>div").hide();
			$("#menu_content>div#" + id).show();
		});
		
		//통장사본 마우스 오버 시 스타일 변경
		$(".file_download").mouseover(function() {
			$("#file_icon").css("color", "#fa6462");
		});
		$(".file_download").mouseout(function() {
			$("#file_icon").css("color", "rgba(0,0,0,.6)");
		});
		
		//승인 처리
		$("#btn_approve").click(function() {
			var result = true;
			
			$("input[type='checkbox']:not(#direct_input)").each(function() {
				if($(this).is(":checked") != true) {
					alert("체크리스트를 모두 확인해주세요.");
					result = false;
					return false;
				}
			});
			
			if(result == true) {
				alert("승인 처리되었습니다.");
				location.href = "http://localhost:9090/tumblbugs/admin/project_check_proc?pj_id=" + '${vo.pj_id}';
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="admin_sidebar.jsp"></jsp:include>
	<div id="admin_project">
		<div id="admin_header">
			<p>프로젝트 검수</p>
		</div>
		<div id="admin_project_detail_content">
			<div id="project_content">
				<div id="project_menu">
					<div id="upload_menu">
						<label id="menu1">프로젝트 개요</label>
						<label id="menu2">펀딩 및 선물 구성</label>
						<label id="menu3">스토리텔링</label>
						<label id="menu4">계좌</label>
						<div>
							<a href="http://localhost:9090/tumblbugs/admin/projects"><button type="button" id="btn_list">목록보기</button></a>
							<a href="http://localhost:9090/tumblbugs/preview/${vo.pj_id}" target="_blank"><button type="button" id="btn_preview"><i class="far fa-eye"></i> &nbsp;&nbsp;미리보기</button></a>
						</div>
					</div>
				</div>
				<div id="menu_content">
					<div id="menu1">
						<label class="menu_content_label">프로젝트 개요</label>
						<div class="menu_content_box">
							<div>
								<div class="sub_menu_title">프로젝트 제목</div>
								<div class="sub_menu_value">${vo.pj_title }</div>
							</div>
							<div>
								<div class="sub_menu_title">프로젝트 대표이미지</div>
								<div class="sub_menu_value"><img src="http://localhost:9090/tumblbugs/upload/${vo.pj_simg }" height="325.17"/></div>
							</div>
							<div id="pj_summary">
								<div class="sub_menu_title">프로젝트 요약</div>
								<div class="sub_menu_value">${vo.pj_summary }</div>
							</div>
							<div>
								<div class="sub_menu_title">프로젝트 카테고리</div>
								<div class="sub_menu_value">${vo.pj_category }</div>
							</div>
							<div>
								<div class="sub_menu_title">프로젝트 페이지 주소</div>
								<div class="sub_menu_value">${vo.pj_addr }</div>
							</div>
							<div>
								<div class="sub_menu_title">검색용 태그</div>
								<div class="sub_menu_value">${vo.pj_tag }</div>
							</div>
						</div>
						<label class="menu_content_label">창작자 정보</label>
						<div class="menu_content_box">
							<div id="profile_img">
								<div class="sub_menu_title">프로필 이미지</div>
								<div class="sub_menu_value"><span><img src="http://localhost:9090/tumblbugs/upload/${vo.profile_simg }"></span></div>
							</div>
							<div>
								<div class="sub_menu_title">창작자 이름</div>
								<div class="sub_menu_value">${vo.name }</div>
							</div>
							<div id="intro">
								<div class="sub_menu_title">창작자 소개</div>
								<div class="sub_menu_value">${vo.intro }</div>
							</div>
						</div>
					</div>
					<div id="menu2">
						<label class="menu_content_label">펀딩 목표</label>
						<div class="menu_content_box">
							<div>
								<div class="sub_menu_title">목표 금액</div>
								<div class="sub_menu_value">${vo.pj_price }원</div>
							</div>
							<div>
								<div class="sub_menu_title">프로젝트 마감일</div>
								<div class="sub_menu_value">${vo.pj_end_date }</div>
							</div>
						</div>
						<label class="menu_content_label">예상 정산일</label>
						<div class="menu_content_box">
							<div>
								<div class="sub_menu_title">결제 종료일</div>
								<div class="sub_menu_value">${vo.pj_pay_end_date }</div>
							</div>
							<div>
								<div class="sub_menu_title">예상 정산일</div>
								<div class="sub_menu_value">${vo.pj_bill_date }</div>
							</div>
						</div>
						<label class="menu_content_label">선물 구성</label>
						<c:forEach items="${giftList }" var="gift">
							<div class="menu_content_box" id="gift">
								<div>
									<div class="gift_price">${gift.gift_price }원 이상 밀어주시는 분께</div>
									<div class="gift_title">${gift.gift_title }</div>
									<ul class="item_list">
										<c:forEach items="${gift.itemList }" var="item">
											<li>${item.item_title } ( x ${item.item_count } )</li>
										</c:forEach>
									</ul>
									<div class="gift_delivery_date">예상 전달일: ${gift.gift_delivery_date }</div>
								</div>
								<div>
									<c:if test="${gift.gift_max_count ne '0' }">
									<div class="gift_max_count">${gift.gift_max_count }개 한정</div>
									</c:if>
									<c:if test="${gift.gift_delivery_yn eq 'y' }">
										<div class="gift_delivery_yn">배송 필요</div>
									</c:if>
								</div>
							</div>
						</c:forEach>
						<div class="menu_content_box" id="refund">
							<div>
								<div class="sub_menu_title">환불 및 교환 정책</div>
								<div class="sub_menu_value" style="white-space:pre-wrap; text-align: justify">${vo.pj_refund }</div>
							</div>
						</div>
						<div class="menu_content_box" id="class">
							<div>
								<div class="sub_menu_title">상품 분류</div>
								<div class="sub_menu_value">${vo.pj_class }</div>
							</div>
						</div>
					</div>
					<div id="menu3">
						<label class="menu_content_label">프로젝트 스토리</label>
						<div class="menu_content_box" id="story">
							<div>
								<div class="sub_menu_title">프로젝트 스토리</div>
								<div class="sub_menu_value">${vo.pj_story }</div>
							</div>
						</div>
					</div>
					<div id="menu4">
						<label class="menu_content_label">이메일 인증</label>
						<div class="menu_content_box">
							<div>
								<div class="sub_menu_title">이메일 주소</div>
								<div class="sub_menu_value">${vo.pj_email }</div>
							</div>
						</div>
						<label class="menu_content_label">본인 인증</label>
						<div class="menu_content_box">
							<div>
								<div class="sub_menu_title">이름 / 생년월일 / 휴대폰 번호</div>
								<div class="sub_menu_value">${vo.pj_account_name } / ${vo.pj_account_id} / ${vo.pj_phone }</div>
							</div>
						</div>
						<label class="menu_content_label">입금 계좌</label>
						<div class="menu_content_box" id="account">
							<div>
								<div class="sub_menu_value">
									${vo.pj_bank } ${vo.pj_account_name }
									<span class="account_number"><i class="fas fa-lock"></i>&nbsp;&nbsp;&nbsp;끝자리 ${vo.pj_account_number }</span>
								</div>
								<!-- <a href="http://localhost:9090/tumblbugs/admin/fileDownload">
									<div class="file_download">
										<i class="far fa-save" id="file_icon"></i>파일명.jpg
									</div>
								</a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="checklist_sidebar">
				<div class="checklist">
					<div class="list_title">확인 사항</div>
					<label for="checkbox1" class="check-item">
						<div class="icon">
							<input id="checkbox1" type="checkbox">
							<i class="far fa-check-circle" id="false"></i>
							<i class="fas fa-check-circle" id="true"></i>
						</div>
						<div class="message">단순 판매가 아닌 창작자의 창조적인 아이디어에 기반한 프로젝트입니다.</div>
					</label>
					<label for="checkbox2" class="check-item">
						<div class="icon">
							<input id="checkbox2" type="checkbox">
							<i class="far fa-check-circle" id="false"></i>
							<i class="fas fa-check-circle" id="true"></i>
						</div>
						<div class="message">달성 가능한 목표 금액을 설정했습니다.</div>
					</label>
					<label for="checkbox3" class="check-item">
						<div class="icon">
							<input id="checkbox3" type="checkbox">
							<i class="far fa-check-circle" id="false"></i>
							<i class="fas fa-check-circle" id="true"></i>
						</div>
						<div class="message">목표 달성을 위한 적절한 마감일을 설정했습니다.</div>
					</label>
					<label for="checkbox4" class="check-item">
						<div class="icon">
							<input id="checkbox4" type="checkbox">
							<i class="far fa-check-circle" id="false"></i>
							<i class="fas fa-check-circle" id="true"></i>
						</div>
						<div class="message">프로젝트의 선물은 후원자들에게 충분한 메리트가 있는 상품으로 이루어져 있습니다.</div>
					</label>
					<label for="checkbox5" class="check-item">
						<div class="icon">
							<input id="checkbox5" type="checkbox">
							<i class="far fa-check-circle" id="false"></i>
							<i class="fas fa-check-circle" id="true"></i>
						</div>
						<div class="message">선물은 약속된 전달일에 맞춰 제작 및 전달이 가능한 제품입니다.</div>
					</label>
					<label for="checkbox6" class="check-item">
						<div class="icon">
							<input id="checkbox6" type="checkbox">
							<i class="far fa-check-circle" id="false"></i>
							<i class="fas fa-check-circle" id="true"></i>
						</div>
						<div class="message">스토리텔링이 선물 및 프로젝트 진행 계획에 대한 상세한 정보로 이루어져 있습니다.</div>
					</label>
					<label for="checkbox7" class="check-item">
						<div class="icon">
							<input id="checkbox7" type="checkbox">
							<i class="far fa-check-circle" id="false"></i>
							<i class="fas fa-check-circle" id="true"></i>
						</div>
						<div class="message">현재 진행중인 다른 프로젝트의 창작자가 아닙니다.</div>
					</label>
					<label for="checkbox8" class="check-item">
						<div class="icon">
							<input id="checkbox8" type="checkbox">
							<i class="far fa-check-circle" id="false"></i>
							<i class="fas fa-check-circle" id="true"></i>
						</div>
						<div class="message">오탈자 없이 모든 내용이 올바릅니다.</div>
					</label>
				</div>
				<div class="check_result_button">
					<button id="btn_approve" type="button">승인</button>
					<a href="http://localhost:9090/tumblbugs/admin/project_reject/${vo.pj_id}"><button id="btn_reject" type="button">반려</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>