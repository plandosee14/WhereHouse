<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<header><%@include file="header.jsp"%></header>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<br>
	<br>
	<br>

		<div style="width: 50%; position: absolute;">
			<input id="address" type="textbox" value=""> <input
				id="serachhouse" type="button" value="search">
		</div>
		<div id="map"
			style="width: 50%; height: 100%; position: fixed; left: 50%;"></div>

	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 12,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				center : {
					lat : 37.5640,
					lng : 126.9751
				}
			});//div map의 속성? 나타내나?
			var geocoder = new google.maps.Geocoder();
			
			$('#serachhouse').click(function() {
				geocodeAddress(geocoder, map);
			});
			
		}

		function geocodeAddress(geocoder, resultsMap) {
			var address = $('#address').val();
			$.ajax({
 	      		url:"/member/searchHouse",
 	            type: "post",
 	            data:{
 	            	h_address : address
 	            },
 	            success:function(result){
 	            	if (result != null) {
 	            		for (var i = 0; i < result.length; i++) {
 	           			geocoder
 	           					.geocode(
 	           							{
 	           								'address' : result[i].h_address
 	           							},
 	           							function(results, status) {
 	           								if (status === google.maps.GeocoderStatus.OK) {
 	           									resultsMap.setCenter(results[0].geometry.location);
 	           									var marker = new google.maps.Marker({
 	           										map : resultsMap,
 	           										position : results[0].geometry.location
 	           									});
 	           								} else {
 	           									alert('Geocode was not successful for the following reason: '
 	           											+ status);
 	           								}
 	           							});
 	           			}
					}else {
						  $('#alerttitle').html('오류류류류');
		                  $('#alertcontent').html('집없어');
		                  $('#alertModal').modal("show");
					}
 	            }
 	      	});
			
			
		}
	</script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDe7x-HKwY406_yjbfUjdESOr6EU18801g&signed_in=true&callback=initMap"
		async defer></script>

</body>
</html>