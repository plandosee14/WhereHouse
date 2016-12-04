<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3xicslxG92qCXj6ltH4xrVW96C5OhSIE&signed_in=true&callback=initMap" async defer></script>


</head>
<body>
<center>
<h2>숙소등록</h2>
</center>
<form action="register2" method="post" enctype="multipart/form-data">
<br>
<br>
 호스트 등록
<div style="border: 1">	
<input type="hidden" name="m_id" value="${m_id}">
이름 : <input type="text" name="m_name"><br>
연락처 : <input type="text" name="phone1"> - <input type="text" name="phone2"> - <input type="text" name="phone3"><br>
우편번호 : <input type="text" name="h_zip" > <input type="button" value="주소찾기"><br> 
 <input type="text" name="h_address" id="h_address"><br>
 <input type="hidden" name="h_pi_x" value="">
 <input type="hidden" name="h_pi_y" value="">
</div>
<br>
필수정보
<div style="border: 1">	
제목 : <input type="text" name="h_title"><br>
가격 : <input type="text" name="h_fare"><br> 
<!-- 할인률 : <input type="text" name="h_sale"><br>  -->

<!-- 기간 : <input type="date" name="startdate" size=10 > ~ <input type="date" name="enddate" size=10 ><br> -->
<!-- 최대인원 : <input type="text" name="h_peoplecnt"><br> -->

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

체크인아웃 <input type="text" name="h_checktime"> 개 <br>
규칙 <input type="text" name="h_rule"> 개 <br>
</div>

편의시설
<div>
편의시설 <br>
 <input type="checkbox" name="" value="1">1<br>
 <input type="checkbox" name="" value="2">2<br>
 <input type="checkbox" name="" value="3">3<br>
 <input type="checkbox" name="" value="4">4<br>
 <input type="checkbox" name="" value="5">5<br>
 <br><br>
 안전시설 <br>
  <input type="checkbox" name="" value="1">1<br>
 <input type="checkbox" name="" value="2">2<br>
 <input type="checkbox" name="" value="3">3<br>
 <input type="checkbox" name="" value="4">4<br>
 <input type="checkbox" name="" value="5">5<br>
  <br><br>
  사용공간<br>
  <input type="checkbox" name="" value="1">1<br>
 <input type="checkbox" name="" value="2">2<br>
 <input type="checkbox" name="" value="3">3<br>
 <input type="checkbox" name="" value="4">4<br>
 <input type="checkbox" name="" value="5">5<br>
  <br><br>
</div> -->
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
  state.innerHTML = 'File API & FileReader available';
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
<textarea rows="20" cols="50" name="info"></textarea>
<input type="submit">

</div>
</form>
<script>

var geocoder = new google.maps.Geocoder();
geocoder
      .geocode(
            {
               'address' : h_address.val()//지오코더한테 보내줄값이야 주소들어가는 textbox? 에 id값 주고 넣어써줘
            },
            function(results, status) {
               if (status === google.maps.GeocoderStatus.OK) {
                  results[0].geometry.location//이게 나온 위도경도야 이거 스플릿(,)해서 위도컬럼에, 경도 컬럼에 넣으면 될거같음
                  alert( results[0].geometry.location.lat());
                  alert(results[0].geometry.location.lng());
               } else {
                    alert('주소를 변환하는 과정중 오류가 발생');
               }
            });
</script>

</body>
</html>