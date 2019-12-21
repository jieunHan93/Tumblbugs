<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="menu1_check" value="0" class="all_check">
 <div class="content_menu_title">������Ʈ ����</div>
	<div id="pro_intro">
		<div id="content_pro_title" class="upload_detail_slide" >
			<label>������Ʈ ����</label>
			<div id="title_info" class="sub_info">
				<c:if test="${vo.pj_title != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_title}</span>
				</c:if>
				<c:if test="${vo.pj_stitle != null}">
					<span id='stitle_info'>${vo.pj_stitle}</span>
				</c:if>
				<c:if test="${vo.pj_title == null}">
					<i class="far fa-hand-point-right"></i> ������Ʈ ������ �Է����ּ���.  <span id="stitle_info" style="display:none"></span>
				</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${vo.pj_title == null}"> �Է��ϱ�</c:if>
				<c:if test="${vo.pj_title != null}"> �����ϱ�</c:if>
			</div>
		</div>
		<div id="content_pro_title_d" class="upload_detail">
			<div class="d_title">������Ʈ ����</div>
			<div><p>������Ʈ�� ���� ������ �ٿ��ּ���. ������ ȣ���ϴ� ���񺸴ٴ� ����÷��� â�۹�, 
					��ǰ��, Ȥ�� ������Ʈ�� ������ �巯���� ���ֽô� ���� �����ϴ�. 
					������ ������ ���� ���� 7�� �̳��� ª�� ���� �����ּ���.</div>
			<ul>
				<li>
					<div><i class="fas fa-question-circle"></i> ������Ʈ ������ ��� ���̳���?</div>
					<img src="http://localhost:9090/tumblbugs/images/project_start/title_1.png "/>
					<div>������Ʈ ����</div>
					<input type="text" placeholder="������Ʈ ������ �Է����ּ���" class="m1_check" id="m1_c1_i1" value="${vo.pj_title }">
					<div id="m1_c1_i1_check">32�� ���ҽ��ϴ�.</div>
				</li>
				<li>
					<div><i class="fas fa-question-circle"></i> ������Ʈ ª�� ������ ��� ���̳���?</div>
					<img src="http://localhost:9090/tumblbugs/images/project_start/title_2.png "/>
					<div>������Ʈ ª�� ����</div>
					<input type="text" placeholder="������Ʈ ª�� ����" class="m1_check" id="m1_c1_i2" value="${vo.pj_stitle }" >
					<div id="m1_c1_i2_check">7�� ���ҽ��ϴ�.</div>
				</li>
			</ul>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>
		<div id="content_pro_img" class="upload_detail_slide" >
			<label>������Ʈ ��ǥ �̹���</label>
			<div id="img_info" class="sub_info">
				<c:if test="${vo.pj_simg != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_img}</span>
				</c:if>
				<c:if test="${vo.pj_simg == null}">
					<i class="far fa-hand-point-right"></i> ������Ʈ ��ǥ �̹����� ������ּ���.	
				</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${vo.pj_title == null}"> �Է��ϱ�</c:if>
				<c:if test="${vo.pj_title != null}"> �����ϱ�</c:if>
			</div>
		</div>
		<div id="content_pro_img_d" class="upload_detail">
			<div class="d_title">������Ʈ ��ǥ �̹���</div>
			<div><p>��ǥ �̹����� ������Ʈ�� ���� �߿��� �ð��� ����Դϴ�.<br>
					�Ŀ��ڵ��� ������Ʈ�� ������ ���� �ľ��ϰ� ���� �λ��� ���� �� �ְ� 
					�ϱ� ���� ���� ���̵���ο� ���� �������� �ּ���.</div>
			<div><img src="http://localhost:9090/tumblbugs/images/project_start/pro_img2.png"></div>	
			<div><img src="http://localhost:9090/tumblbugs/images/project_start/pro_img3.png"></div>
			<div id="img_uploadzone" >
				<label for="pro_img" id="img_upload_btn">
					<i class="far fa-file-image"></i>
					<span>�̹��� ���ε�</span>
					<span>���� ������ jpg �Ǵ� png��, ������� ���� 1,240px ���� 930px �̻����� �÷��ּ���.</span>
					<span>�̹��� ���� �����ϱ�</span>
				</label>
				<div><input type="file" class="m1_check" id="pro_img" style="display:none" name="pj_cimg" value="${vo.pj_img }"></div>
				
			</div>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>
		
		<div id="content_pro_summ" class="upload_detail_slide" >
			<label>������Ʈ ���</label>
			<div id="summ_info" class="sub_info">
				<c:if test="${vo.pj_summary != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_summary}</span>
				</c:if>
				<c:if test="${vo.pj_summary == null}">
					<i class="far fa-hand-point-right"></i> ������Ʈ ����� �Է����ּ���.	
				</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${vo.pj_title == null}"> �Է��ϱ�</c:if>
				<c:if test="${vo.pj_title != null}"> �����ϱ�</c:if>
			</div>
		</div>
		<div id="content_pro_summ_d" class="upload_detail">
			<div class="d_title">������Ʈ ���</div>
			<div><p>�Ŀ��� �е鿡�� �� ������Ʈ�� �����ϰ� �Ұ��� ���ô�.</div>	
			<div><textarea placeholder="������Ʈ ����� �Է����ּ���" style="resize:none" class="m1_check" id="m1_c3_i1">${vo.pj_summary }</textarea></div>	
			<div id="m1_c3_len">50�� ���ҽ��ϴ�</div>				
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>
		
		<div id="content_pro_category" class="upload_detail_slide" >
			<label>������Ʈ ī�װ���</label>
			<div id="category_info" class="sub_info">
				<c:if test="${vo.pj_category != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_category}</span>
				</c:if>
				<c:if test="${vo.pj_category == null}">
					<i class="far fa-hand-point-right"></i> ������Ʈ ī�װ����� �Է����ּ���.
				</c:if>
			</div>		
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${vo.pj_category == null}"> �Է��ϱ�</c:if>
				<c:if test="${vo.pj_category != null}"> �����ϱ�</c:if>
			</div>	
		</div>
		<div id="content_pro_category_d" class="upload_detail">
			<div class="d_title">������Ʈ ī�װ���</div>
			<div><p>������Ʈ�� ���ݿ� �´� ī�װ����� ������ �ּ���.<br>
					(������Ʈ ���ݰ� ���� �ʴ� ī�װ����� �����Ͻ� �� �Ŀ��ڰ� �ش� ������Ʈ�� ã�� ��������⿡ �����Ϳ� ���� ������ �� �ֽ��ϴ�.)</div>	
			<div><select class="m1_check" id="m1_select">
				<option value="" selected disabled hidden>������Ʈ ī�װ����� �����ּ���.</option>
				<option id="game">����</option>
				<option id="concert">����</option>
				<option id="design">������</option>
				<option id="comic">��ȭ</option>
				<option id="art">�̼�</option>
				<option id="craft">����</option>
				<option id="photo">����</option>
				<option id="movie">��ȭ&����</option>
				<option id="food">Ǫ��</option>
				<option id="music">����</option>
				<option id="book">����</option>	
				<option id="tech">��ũ�����</option>	
				<option id="fashion">�м�</option>	
				<option id="campagn">ķ����</option>	
			</select></div>				
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>
		
		<div id="content_pro_addr" class="upload_detail_slide" >
			<label>������Ʈ ������ �ּ�</label>
			<div id="addr_info" class="sub_info">
				<c:if test="${vo.pj_addr != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_addr}</span>
				</c:if>
				<c:if test="${vo.pj_addr == null}">
					<i class="far fa-hand-point-right"></i> ������Ʈ ������ �ּҸ� �Է����ּ���.
				</c:if>
			</div>	
			<div id="title_write"><i class="far fa-edit"></i> �Է��ϱ�</div>
		</div>
		<div id="content_pro_addr_d" class="upload_detail">
			<div class="d_title">������Ʈ ������ �ּ�</div>
			<div><p>������Ʈ �������� ������ �� �ִ� �ּ�(URL)�� �������ּ���.</div>	
			<div>
				<span>https://localhost:9090/tumblbugs/</span>
				<input type="text" style="resize:none" class="m1_check" id="m1_c4_i1" value="${vo.pj_addr }"/>
				<div id="m1_c4_len">50�� ���ҽ��ϴ�</div>
			</div>			
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>
		
		<div id="content_pro_tag" class="upload_detail_slide" >
			<label>�˻��� �±�</label>
			<div id="tag_info" class="sub_info">
				<c:if test="${vo.pj_tag != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${vo.pj_tag}</span>
				</c:if>
				<c:if test="${vo.pj_tag == null}">
					<i class="far fa-hand-point-right"></i> ����:����, ����, ���ڹ�, ������, �����
				</c:if>
			</div>	
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${vo.pj_tag == null}"> �Է��ϱ�</c:if>
				<c:if test="${vo.pj_tag != null}"> �����ϱ�</c:if>
			</div>
		</div>
		<div id="content_pro_tag_d" class="upload_detail">
			<div class="d_title">�˻��� �±�</div>
			<div><p>���ܺ� �˻� �������� ������Ʈ�� �� �˻��� �� �ֵ���, ������� �˻��Ҹ��� ������Ʈ�� �ٽ� �ܾ �Է����ּ���.<br>
					���� ���� �±׸� �Է��Ͻô� ��� ��ǥ(,)�� �����Ͽ� �ۼ��Ͻ� �� �ֽ��ϴ�.<br>
					������Ʈ�� ���� ���ų� �˻��� �Ҹ��� Ű����� ����� ���� ������ �� �ֽ��ϴ�.<br>
					��ǥ�� ������ Ư�����ڴ� �Է��Ͻ� �� �����ϴ�.</div>	
			<div>
				<input type="text" placeholder="  ����:����, ����, ���ڹ�, ������, �����" style="resize:none" class="m1_check" id="m1_c5_i1" value="${vo.pj_tag}"/>
			</div>	
			<div>��ǥ�� ������ Ư�����ڴ� �Է��Ͻ� �� �����ϴ�.</div>	
			<div id="m1_c5_len"><span>50�� ���ҽ��ϴ�</span></div>				
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>
		</div>
	
	<div class="content_menu_title">â���� ����</div>
	<div id="pro_my_info">
		<div id="content_my_img" class="upload_detail_slide" >
			<label>������ �̹���</label>
			<div id="my_img_info" class="sub_info">
				<c:if test="${mvo.profile_img != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${mvo.profile_img}</span>
				</c:if>
				<c:if test="${mvo.profile_img == null}">
					<i class="far fa-hand-point-right"></i> ������ �̹����� ������ּ���.
				</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${mvo.profile_img == null}"> �Է��ϱ�</c:if>
				<c:if test="${mvo.profile_img != null}"> �����ϱ�</c:if>
			</div>
		</div>
		<div id="content_my_img_d" class="upload_detail">
			<div class="d_title" id="my_profile_img">������ �̹���</div>
			<div><p>â���ڴ� �����̳� ���� ������ �÷��ּ���. ���� ���� ������ ������ ������Ʈ�� �ŷڼ� ��� ������ �˴ϴ�.</div>	
			<div>
				<div id="my_d_img"></div>
				<div>���� ������ jpg �Ǵ� png��, ������� ���� 200px, ���� 200px �̻����� �÷��ּ���.</div>
				<div>
					<label for="my_pro_img"><i class="fas fa-upload"></i>  ���� �����ϱ�</label>
					<input type=file id="my_pro_img" style="display:none" class="m1_check" name="profile_cimg">
				</div>
			</div>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>	
	
		<div id="content_my_name" class="upload_detail_slide" >
			<label>â���� �̸�</label>
			<div id="my_name_info" class="sub_info">
				<c:if test="${mvo.name != null}">
					<span style="color:black; font-size:11pt; font-weight:550;">${mvo.name}</span>
				</c:if>
				<c:if test="${mvo.name == null}">
					<i class="far fa-hand-point-right"></i> â���� �̸��� �Է����ּ���.
				</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${mvo.name == null}"> �Է��ϱ�</c:if>
				<c:if test="${mvo.name != null}"> �����ϱ�</c:if>
			</div>
		</div>
		<div id="content_my_name_d" class="upload_detail">
			<div class="d_title">â���� �̸�</div>
			<div><p>â���ڴ��� ��ǥ�� �� �ִ� �̸��� �� �ּ���. ������ �����ϽŴٸ� �� �̸��� ���ŵ� �˴ϴ�</div>	
			<div>
				<input type="text" placeholder=" �̸��� �Է����ּ���." style="resize:none" class="m1_check" id="m1_c6_i1" value="${mvo.name}"/>
				<div id="m1_c6_len">20�� ���ҽ��ϴ�.</div>
			</div>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button" class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>	
		
		<div id="content_my_intro" class="upload_detail_slide" >
			<label>â���� �Ұ�</label>
			<div id="my_intro_info" class="sub_info">
			<c:if test="${mvo.intro != null}">
				<span style="color:black; font-size:11pt; font-weight:550;">${mvo.intro}</span>
			</c:if>
			<c:if test="${mvo.intro == null}">
				<i class="far fa-hand-point-right"></i> â���� �Ұ��� �Է����ּ���.
			</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${mvo.intro == null}"> �Է��ϱ�</c:if>
				<c:if test="${mvo.intro != null}"> �����ϱ�</c:if>
			</div>
		</div>
		<div id="content_my_intro_d" class="upload_detail">
			<div class="d_title">â���� �Ұ�</div>
			<div><p>â���ڴ��� �̷°� ������ �Ұ��� �� �ּ���.</div>	
			<div>
				<div><i class="fas fa-question-circle"></i> â���� �Ұ��� ��� ���̳���?</div>
				<div><p>������Ʈ �������� �湮�ϴ� �Ŀ��ڵ��� 'ũ�������� �ڼ��� ����'�� Ŭ���ϸ�, â���ڴ��� ���� �Һ��� ������Ʈ��� �Բ� â���� �Ұ� ������ ǥ�õ˴ϴ�. 
						2~3�������� �����ϰ� � �۾��� ���ַ� Ȱ���� �� â�������� �˷��ּ���.
				</div>
			</div>
			<div><textarea placeholder="â���� �Ұ��� �Է����ּ���." style="resize:none" class="m1_check" id="m1_c7_i1"><c:if test="${mvo.intro != null}">${mvo.intro}</c:if>
			</textarea></div>
			<div id="m1_c7_len">300�� ���ҽ��ϴ�</div>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> ����ϱ�</button>
				<button type="button"  class="up_save"><i class="fas fa-check"></i> �����ϱ�</button>
			</div>
		</div>	
		</div>
</body>
</html>