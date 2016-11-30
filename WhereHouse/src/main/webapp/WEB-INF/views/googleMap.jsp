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

		<div style="width: 60%; position: absolute; left: 17%;"><br>
			<input id="address" type="textbox" value="" class="form-control2" style="width: 30%" placeholder="Search here...">
			<button id="serachhouse" class="form-control2" style="width: 10%;"><i class="glyphicon glyphicon-search"></i></button>
		</div>
		<div id="map"
			style="width: 40%; height: 92.5%; position: fixed; left: 60%;"></div>

	<script>
		function initMap() {
			$('#address').val('');
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 11,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				center : {
					lat : 37.5400615,
					lng : 126.73338309999997
				}
			});//div map의 속성? 나타내나?
			var geocoder = new google.maps.Geocoder();
			
			$('#serachhouse').click(function() {
				if ($('#address').val()==null || $('#address').val().length < 2 || $('#address').val().replace(" ", "").length != $('#address').val().length) {
					  $('#alerttitle').html('검색어');
	                  $('#alertcontent').html('검색어는 두글자 이상만 가능합니다.');
	                  $('#alertModal').modal("show");
				}else {
				geocodeAddress(geocoder, map);
				}
			});
			
		}

		function geocodeAddress(geocoder, resultsMap) {
			var address = $('#address').val();
			var marker;
			
			$.ajax({
 	      		url:"/member/searchHouse",
 	            type: "post",
 	            data:{
 	            	h_address : address
 	            },
 	            success:function(result){
 	            	if (result == null||result == "") {
 	            		$('#alerttitle').html('검색결과');
		                  $('#alertcontent').html('검색결과가 없습니다.');
		                  $('#alertModal').modal("show");
 	            		}else {
 	            			for (var i = 0; i < result.length; i++) {
 	    	           									alert("첫번째"+i);
 	    	           			geocoder
 	    	           					.geocode(
 	    	           							{
 	    	           								'address' : result[i].h_address
 	    	           							},
 	    	           							function(results, status) {
 	    	           								if (status === google.maps.GeocoderStatus.OK) {
 	    	           									resultsMap.setCenter(results[0].geometry.location);
 	    	           									marker = new google.maps.Marker({
 	    	           										map : resultsMap,
 	    	           										position : results[0].geometry.location,
 	    	           									});
 	    	           								alert("두번째"+i);
 	    	           									/* alert(marker.position); */
 	    	           								} else {
 	    	           									alert('Geocode was not successful for the following reason: '
 	    	           											+ status);
 	    	           								}
 	    	           							});
 	    	           				}
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