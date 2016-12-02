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



	<script>
	

	
	var idx;
	var marker = new Array();
	var address;
	var infowindow;
		function initMap() {
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
					$('#searchlist').html('');
					if (marker != null) {
						for (var i = 0; i < marker.length; i++) {
						    marker[i].setMap(null);
						  }
						marker = [];
						infowindow = [];
						map = new google.maps.Map(document.getElementById('map'), {
							zoom : 11,
							mapTypeId : google.maps.MapTypeId.ROADMAP,
							center : {
								lat : 37.5400615,
								lng : 126.73338309999997
							}
						});
					}
						geocodeAddress(geocoder, map);
				}
			});
			
		}

		function geocodeAddress(geocoder, resultsMap) {
			address = $('#address').val();
			
			$.ajax({
 	      		url:"/member/searchHouse",
 	            type: "post",
 	            async: "true",
 	            data:{
 	            	h_address : address
 	            },
 	            success:function(result){
 	            	if (result == null||result == "") {
 	            		$('#alerttitle').html('검색결과');
		                  $('#alertcontent').html('검색결과가 없습니다.');
		                  $('#alertModal').modal("show");
 	            		}else {
 	            			idx=0;
 	            			pilhan(result.length, result, geocoder, resultsMap);
 	            			setlocation(geocoder, resultsMap);
					}
 	            }
 	      	});
		}
		
		function pilhan(len, result, geocoder, resultsMap) {
			geocoder
				.geocode(
						{
							'address' : result[idx].h_address
						},
						function(results, status) {
							if (status === google.maps.GeocoderStatus.OK) {
								/* resultsMap.setCenter(results[0].geometry.location); */
								
								var image;
								if (result[idx].h_type=="빌라") {
									image = '/resources/img/house/billa.png';
								}
								else if (result[idx].h_type=="주택") {
									image = '/resources/img/house/jutaek.png';
								}else {
									image = '/resources/img/house/apart.png';
								}
								marker[idx] = new google.maps.Marker({
									map : resultsMap,
									position : results[0].geometry.location,
									title : result[idx].h_no.toString()+"번 House",
									animation: google.maps.Animation.DROP,
									icon: image
								});
								 infowindow = new google.maps.InfoWindow({ content: result[idx].h_info+"<br><a href='/detail?h_no="+result[idx].h_no.toString()+"'><img id = 'picture"+idx+"' src='/resources/img/house/"+result[idx].h_thumnail+"' style='width: 210px; height: 140px; border-radius: 10px;' '></a>"+"<br><br>가격: "+result[idx].h_fare.toString()+"원<br> 주소: "+result[idx].h_address+"<br>투숙 가능 인원: "+result[idx].h_peoplecnt});
								 google.maps.event.addListener(marker[idx], "click", function() {
									 infowindow.open(map,this);
								 });
								 google.maps.event.addListener(marker[idx], "mouseover", function() {
									 this.setAnimation(google.maps.Animation.BOUNCE);
									 $('#list'+this.title.substring(0, this.title.charAt('번'))).css('background-color','#efefef');
									 $('#list'+this.title.substring(0, this.title.charAt('번'))).css('opacity','0.8');
									 $('#list'+this.title.substring(0, this.title.charAt('번'))).attr('tabindex', -1);
									 $('#list'+this.title.substring(0, this.title.charAt('번'))).focus();									
								 });
								 google.maps.event.addListener(marker[idx], "mouseout", function() {
									 this.setAnimation(null);
									 $('#list'+this.title.substring(0, this.title.charAt('번'))).css('background-color','#f7f7f7');
									 $('#list'+this.title.substring(0, this.title.charAt('번'))).css('opacity','1');
									 $('#list'+this.title.substring(0, this.title.charAt('번'))).focusout();
								 });
								 $('#searchlist').append("<div style='border-radius: 10px;' id=list"+result[idx].h_no+" class= 'list'><a href='/detail?h_no="+result[idx].h_no.toString()+"'> <img src='/resources/img/house/"+result[idx].h_thumnail+"' style='width: 300px; height: 200px; border-radius: 10px;'></a><div style='display:inline-block; margin-left : 1%;'> 집 번호: "+result[idx].h_no.toString()+"번 <br> 주소: "+result[idx].h_address+"<br> 가격: "+result[idx].h_fare+"<br> 투숙가능인원: "+result[idx].h_peoplecnt.toString()+"<br> 집형태: "+result[idx].h_type+"</div><div style='border-bottom: 1px dashed gray; height:1px; margin:1%;'></div></div>");
								 /* google.maps.event.addListener(marker, "mouseout", function() {
									 infowindow.close(map,this);
									 this.setAnimation(null);
								 }); */
								 
								/* alert(marker.position); */
								
								if (++idx < len) {
									pilhan(len, result, geocoder, resultsMap);
								}else {
									return;
								}
							} else {
								alert('Geocode was not successful for the following reason: '
										+ status);
							}
						});
		}
		
		function setlocation(geocoder, resultsMap) {
			geocoder
			.geocode(
					{
						'address' : address
					},
					function(results, status) {
						if (status === google.maps.GeocoderStatus.OK) {
							resultsMap.setCenter(results[0].geometry.location);
						} 
					});
		}
		
		
		
		
	</script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDe7x-HKwY406_yjbfUjdESOr6EU18801g&signed_in=true&callback=initMap"
		async defer></script>

			<div style="width: 48%; position: absolute; margin: 1%;  height: 70%;"><br>
			<div style="margin-left: 20%">
			<input id="address" type="textbox" value="" class="form-control2" style="width: 60%;" placeholder="Search here...">
			<button id="serachhouse" class="form-control2" style="width: 10%;"><i class="glyphicon glyphicon-search"></i></button>
			</div>
			<br>
			<div id="searchlist" style="overflow:auto; overflow-x:hidden; height: 96%; margin: 1%;">
			</div>
			</div>
			<div id="map"
			style="width: 50%; height: 80%; position: fixed; left: 50%;">
			</div>
</body>
</html>