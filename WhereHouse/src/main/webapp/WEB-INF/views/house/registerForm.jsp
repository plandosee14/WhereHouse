<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../header.jsp"%>
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/registerHome.css" />
</head>
<body>
	<center>
		<br> <br> <br>
		<h1>숙소등록</h1>
	</center>
	<form action="register" method="post" enctype="multipart/form-data">
		<div align="center">
		<div class="categoryOutbox" align="left">
		<h3>호스트 정보</h3>
		<div class="categoryInbox">
			<input type="hidden" name="m_id" value="${m_id}">
			<div class="contentList"><div class="contentList Title">이름 : </div>
				<input type="text" name="m_name" value="${m_name}"></div>
			<div class="contentList"><div class="contentList Title">연락처 : </div>
				<input type="text" name="phone1" style="width: 70px;"> - 
				<input type="text" name="phone2" style="width: 100px;"> - 
				<input type="text" name="phone3" style="width: 100px;"></div>
			<div class="contentList"><div class="contentList Title">주소 : </div>
				<input type="text" name="h_zip" id="h_zip">
				<input type="button" value="주소찾기" id="findAd" onclick="openDaumPostcode()"></div>
				<div class="contentList"><div class="contentList Title">&nbsp</div>
					<input type="text" name="h_address" id="h_address" style="width: 300px;"></div>
				<div class="contentList"><div class="contentList Title">&nbsp</div>
					<input type="text" name="addr2" id="addr2" style="width: 300px;"></div>
				<input type="hidden" name="h_pi_x" value="">
				<input type="hidden" name="h_pi_y" value="">
		</div>
		</div>

		<div class="categoryOutbox" align="left">
		<h3>기본 정보</h3>
		<div class="categoryInbox">
			<div class="contentList"><div class="contentList Title">제목 : </div>
				<input type="text" name="h_title"></div>
			<div class="contentList"><div class="contentList Title">가격 : </div>
				<input type="text" name="h_fare"> 원/1박</div>
			<div class="contentList"><div class="contentList Title">할인률 : </div>
				<input type="text" name="h_sale"></div>
			<div class="contentList"><div class="contentList Title">기간 : </div>
				<input type="date" name="startdate" size=10> ~ 
				<input type="date" name="enddate" size=10></div>
			<div class="contentList"><div class="contentList Title">최대인원 : </div>
				<input type="text" name="h_peoplecnt"> 명</div>
			<div class="contentList"><div class="contentList Title">집유형 : </div>
				<select name="h_type">
					<option>주택</option>
					<option>빌라</option>
					<option>아파트</option>
				</select></div>
			<div class="contentList"><div class="contentList Title">숙소유형 : </div>
				<select name="h_livetype">
					<option>집전체</option>
					<option>개인실</option>
					<option>다인실</option>
				</select></div>
			<div class="contentList"><div class="contentList Title">침대</div>
				<input type="text" name="title"> 개</div>
			<div class="contentList"><div class="contentList Title">욕실</div>
				<input type="text" name="title"> 개</div>
			<div class="contentList"><div class="contentList Title">방갯수</div>
				<input type="text" name=""> 개</div>
			<div class="contentList"><div class="contentList Title">체크인: </div>
				<input type="text" name="checkin" style="width: 164px; float:left;">
				<div class="contentList Title">&nbsp~ 체크아웃: </div>
				<input type="text" name="checkout" style="width: 164px; float:left;"><div>&nbsp</div></div>
			<div class="contentList"><div class="contentList Title">규칙</div>
				<textarea rows="20" cols="45" name="h_rule"></textarea></div>
		</div>
		</div>

		<div class="categoryOutbox" align="left">
		<h3>편의시설</h3>
		<div class="categoryInbox">
			<table>
				<tr>
					<td><input type="checkbox" name="h_option" value="o_air">에어컨</td>
					<td><input type="checkbox" name="h_option" value="o_kitchen">주방</td>
					<td><input type="checkbox" name="h_option" value="o_park">주차장</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="h_option" value="o_smoke">흡연</td>
					<td><input type="checkbox" name="h_option" value="o_washer">세탁기</td>
					<td><input type="checkbox" name="h_option" value="o_cook">조리도구</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="h_option" value="o_toiletries">세면도구</td>
					<td><input type="checkbox" name="h_option" value="o_tv">TV</td>
					<td><input type="checkbox" name="h_option" value="o_wifi">와이파이</td>
				</tr>
			</table>
		</div>
		</div>
		
		<div class="categoryOutbox" align="left">
		<h3>소개</h3>
		<div class="categoryInbox">
			<section id="wrapper" style="padding:0; min-height: 240px">
				<article>
					<div class="contentList"><div class="contentList Title"><p id="status">썸네일 사진</p></div>
					<p>
						<input type=file id="thumnail" name="file">
					</p></div>
					<div id="holder" style="padding:0;"></div>
				</article>
				<script>
					var upload = document.getElementById('thumnail'), holder = document
							.getElementById('holder'), state = document
							.getElementById('status');

					if (typeof window.FileReader === 'undefined') {
						state.className = 'fail';
					} else {
						state.className = 'success';

					}

					upload.onchange = function(e) {
						e.preventDefault();

						var file = upload.files[0], reader = new FileReader();
						reader.onload = function(event) {
							var img = new Image();
							img.src = event.target.result;
							// note: no onload required since we've got the dataurl...I think! :)
							if (img.width > 200) { // holder width
								img.width = 200;
							}
							holder.innerHTML = '';
							holder.appendChild(img);
						};
						reader.readAsDataURL(file);

						return false;
					};
				</script>
			</section>
			<div class="contentList"><div class="contentList Title">소개</div>
			<textarea rows="20" cols="45" name="h_info"></textarea></div>
			</div></div>
			<input type="submit" id="submit" class="submitBtn btn_confirm" value="등록">
		</div>
	</form>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function openDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.getElementById("h_zip").value = data.postcode1
							+ "-" + data.postcode2;
					document.getElementById("h_address").value = data.address;
					document.getElementById("addr2").focus();
				}
			}).open();
		}
	</script>

</body>
</html>