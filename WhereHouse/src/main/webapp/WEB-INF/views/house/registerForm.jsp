<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../header.jsp" %>
<title>Insert title here</title>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3xicslxG92qCXj6ltH4xrVW96C5OhSIE" async defer>
$(document).ready(function() {
	alert('');
});

</script>


</head>
<body>
<center>
<br>
<br>
<br>
<h2>숙소등록</h2>
</center>
<form action="register" method="post" enctype="multipart/form-data">
<br>
<br>
<호스트 등록>
<div style="border: 1">	
<input type="hidden" name="m_id" value="${m_id}">
이름 : <input type="text" name="m_name" value="${m_name}"><br>
연락처 : <input type="text" name="phone1"> - <input type="text" name="phone2"> - <input type="text" name="phone3"><br>
우편번호 : <input type="text" name="h_zip" id="h_zip"> <input type="button" value="주소찾기" id="findAd" onclick="openDaumPostcode()"><br> 
 <input type="text" name="h_address" id="h_address" size="40"><br>
<input type="text" name="addr2" id="addr2" width="100"><br>
 <input type="hidden" name="h_pi_x" value="">
 <input type="hidden" name="h_pi_y" value="">
</div>
<br>
필수정보
<div style="border: 1">	
제목 : <input type="text" name="h_title"><br>
가격 : <input type="text" name="h_fare"><br> 
 할인률 : <input type="text" name="h_sale"><br> 

 기간 : <input type="date" name="startdate" size=10 > ~ <input type="date" name="enddate" size=10 ><br> 
 최대인원 : <input type="text" name="h_peoplecnt"><br> 

 집유형 : <select name="h_type">
			<option>주택</option>
			<option>빌라</option>
			<option>아파트</option>
       </select><br>
숙소유형 : <select name="h_livetype">
			<option>집전체</option>
			<option>개인실</option>
			<option>다인실</option>
       </select><br> 
침대  <input type="text" name="title"> 개 욕실 <input type="text" name="title"><br>
방갯수 <input type="text" name=""> 개 <br>

체크인아웃 <input type="text" name="h_checktime"> <br>
규칙 
<textarea rows="20" cols="50" name="h_rule"></textarea>
<br>
</div>

편의시설
<div>
 <br>
 <input type="checkbox" name="h_option" value="o_air">에어컨<br>
 <input type="checkbox" name="h_option" value="o_kitchen">주방<br>
 <input type="checkbox" name="h_option" value="o_park">주차장<br>
 <input type="checkbox" name="h_option" value="o_smoke">흡연<br>
 <input type="checkbox" name="h_option" value="o_washer">세탁기<br>
 <input type="checkbox" name="h_option" value="o_cook">조리도구<br>
 <input type="checkbox" name="h_option" value="o_toiletries">세면도구<br>
 <input type="checkbox" name="h_option" value="o_tv">tv<br>
 <input type="checkbox" name="h_option" value="o_wifi">와이파이<br>
 <br><br>

</div> <br>
소개
<div>
<section id="wrapper">

 <article>
  <p id="status">썸네일 사진</p>
  <p><input type=file id="thumnail" name="file"></p>
  <div id="holder"></div>
</article> 
<script>

var upload = document.getElementById('thumnail'),
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';

}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
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

<br>
소개<br>
<textarea rows="20" cols="50" name="h_info"></textarea>
<input type="submit" id="submit" value="등록">

</div>
</form>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function openDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	document.getElementById("h_zip").value = data.postcode1 +"-"+ data.postcode2;
            document.getElementById("h_address").value = data.address;
            document.getElementById("addr2").focus();
        }
    }).open();
}





</script>

</body>
</html>