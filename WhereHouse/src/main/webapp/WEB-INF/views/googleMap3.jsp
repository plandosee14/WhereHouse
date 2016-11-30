<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<header><%@include file="header.jsp"%></header>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
    var map;
  /* 클릭한 마커의 ID, 좌표를 관리할 배열 생성 */
  var markersArray = [];

  /* 초기화 */
  function initialize() {
    /* 초기화 나타날 지도 센터의 좌표 */
    var haightAshbury = new google.maps.LatLng(37.5400615, 126.73338309999997);
    var mapOptions = {
      zoom: 17,
      center: haightAshbury,
      /* 출력한 지도 타입 */
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };

    /* 맵 생성 */
    map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
    
    /* 사용자의 이벤트처리할 리스너 */
    google.maps.event.addListener(map, 'click', function(event) {
      addMarker(event.latLng);
    });
  }
  
  function addMarker(location) {
    marker = new google.maps.Marker({
      position: location,
      map: map
  });
    /* 맵의 입력 */
    markersArray.push(marker);
  }

  // Removes the overlays from the map, but keeps them in the array
  /* 마커 지도(화면단)에서 지우기(실제 정보는 존재) */
  function clearOverlays() {
    if (markersArray) {
      for (i in markersArray) {
        markersArray[i].setMap(null);
      }
    }
  }

  // Shows any overlays currently in the array
  function showOverlays() {
    if (markersArray) {
      for (i in markersArray) {
        markersArray[i].setMap(map);
      }
    }
  }

  // Deletes all markers in the array by removing references to them
  /* 마커정보 완전 삭제 */
  function deleteOverlays() {
    if (markersArray) {
        for (i in markersArray) {
        /* 마케지우고 */
        markersArray[i].setMap(null);
    }
      /* 마커정보 배열 지우기 */
      markersArray.length = 0;
    }
  }
</script> 
</head> 
<body onload="initialize();"> 
  <div>
  <div><br><br><br><br><br><br></div>
    <input onclick="clearOverlays();" type=button value="오버레이 지우기" /> 
    <input onclick="showOverlays();" type=button value="오버레이 모두 표시" /> 
    <input onclick="deleteOverlays();" type=button value="오버레이 삭제" /> 
  </div> 
  <div id="map_canvas" style="top:30px;width:600px; height:500px"></div> 
	</script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDe7x-HKwY406_yjbfUjdESOr6EU18801g&signed_in=true&callback=initMap"
		async defer></script>
</body> 
</html> 


