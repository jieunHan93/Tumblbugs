<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="menu1_check" value="0" class="all_check">
 <div class="content_menu_title">프로젝트 개요</div>
	<div id="pro_intro">
		<div id="content_pro_title" class="upload_detail_slide" >
			<label>프로젝트 제목</label>
			<div id="title_info" class="sub_info">
				<c:if test="${vo.pj_title != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_title}</span>
				</c:if>
				<c:if test="${vo.pj_stitle != null}">
					<span id='stitle_info'>${vo.pj_stitle}</span>
				</c:if>
				<c:if test="${vo.pj_title == null}">
					<i class="far fa-hand-point-right"></i> 프로젝트 제목을 입력해주세요.  <span id="stitle_info" style="display:none"></span>
				</c:if>
			</div>
			<div id="title_write">
				<c:if test="${vo.pj_title == null}"><i class="far fa-edit"></i> 입력하기</c:if>
				<c:if test="${vo.pj_title != null}">
					<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
						<i class="far fa-edit"></i> 수정하기
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="content_pro_title_d" class="upload_detail">
			<div class="d_title">프로젝트 제목</div>
			<div><p>프로젝트에 멋진 제목을 붙여주세요. 감정에 호소하는 제목보다는 만드시려는 창작물, 
					작품명, 혹은 프로젝트의 주제가 드러나게 써주시는 것이 좋습니다. 
					공간이 부족한 곳에 쓰일 7자 이내의 짧은 제목도 정해주세요.</div>
			<ul>
				<li>
					<div><i class="fas fa-question-circle"></i> 프로젝트 제목은 어디에 쓰이나요?</div>
					<img src="http://localhost:9090/tumblbugs/images/project_start/title_1.png "/>
					<div>프로젝트 제목</div>
					<input type="text" placeholder="프로젝트 제목을 입력해주세요" class="m1_check" id="m1_c1_i1" value="${vo.pj_title }">
					<div id="m1_c1_i1_check">32자 남았습니다.</div>
				</li>
				<li>
					<div><i class="fas fa-question-circle"></i> 프로젝트 짧은 제목은 어디에 쓰이나요?</div>
					<img src="http://localhost:9090/tumblbugs/images/project_start/title_2.png "/>
					<div>프로젝트 짧은 제목</div>
					<input type="text" placeholder="프로젝트 짧은 제목" class="m1_check" id="m1_c1_i2" value="${vo.pj_stitle }" >
					<div id="m1_c1_i2_check">7자 남았습니다.</div>
				</li>
			</ul>
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
		<div id="content_pro_img" class="upload_detail_slide" >
			<label>프로젝트 대표 이미지</label>
			<div id="img_info" class="sub_info">
				<c:if test="${vo.pj_simg != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_img}</span>
				</c:if>
				<c:if test="${vo.pj_simg == null}">
					<i class="far fa-hand-point-right"></i> 프로젝트 대표 이미지를 등록해주세요.	
				</c:if>
			</div>
			<div id="title_write">
				<c:if test="${vo.pj_simg == null}"><i class="far fa-edit"></i> 입력하기</c:if>
				<c:if test="${vo.pj_simg != null}">
					<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
						<i class="far fa-edit"></i> 수정하기
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="content_pro_img_d" class="upload_detail">
			<div class="d_title">프로젝트 대표 이미지</div>
			<div><p>대표 이미지는 프로젝트의 가장 중요한 시각적 요소입니다.<br>
					후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있게 
					하기 위해 다음 가이드라인에 따라 디자인해 주세요.</div>
			<div><img src="http://localhost:9090/tumblbugs/images/project_start/pro_img2.png"></div>	
			<div><img src="http://localhost:9090/tumblbugs/images/project_start/pro_img3.png"></div>
			<div id="img_uploadzone" >
				<label for="pro_img" id="img_upload_btn">
					<i class="far fa-file-image"></i>
					<span>이미지 업로드</span>
					<span>파일 형식은 jpg 또는 png로, 사이즈는 가로 1,240px 세로 930px 이상으로 올려주세요.</span>
					<span>이미지 파일 선택하기</span>
				</label>
				<div><input type="file" class="m1_check" id="pro_img" style="display:none" name="pj_cimg" value="${vo.pj_img }"></div>
				
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
		
		<div id="content_pro_summ" class="upload_detail_slide" >
			<label>프로젝트 요약</label>
			<div id="summ_info" class="sub_info">
				<c:if test="${vo.pj_summary != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_summary}</span>
				</c:if>
				<c:if test="${vo.pj_summary == null}">
					<i class="far fa-hand-point-right"></i> 프로젝트 요약을 입력해주세요.	
				</c:if>
			</div>
			<div id="title_write">
				<c:if test="${vo.pj_summary == null}"><i class="far fa-edit"></i> 입력하기</c:if>
				<c:if test="${vo.pj_summary != null}">
					<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
						<i class="far fa-edit"></i> 수정하기
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="content_pro_summ_d" class="upload_detail">
			<div class="d_title">프로젝트 요약</div>
			<div><p>후원자 분들에게 본 프로젝트를 간략하게 소개해 봅시다.</div>	
			<div><textarea placeholder="프로젝트 요약을 입력해주세요" style="resize:none" class="m1_check" id="m1_c3_i1">${vo.pj_summary }</textarea></div>	
			<div id="m1_c3_len">50자 남았습니다</div>				
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
		
		<div id="content_pro_category" class="upload_detail_slide" >
			<label>프로젝트 카테고리</label>
			<div id="category_info" class="sub_info">
				<c:if test="${vo.pj_category != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_category}</span>
				</c:if>
				<c:if test="${vo.pj_category == null}">
					<i class="far fa-hand-point-right"></i> 프로젝트 카테고리를 입력해주세요.
				</c:if>
			</div>		
			<div id="title_write">
				<c:if test="${vo.pj_category == null}"><i class="far fa-edit"></i> 입력하기</c:if>
				<c:if test="${vo.pj_category != null}">
					<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
						<i class="far fa-edit"></i> 수정하기
					</c:if>
				</c:if>
			</div>	
		</div>
		<div id="content_pro_category_d" class="upload_detail">
			<div class="d_title">프로젝트 카테고리</div>
			<div><p>프로젝트의 성격에 맞는 카테고리를 선택해 주세요.<br>
					(프로젝트 성격과 맞지 않는 카테고리를 선택하실 시 후원자가 해당 프로젝트를 찾기 어려워지기에 에디터에 의해 조정될 수 있습니다.)</div>	
			<div><select class="m1_check" id="m1_select">
				<option value="" selected disabled hidden>프로젝트 카테고리를 정해주세요.</option>
				<option id="game">게임</option>
				<option id="concert">공연</option>
				<option id="design">디자인</option>
				<option id="comic">만화</option>
				<option id="art">미술</option>
				<option id="craft">공예</option>
				<option id="photo">사진</option>
				<option id="movie">영화&비디오</option>
				<option id="food">푸드</option>
				<option id="music">음악</option>
				<option id="book">출판</option>	
				<option id="tech">테크놀로지</option>	
				<option id="fashion">패션</option>	
				<option id="campagn">캠페인</option>	
			</select></div>				
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
		
		<div id="content_pro_addr" class="upload_detail_slide" >
			<label>프로젝트 페이지 주소</label>
			<div id="addr_info" class="sub_info">
				<c:if test="${vo.pj_addr != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_addr}</span>
				</c:if>
				<c:if test="${vo.pj_addr == null}">
					<i class="far fa-hand-point-right"></i> 프로젝트 페이지 주소를 입력해주세요.
				</c:if>
			</div>	
			<div id="title_write">
				<c:if test="${vo.pj_addr == null}"><i class="far fa-edit"></i> 입력하기</c:if>
				<c:if test="${vo.pj_addr != null}">
					<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
						<i class="far fa-edit"></i> 수정하기
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="content_pro_addr_d" class="upload_detail">
			<div class="d_title">프로젝트 페이지 주소</div>
			<div><p>프로젝트 페이지로 접속할 수 있는 주소(URL)를 설정해주세요.</div>	
			<div>
				<span>https://localhost:9090/tumblbugs/project/</span>
				<input type="text" style="resize:none" class="m1_check" id="m1_c4_i1" value="${vo.pj_addr }"/>
				<div id="m1_c4_len">50자 남았습니다</div>
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
		
		<div id="content_pro_tag" class="upload_detail_slide" >
			<label>검색용 태그</label>
			<div id="tag_info" class="sub_info">
				<c:if test="${vo.pj_tag != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_tag}</span>
				</c:if>
				<c:if test="${vo.pj_tag == null}">
					<i class="far fa-hand-point-right"></i> 예시:뱃지, 웹툰, 에코백, 고양이, 유기견
				</c:if>
			</div>	
			<div id="title_write">
				<c:if test="${vo.pj_tag == null}"><i class="far fa-edit"></i> 입력하기</c:if>
				<c:if test="${vo.pj_tag != null}">
					<c:if test="${vo.pj_check_yn !='c' && vo.pj_check_yn !='y'}">
						<i class="far fa-edit"></i> 수정하기
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="content_pro_tag_d" class="upload_detail">
			<div class="d_title">검색용 태그</div>
			<div><p>내외부 검색 엔진에서 프로젝트가 잘 검색될 수 있도록, 사람들이 검색할만한 프로젝트의 핵심 단어를 입력해주세요.<br>
					여러 개의 태그를 입력하시는 경우 쉼표(,)로 구분하여 작성하실 수 있습니다.<br>
					프로젝트와 관련 없거나 검색에 불리한 키워드는 운영진에 의해 조정될 수 있습니다.<br>
					쉼표를 제외한 특수문자는 입력하실 수 없습니다.</div>	
			<div>
				<input type="text" placeholder="  예시:뱃지, 웹툰, 에코백, 고양이, 유기견" style="resize:none" class="m1_check" id="m1_c5_i1" value="${vo.pj_tag}"/>
			</div>	
			<div>쉼표를 제외한 특수문자는 입력하실 수 없습니다.</div>	
			<div id="m1_c5_len"><span>50자 남았습니다</span></div>				
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
	
	<div class="content_menu_title">창작자 정보</div>
	<div id="pro_my_info">
		<div id="content_my_img" class="upload_detail_slide" >
			<label>프로필 이미지</label>
			<div id="my_img_info" class="sub_info">
				<c:if test="${mvo.profile_img != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${mvo.profile_img}</span>
				</c:if>
				<c:if test="${mvo.profile_img == null}">
					<i class="far fa-hand-point-right"></i> 프로필 이미지를 등록해주세요.
				</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${mvo.profile_img == null}"> 입력하기</c:if>
				<c:if test="${mvo.profile_img != null}"> 수정하기</c:if>
			</div>
		</div>
		<div id="content_my_img_d" class="upload_detail">
			<div class="d_title" id="my_profile_img">프로필 이미지</div>
			<div><p>창작자님 개인이나 팀의 사진을 올려주세요. 얼굴이 나온 사진을 넣으면 프로젝트의 신뢰성 향상에 도움이 됩니다.</div>	
			<div>
				<div id="my_d_img" style="background-image:url('http://localhost:9090/tumblbugs/resources/upload/${mvo.profile_simg}')"></div>
				<div>파일 형식은 jpg 또는 png로, 사이즈는 가로 200px, 세로 200px 이상으로 올려주세요.</div>
				<div>
					<label for="my_pro_img"><i class="fas fa-upload"></i>  파일 선택하기</label>
					<input type=file id="my_pro_img" style="display:none" name="profile_cimg">
				</div>
			</div>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> 취소하기</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> 저장하기</button>
			</div>
		</div>	
	
		<div id="content_my_name" class="upload_detail_slide" >
			<label>창작자 이름</label>
			<div id="my_name_info" class="sub_info">
				<c:if test="${mvo.name != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${mvo.name}</span>
				</c:if>
				<c:if test="${mvo.name == null}">
					<i class="far fa-hand-point-right"></i> 창작자 이름을 입력해주세요.
				</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${mvo.name == null}"> 입력하기</c:if>
				<c:if test="${mvo.name != null}"> 수정하기</c:if>
			</div>
		</div>
		<div id="content_my_name_d" class="upload_detail">
			<div class="d_title">창작자 이름</div>
			<div><p>창작자님을 대표할 수 있는 이름을 써 주세요. 팀으로 진행하신다면 팀 이름을 쓰셔도 됩니다</div>	
			<div>
				<input type="text" placeholder=" 이름을 입력해주세요." style="resize:none"id="m1_c6_i1" value="${mvo.name}"/>
				<div id="m1_c6_len">20자 남았습니다.</div>
			</div>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> 취소하기</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> 저장하기</button>
			</div>
		</div>	
		
		<div id="content_my_intro" class="upload_detail_slide" >
			<label>창작자 소개</label>
			<div id="my_intro_info" class="sub_info">
			<c:if test="${mvo.intro != null}">
				<span style="color:black; font-size:10pt; font-weight:550;" >${mvo.intro}</span>
			</c:if>
			<c:if test="${mvo.intro == null}">
				<i class="far fa-hand-point-right"></i> 창작자 소개를 입력해주세요.
			</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${mvo.intro == null}"> 입력하기</c:if>
				<c:if test="${mvo.intro != null}"> 수정하기</c:if>
			</div>
		</div>
		<div id="content_my_intro_d" class="upload_detail">
			<div class="d_title">창작자 소개</div>
			<div><p>창작자님의 이력과 간단한 소개를 써 주세요.</div>	
			<div>
				<div><i class="fas fa-question-circle"></i> 창작자 소개는 어디에 쓰이나요?</div>
				<div><p>프로젝트 페이지를 방문하는 후원자들이 '크리에이터 자세히 보기'를 클릭하면, 창작자님의 과거 텀블벅 프로젝트들과 함께 창작자 소개 문구가 표시됩니다. 
						2~3문장으로 간략하게 어떤 작업을 위주로 활동해 온 창작자인지 알려주세요.
				</div>
			</div>
			<div><textarea placeholder="창작자 소개를 입력해주세요." style="resize:none" id="m1_c7_i1"><c:if test="${mvo.intro != null}">${mvo.intro}</c:if>
			</textarea></div>
			<div id="m1_c7_len">300자 남았습니다</div>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> 취소하기</button>
				<button type="button"  class="up_save"><i class="fas fa-check"></i> 저장하기</button>
			</div>
		</div>	
		</div>
</body>
</html>