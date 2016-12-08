<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<header><%@include file="header.jsp"%></header>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3xicslxG92qCXj6ltH4xrVW96C5OhSIE&signed_in=true&callback=initMap"
	async defer></script>

</head>
<body>
	<br>
	<br>
	<br>



	<script>
		var idx;
		var marker = new Array();
		var infowindow = new Array();
		var nearmarker = new Array();
		var nearinfowindow = new Array();
		var address;
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 18,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				center : {
					lat : 37.53019,
					lng : 126.70110
				}
			});//div map의 속성? 나타내나?
			var geocoder = new google.maps.Geocoder();

			$('#selflocation')
					.click(
							function() {
								$('#weatherlist').html('');
								if (navigator.geolocation) {
									navigator.geolocation
											.getCurrentPosition(function(
													position) {

												$('#searchlist').html('');
												var markergps;
												nearmarker = [];
												nearinfowindow = [];

												map = new google.maps.Map(
														document
																.getElementById('map'),
														{
															zoom : 13,
															mapTypeId : google.maps.MapTypeId.ROADMAP,
															center : {
																lat : position.coords.latitude,
																lng : position.coords.longitude
															}
														});
												var mylocationimage = '/resources/img/house/mylocation.png';
												markergps = new google.maps.Marker(
														{
															map : map,
															mapTypeId : google.maps.MapTypeId.ROADMAP,
															position : {
																lat : position.coords.latitude,
																lng : position.coords.longitude
															},
															title : "현재위치",
															icon : mylocationimage,
															animation : google.maps.Animation.DROP,
														});

												var lat = position.coords.latitude;
												var lng = position.coords.longitude;
												var cnt = 3;
												var APPID = "3ef03001c2d4950720b7db7860ee228a";

												var weather = 'http://api.openweathermap.org/data/2.5/forecast?lat='
														+ lat
														+ '&lon='
														+ lng
														+ '&cnt='
														+ cnt
														+ '&APPID='
														+ APPID
														+ '&units=metric';
												$
														.ajax({
															dataType : "jsonp",
															url : weather,
															success : function(
																	resultweather) {
																if (resultweather != null) {
																	var day = new Date();
																	var day2 = new Date(
																			day
																					.valueOf()
																					+ (24 * 60 * 60 * 1000));
																	var day3 = new Date(
																			day2
																					.valueOf()
																					+ (24 * 60 * 60 * 1000));
																	$(
																			'#weatherlist')
																			.append(
																					'<br><div style="width:100%;">'
																							+ '<div style="float:left;width:33.3%;">'
																							+ day
																									.getDate()
																							+ '일</div><div style="float:left;width:33.3%;">'
																							+ day2
																									.getDate()
																							+ '일</div><div style="float:left;width:33.3%;">'
																							+ day3
																									.getDate()
																							+ '일</div></div>');
																	for (var i = 0; i < cnt; i++) {
																		var weatherimg = '/resources/img/weather/'
																				+ resultweather.list[i].weather[0].icon
																						.substring(
																								0,
																								2)
																				+ '.png';
																		$(
																				'#weatherlist')
																				.append(
																						'<div style="float:left;width:33.3%;">'
																								+ '<img src ="'+weatherimg+'">'
																								+ resultweather.list[i].main.temp_min
																								+ '~'
																								+ resultweather.list[i].main.temp_max
																								+ '°C </div>');
																	}
																} else {
																	$(
																			'#alerttitle')
																			.html(
																					'날씨 오류');
																	$(
																			'#alertcontent')
																			.html(
																					'날씨 정보를 가져오는 도중 오류가 발생하였습니다.');
																	$(
																			'#alertModal')
																			.modal(
																					"show");
																}
															}
														});

												circle = new google.maps.Circle(
														{
															map : map,
															strokeColor : "#222",
															strokeOpacity : 0.5,
															strokeWeight : 1,
															fillColor : "#222",
															fillOpacity : 0.15,
															map : map,
															center : {
																lat : position.coords.latitude,
																lng : position.coords.longitude
															},
															radius : 3000

														});

												$
														.ajax({
															url : "/member/searchnearHouse",
															type : "post",
															async : "true",
															data : {
																lat : position.coords.latitude
																		.toString(),
																lng : position.coords.longitude
																		.toString()
															},
															success : function(
																	resultnear) {
																if (resultnear == null
																		|| resultnear == "") {
																	$(
																			'#alerttitle')
																			.html(
																					'검색결과');
																	$(
																			'#alertcontent')
																			.html(
																					'3KM내에 등록된 집이 없습니다.');
																	$(
																			'#alertModal')
																			.modal(
																					"show");
																} else {
																	for (var i = 0; i < resultnear.length; i++) {
																		var position = resultnear[i].h_pi_x
																				+ ", "
																				+ resultnear[i].h_pi_y;
																		var nearimage;
																		if (resultnear[i].h_type == "빌라") {
																			nearimage = '/resources/img/house/billa.png';
																		} else if (resultnear[i].h_type == "주택") {
																			nearimage = '/resources/img/house/jutaek.png';
																		} else {
																			nearimage = '/resources/img/house/apart.png';
																		}

																		nearmarker[i] = new google.maps.Marker(
																				{
																					map : map,
																					position : {
																						lat : parseFloat(resultnear[i].h_pi_x),
																						lng : parseFloat(resultnear[i].h_pi_y)
																					},
																					title : resultnear[i].h_no
																							+ "번 House",
																					icon : nearimage,
																					animation : google.maps.Animation.DROP
																				});

																		nearinfowindow[i] = new google.maps.InfoWindow(
																				{
																					title : resultnear[i].h_no
																							.toString(),
																					content : "거리 : "
																							+ resultnear[i].distance
																							+ "m<br>"
																							+ resultnear[i].h_title
																							+ "<br><a href='/detail?h_no="
																							+ resultnear[i].h_no
																									.toString()
																							+ "'><img id = 'picture"+idx+"' src='/resources/img/house/"+resultnear[i].h_thumnail+"' style='width: 210px; height: 140px; border-radius: 10px;' '></a>"
																							+ "<br><br>가격: "
																							+ resultnear[i].h_fare
																									.toString()
																							+ "원<br> 주소: "
																							+ resultnear[i].h_address
																							+ "<br>투숙 가능 인원: "
																							+ resultnear[i].h_peoplecnt
																							+ "<br> 소개: "
																							+ resultnear[i].h_info
																				});
																		google.maps.event
																				.addListener(
																						nearmarker[i],
																						"click",
																						function() {
																							var title = this.title;
																							var no = title
																									.substring(
																											0,
																											title
																													.indexOf('번'));
																							for (var j = 0; j < nearinfowindow.length; j++) {
																								if (nearinfowindow[j] != null
																										&& no == nearinfowindow[j].title) {
																									nearinfowindow[j]
																											.open(
																													map,
																													this);
																								} else if (nearinfowindow[j] != null) {
																									nearinfowindow[j]
																											.close();
																								}
																							}
																						});
																		google.maps.event
																				.addListener(
																						nearmarker[i],
																						"mouseover",
																						function() {
																							this
																									.setAnimation(google.maps.Animation.BOUNCE);
																							var title = this.title;
																							var no = title
																									.substring(
																											0,
																											title
																													.indexOf('번'));
																							/* alert('title='+ title +", charAt()="+ title.indexOf('번')+ ", no="+no );  */
																							/*  var listno = $('#list'+no);	 */
																							$(
																									'#list'
																											+ no)
																									.css(
																											{
																												'background-color' : '#efefef',
																												'opacity' : '0.8'
																											})
																									.attr(
																											'tabindex',
																											-1)
																									.focus();
																						});
																		google.maps.event
																				.addListener(
																						nearmarker[i],
																						"mouseout",
																						function() {
																							this
																									.setAnimation(null);
																							var title = this.title;
																							var no = title
																									.substring(
																											0,
																											title
																													.indexOf('번'));
																							$(
																									'#list'
																											+ no)
																									.css(
																											{
																												'background-color' : '#f7f7f7',
																												'opacity' : '1'
																											})
																									.focusout();
																							/* $('#list'+this.title.substring(0, this.title.charAt('번'))).css('background-color','#f7f7f7');
																							$('#list'+this.title.substring(0, this.title.charAt('번'))).css('opacity','1');
																							$('#list'+this.title.substring(0, this.title.charAt('번'))).focusout(); */
																						});
																		$(
																				'#searchlist')
																				.append(
																						"<div onmouseover='nearroll("
																								+ resultnear[i].h_no
																								+ ")' onmouseout='nearrollout("
																								+ resultnear[i].h_no
																								+ ")' style='font-size: small;float:left;width:100%;margin-bottom:10px;padding-bottom:10px;border-bottom: 1px dashed gray;' id=list"
																								+ resultnear[i].h_no
																								+ " class= 'list'><div style='display:inline-block;float:left;'><a href='/detail?h_no="
																								+ resultnear[i].h_no
																										.toString()
																								+ "'> <img src='/resources/img/house/"+resultnear[i].h_thumnail+"' style='width: 210px; height: 140px; border-radius: 10px;'></a></div><div style='display:inline-block; margin-left : 1%;'>  <br>거리: "
																								+ resultnear[i].distance
																								+ "m<br>집 번호: "
																								+ resultnear[i].h_no
																										.toString()
																								+ "번 <br> 주소: "
																								+ resultnear[i].h_address
																								+ "<br> 가격: "
																								+ resultnear[i].h_fare
																								+ "원 <br> 투숙가능인원: "
																								+ resultnear[i].h_peoplecnt
																										.toString()
																								+ "<br> 집형태: "
																								+ resultnear[i].h_type
																								+ "</div></div>");

																	}
																}
															}
														});

											});
								} else {
									$('#alerttitle').html('GPS오류');
									$('#alertcontent').html(
											'GPS정보를 불러오는데 실패하였습니다.');
									$('#alertModal').modal("show");
								}
							});

			$('#serachhouse')
					.click(
							function search() {
								if ($('#address').val() == null
										|| $('#address').val().length < 2
										|| $('#address').val().replace(" ", "").length != $(
												'#address').val().length) {
									$('#alerttitle').html('검색어');
									$('#alertcontent').html(
											'검색어는 두글자 이상만 가능합니다.');
									$('#alertModal').modal("show");
								} else {
									$('#searchlist').html('');
									if (marker != null) {
										for (var i = 0; i < marker.length; i++) {
											marker[i].setMap(null);
										}
										marker = [];
										infowindow = [];
										$('#weatherlist').html('');
										map = new google.maps.Map(
												document.getElementById('map'),
												{
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
				url : "/member/searchHouse",
				type : "post",
				async : "true",
				data : {
					h_address : address
				},
				success : function(result) {
					if (result == null || result == "") {
						$('#alerttitle').html('검색결과');
						$('#alertcontent').html('검색결과가 없습니다.');
						$('#alertModal').modal("show");
					} else {
						idx = 0;
						setlocation(geocoder, resultsMap);
						pilhan(result.length, result, geocoder, resultsMap);
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
									if (results != null) {

										/* resultsMap.setCenter(results[0].geometry.location); */
										var image;
										if (result[idx].h_type == "빌라") {
											image = '/resources/img/house/billa.png';
										} else if (result[idx].h_type == "주택") {
											image = '/resources/img/house/jutaek.png';
										} else {
											image = '/resources/img/house/apart.png';
										}
										marker[idx] = new google.maps.Marker(
												{
													map : resultsMap,
													position : results[0].geometry.location,
													title : result[idx].h_no
															.toString()
															+ "번 House",
													animation : google.maps.Animation.DROP,
													icon : image
												});
										infowindow[idx] = new google.maps.InfoWindow(
												{
													title : result[idx].h_no
															.toString(),
													content : result[idx].h_title
															+ "<br><a href='/detail?h_no="
															+ result[idx].h_no
																	.toString()
															+ "'><img id = 'picture"+idx+"' src='/resources/img/house/"+result[idx].h_thumnail+"' style='width: 210px; height: 140px; border-radius: 10px;' '></a>"
															+ "<br><br>가격: "
															+ result[idx].h_fare
																	.toString()
															+ "원<br> 주소: "
															+ result[idx].h_address
															+ "<br>투숙 가능 인원: "
															+ result[idx].h_peoplecnt
															+ "<br> 소개: "
															+ result[idx].h_info
												});
										google.maps.event
												.addListener(
														marker[idx],
														"click",
														function() {
															var title = this.title;
															var no = title
																	.substring(
																			0,
																			title
																					.indexOf('번'));
															for (var i = 0; i < infowindow.length; i++) {
																if (infowindow[i] != null
																		&& no == infowindow[i].title) {
																	infowindow[i]
																			.open(
																					map,
																					this);
																} else if (infowindow[i] != null) {
																	infowindow[i]
																			.close();
																}
															}
														});
										google.maps.event
												.addListener(
														marker[idx],
														"mouseover",
														function() {
															this
																	.setAnimation(google.maps.Animation.BOUNCE);
															var title = this.title;
															var no = title
																	.substring(
																			0,
																			title
																					.indexOf('번'));
															/* alert('title='+ title +", charAt()="+ title.indexOf('번')+ ", no="+no );  */
															/*  var listno = $('#list'+no);	 */
															$('#list' + no)
																	.css(
																			{
																				'background-color' : '#efefef',
																				'opacity' : '0.8'
																			})
																	.attr(
																			'tabindex',
																			-1)
																	.focus();
														});
										google.maps.event
												.addListener(
														marker[idx],
														"mouseout",
														function() {
															this
																	.setAnimation(null);
															var title = this.title;
															var no = title
																	.substring(
																			0,
																			title
																					.indexOf('번'));
															$('#list' + no)
																	.css(
																			{
																				'background-color' : '#f7f7f7',
																				'opacity' : '1'
																			})
																	.focusout();
															/* $('#list'+this.title.substring(0, this.title.charAt('번'))).css('background-color','#f7f7f7');
															$('#list'+this.title.substring(0, this.title.charAt('번'))).css('opacity','1');
															$('#list'+this.title.substring(0, this.title.charAt('번'))).focusout(); */
														});
										$('#searchlist')
												.append(
														"<div onmouseover='roll("
																+ result[idx].h_no
																+ ")' onmouseout='rollout("
																+ result[idx].h_no
																+ ")' style='font-size: small;float:left;width:100%;margin-bottom:10px;padding-bottom:10px;border-bottom: 1px dashed gray;' id=list"
																+ result[idx].h_no
																+ " class= 'list'><div style='display:inline-block;float:left;'><a href='/detail?h_no="
																+ result[idx].h_no
																		.toString()
																+ "'> <img src='/resources/img/house/"+result[idx].h_thumnail+"' style='width: 210px; height: 140px; border-radius: 10px;'></a></div><div style='display:inline-block; margin-left : 1%;float:left;'><br>집 번호: "
																+ result[idx].h_no
																		.toString()
																+ "번 <br> 주소: "
																+ result[idx].h_address
																+ "<br> 가격: "
																+ result[idx].h_fare
																+ "원 <br> 투숙가능인원: "
																+ result[idx].h_peoplecnt
																		.toString()
																+ "<br> 집형태: "
																+ result[idx].h_type
																+ "<br><br><br></div></div>");
										/* google.maps.event.addListener(marker, "mouseout", function() {
										 infowindow.close(map,this);
										 this.setAnimation(null);
										}); */

										/* alert(marker.position); */
									}

									if (++idx < len) {
										pilhan(len, result, geocoder,
												resultsMap);
									} else {
										return;
									}
								} else {
									/*$('#alerttitle').html('검색오류');
									  $('#alertcontent').html('요청이 너무 많습니다. <br>다시 시도해 주세요. <br>'+status);
									  $('#alertModal').modal("show"); */
									if (++idx < len) {
										pilhan(len, result, geocoder,
												resultsMap);
									}
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
									resultsMap
											.setCenter(results[0].geometry.location);
									var lat = results[0].geometry.location
											.lat();
									var lng = results[0].geometry.location
											.lng();
									var cnt = 3;
									var APPID = "3ef03001c2d4950720b7db7860ee228a";

									var weather = 'http://api.openweathermap.org/data/2.5/forecast?lat='
											+ lat
											+ '&lon='
											+ lng
											+ '&cnt='
											+ cnt
											+ '&APPID='
											+ APPID
											+ '&units=metric';
									$
											.ajax({
												dataType : "jsonp",
												url : weather,
												success : function(
														resultweather) {
													if (resultweather != null) {
														var day = new Date();
														var day2 = new Date(
																day.valueOf()
																		+ (24 * 60 * 60 * 1000));
														var day3 = new Date(
																day2.valueOf()
																		+ (24 * 60 * 60 * 1000));
														$('#weatherlist')
																.append(
																		'<br><div style="width:100%;">'
																				+ '<div style="float:left;width:33.3%;">'
																				+ day
																						.getDate()
																				+ '일</div><div style="float:left;width:33.3%;">'
																				+ day2
																						.getDate()
																				+ '일</div><div style="float:left;width:33.3%;">'
																				+ day3
																						.getDate()
																				+ '일</div></div>');
														for (var i = 0; i < cnt; i++) {
															var weatherimg = '/resources/img/weather/'
																	+ resultweather.list[i].weather[0].icon
																			.substring(
																					0,
																					2)
																	+ '.png';
															$('#weatherlist')
																	.append(
																			'<div style="float:left;width:33.3%;">'
																					+ '<img src ="'+weatherimg+'">'
																					+ resultweather.list[i].main.temp_min
																					+ '~'
																					+ resultweather.list[i].main.temp_max
																					+ '°C </div>');
														}
													} else {
														$('#alerttitle').html(
																'날씨 오류');
														$('#alertcontent')
																.html(
																		'날씨 정보를 가져오는 도중 오류가 발생하였습니다.');
														$('#alertModal').modal(
																"show");
													}
												}
											});
								}
							});
		}

		var roll = function(no) {
			for (var i = 0; i < marker.length; i++) {
				if (marker[i] != null
						&& marker[i].title.substring(0, marker[i].title
								.indexOf('번')) == no) {
					if (marker[i].getAnimation() == null) {
						marker[i].setAnimation(google.maps.Animation.BOUNCE);
					}
				}
			}
		};

		var rollout = function(no) {
			for (var i = 0; i < marker.length; i++) {
				if (marker[i] != null
						&& marker[i].title.substring(0, marker[i].title
								.indexOf('번')) == no) {
					if (marker[i].getAnimation() != null) {
						marker[i].setAnimation(null);
					}
				}
			}
		}

		var nearroll = function(no) {
			for (var i = 0; i < nearmarker.length; i++) {
				if (nearmarker[i] != null
						&& nearmarker[i].title.substring(0, nearmarker[i].title
								.indexOf('번')) == no) {
					if (nearmarker[i].getAnimation() == null) {
						nearmarker[i]
								.setAnimation(google.maps.Animation.BOUNCE);
					}
				}
			}
		};

		var nearrollout = function(no) {
			for (var i = 0; i < nearmarker.length; i++) {
				if (nearmarker[i] != null
						&& nearmarker[i].title.substring(0, nearmarker[i].title
								.indexOf('번')) == no) {
					if (nearmarker[i].getAnimation() != null) {
						nearmarker[i].setAnimation(null);
					}
				}
			}
		}

		$(document).ready(function() {
			$('#address').attr('tabindex', -1).focus();
			$('#address').keydown(function(event) {
				if (event.which === 13) {
					$('#serachhouse').click();
				}
			});

		});//ready
	</script>

	<div style="width: 48%; position: absolute; margin: 1%; height: 70%;">
		<div style="margin-left: 20%">
			<button id="selflocation" class="form-control2" style="width: 7%;">
				<i class="glyphicon glyphicon-screenshot"></i>
			</button>
			<input id="address" type="textbox" value="" class="form-control2"
				style="width: 60%;" placeholder="Search here...">
			<button id="serachhouse" class="form-control2" style="width: 10%;">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
		<center>
			<div id="weatherlist" style="text-align: center; width: 80%;"></div>
		</center>
		<br>
		<hr>
		<br>
		<div id="searchlist"
			style="overflow: auto; overflow-x: hidden; height: 96%; margin: 1%;">
		</div>
	</div>
	<div id="map"
		style="width: 50%; height: 80%; position: fixed; left: 50%;"></div>
</body>
</html>