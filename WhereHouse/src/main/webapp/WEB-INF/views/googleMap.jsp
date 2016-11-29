<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDe7x-HKwY406_yjbfUjdESOr6EU18801g&sensor=true"></script>
<head>
<header><%@include file="header.jsp"%></header>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
    function initialize() {
        var mapOptions = {
                            zoom: 17, // 지도를 띄웠을 때의 줌 크기 값이 작으면 멀리서봄
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
                                    mapOptions);
        var size_x = 40; // 마커로 사용할 이미지의 가로 크기
        var size_y = 40; // 마커로 사용할 이미지의 세로 크기
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( '주소 여기에 기입!',
                                                    new google.maps.Size(size_x, size_y),
                                                    '',
                                                    '',
                                                    new google.maps.Size(size_x, size_y));
        // Geocoding *****************************************************
        var address = '인천시 효성동 태산아파트'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                icon: image, // 마커로 사용할 이미지(변수)
                                title: '최필한집', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                position: results[0].geometry.location
                            });
                var content = "최필한집<br/><br/>Tel: 010-2908-9860"; // 말풍선 안에 들어갈 내용
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({ content: content});
                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        // Geocoding // *****************************************************
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
<title>Insert title here</title>
</head>
<body>
<br><br><br>
<div title="도서관 위치입니다." id="map-canvas" style="width: 50%; height: 340px;"></div>

</body>
</html>