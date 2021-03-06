<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="menu4_check" value="0" class="all_check">
			<div class="content_menu_title">이메일 인증</div>
			<div id="pro_email">
				<div id="content_m4_c1" class="upload_detail_slide" >
					<label>이메일 주소</label>
					<div id="m4_c2_info" class="sub_info">
						<c:if test="${vo.pj_email != null}">
							<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_email}</span>
						</c:if>
						<c:if test="${vo.pj_email == null}">
							<i class="far fa-hand-point-right"></i> 이메일 주소를 인증해주세요.
						</c:if>
					</div>
					<div id="title_write">
						<c:if test="${vo.pj_email == null}"><i class="far fa-edit"></i> 입력하기</c:if>
						<c:if test="${vo.pj_email != null}">
							<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
								<i class="far fa-edit"></i> 수정하기
							</c:if>
						</c:if>
					</div>
				</div>
				<div id="content_m4_c1_d" class="upload_detail">
					<div class="d_title">이메일 주소</div>
					<div><p>창작자님이 연락받으실 수 있는 이메일을 입력해 주세요. 
							프로젝트 관련 중요 안내사항이 모두 이메일로 전달되므로 평소 자주 확인하는 이메일을 입력하시는 것이 좋습니다.</div>	
					<div><input type="text" id="m4_c1_i1" placeholder="gildong@tumblbugs.com" class="m4_check" value="${vo.pj_email }"/></div>
					<div class="content_btn">
						<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
							<button type="button" class="up_reset"><i class="fas fa-times"></i> 취소하기</button>
							<button type="button" class="up_save"><i class="fas fa-check"></i> 저장하기</button>
						</c:if>
						<c:if test="${vo.pj_check_yn =='c' || vo.pj_check_yn =='y'}">
							<button type="button" class="up_reset" style="position:relative; left:120px;"><i class="fas fa-times"></i> 취소하기</button>
						</c:if>
					</div>
				</div>	
			</div>
								
			<div class="content_menu_title">본인 인증</div>
			<div id="pro_ctf">
				<div id="content_m4_c2" class="upload_detail_slide" >
					<label>휴대폰 번호</label>
					<div id="m4_c2_info" class="sub_info">
						<c:if test="${vo.pj_phone != null}">
							<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_phone}</span>
						</c:if>
						<c:if test="${vo.pj_phone == null}">
							<i class="far fa-hand-point-right"></i> 휴대폰 번호를 인증해주세요.
						</c:if>
					</div>	
					<div id="title_write">
						<c:if test="${vo.pj_phone == null}"><i class="far fa-edit"></i> 입력하기</c:if>
						<c:if test="${vo.pj_phone != null}">
							<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
								<i class="far fa-edit"></i> 수정하기
							</c:if>
						</c:if>
					</div>
				</div>
				<div id="content_m4_c2_d" class="upload_detail">
					<div class="d_title">휴대폰 번호</div>
					<div><p>휴대폰 번호로 한국모바일인증(주)의 본인확인서비스를 통해 본인 인증을 진행합니다.</div>	
					<div>
						<input type="text" id="m4_c2_i1" placeholder="010-****-****" class="m4_check" value="${vo.pj_phone}"/>
					</div>
					<div class="content_btn">
						<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
							<button type="button" class="up_reset"><i class="fas fa-times"></i> 취소하기</button>
							<button type="button" class="up_save"><i class="fas fa-check"></i> 저장하기</button>
						</c:if>
						<c:if test="${vo.pj_check_yn =='c' || vo.pj_check_yn =='y'}">
							<button type="button" class="up_reset" style="position:relative; left:120px;"><i class="fas fa-times"></i> 취소하기</button>
						</c:if>
					</div>
				</div>	
			</div>
								
			<div class="content_menu_title">입금 계좌</div>
			<div id="pro_account">
				<div id="content_m4_c3" class="upload_detail_slide" >
					<label>입금 계좌</label>
					<div id="m4_c3_info" class="sub_info">
						<c:if test="${vo.pj_account_type != null && vo.pj_account_id != null && 
							vo.pj_account_name != null && vo.pj_bank != null && vo.pj_account_number != null }">
								<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_account_number}</span>
						</c:if>
						<c:if test="${vo.pj_account_type == null || vo.pj_account_id == null || 
							vo.pj_account_name == null || vo.pj_bank == null || vo.pj_account_number == null }">
							<i class="far fa-hand-point-right"></i> 본인 인증 후 입금 계좌 등록이 가능합니다.
						</c:if>
					</div>
					<div id="title_write">
						<c:if test="${vo.pj_account_type == null}"><i class="far fa-edit"></i> 입력하기</c:if>
						<c:if test="${vo.pj_account_type != null}">
							<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
								<i class="far fa-edit"></i> 수정하기
							</c:if>
						</c:if>
					</div>	
				</div>
				<div id="content_m4_c3_d" class="upload_detail">
					<div class="d_title">계좌 종류</div>
					<div id="accont_info">
						<div id="account_radio">
							<div><input type="radio" name="account_type" class="account_type" id="personal_radio" value="개인" checked="checked"/>개인</div>
							<div><input type="radio" name="account_type" class="account_type" id="business_radio" value="사업자"/>사업자(개인사업자 포함)</div>
						</div>
						<div id="personal_account">
							<div>
								<div>예금주 생년월일</div>
								<div><p>입력하신 생년월일은 입금 계좌를 인증하는데 사용됩니다.</div>
								<input type="text" class="m4_check" id="pj_account_id" />
							</div>
							<div>
								<div>예금주명</div>
								<input type="text" class="m4_check" id="pj_account_name" />
							</div>
							<div>
								<div>거래 은행</div>
								<select id="personal_bank" class="m4_check">
									<option value="" selected disabled hidden>은행을 선택하세요</option>
									<option>KDB산업은행</option>
									<option>BOA</option>
									<option>IBK기업은행</option>
									<option>KB국민은행</option>
									<option>NH농협</option>
									<option>NH투자증권</option>
									<option>SC은행</option>
									<option>경남은행</option>
									<option>광주은행</option>
									<option>대구은행</option>
									<option>대신증권</option>
									<option>미래에셋</option>
									<option>부산은행</option>
									<option>삼성증권</option>
									<option>새마을은행</option>
									<option>수협은행</option>
									<option>신한은행</option>
									<option>신협은행</option>
									<option>씨티은행</option>
									<option>외환은행</option>
									<option>우리은행</option>
									<option>우체국</option>
									<option>유안타증권</option>
									<option>전북은행</option>
									<option>제주은행</option>
								</select>
							</div>
							<div>
								<div>계좌번호</div>
								<input type="text" id="pj_account_number" class="m4_check" />
								<label>숫자로만 입력해주세요</label>
							</div>
						</div>
						
						<div id="business_account" style="display:none">
							<div>
								<div>사업자 번호</div>
								<div><p>입력하신 사업자 번호는 입금 계좌를 인증하는데 사용됩니다.</div>
								<input type="text" class="m4_check" id="pj_account_id2" />
							</div>
							<div>
								<div>예금주명</div>
								<input type="text" class="m4_check" id="pj_account_name2"/>
							</div>
							<div>
								<div>거래 은행</div>
								<select id="business_bank" class="m4_check">
									<option value="" selected disabled hidden>은행을 선택하세요</option>
									<option>KDB산업은행</option>
									<option>BOA</option>
									<option>IBK기업은행</option>
									<option>KB국민은행</option>
									<option>NH농협</option>
									<option>NH투자증권</option>
									<option>SC은행</option>
									<option>경남은행</option>
									<option>광주은행</option>
									<option>대구은행</option>
									<option>대신증권</option>
									<option>미래에셋</option>
									<option>부산은행</option>
									<option>삼성증권</option>
									<option>새마을은행</option>
									<option>수협은행</option>
									<option>신한은행</option>
									<option>신협은행</option>
									<option>씨티은행</option>
									<option>외환은행</option>
									<option>우리은행</option>
									<option>우체국</option>
									<option>유안타증권</option>
									<option>전북은행</option>
									<option>제주은행</option>
								</select>
							</div>
							<div>
								<div>계좌번호</div>
								<input type="text" class="m4_check" id="pj_account_number2" />
								<label>숫자로만 입력해주세요</label>
							</div>
						</div>
					</div>
					<div class="content_btn">
						<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
							<button type="button" class="up_reset"><i class="fas fa-times"></i> 취소하기</button>
							<button type="button" class="up_save" id="m4_c3_save"><i class="fas fa-check"></i> 저장하기</button>
						</c:if>
						<c:if test="${vo.pj_check_yn =='c' || vo.pj_check_yn =='y'}">
							<button type="button" class="up_reset" style="position:relative; left:120px;"><i class="fas fa-times"></i> 취소하기</button>
						</c:if>
					</div>
				</div>	
			</div>
</body>
</html>