<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<header><%@include file="header.jsp"%></header>
</head>
<body>
	
	<div class="first" id="first">
	<div class="header-content">
		<div class="inner">
			<h1 class="cursive"><i class="glyphicon glyphicon-home"></i> WhereHouse</h1>
			<h4>We can share our homes and feel their culture.</h4>
			<hr>
			<!-- <a href="#video-background" id="toggleVideo" data-toggle="collapse"
				class="btn btn-primary btn-xl">Toggle Video</a> -->
				<div class="form-group">
				<input type="text" class="form-control3"
							placeholder="Search here..." id="mainaddress" style="margin-left: 6%;">
				 &nbsp; <a
				 class="btn btn-primary btn-xl page-scroll" id="mainsearchbtn"><i class="glyphicon glyphicon-search"></i></a></div>
				
		</div>
	</div>
	<video autoplay="" loop="" class="fillWidth fadeIn wow collapse in"
		data-wow-delay="0.5s"
		poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Home.jpg"
		id="video-background">
		<!-- src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Traffic-blurred2.mp4" -->
		<!-- src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Home.mp4" -->
		<!-- src="https://s3-us-west-2.amazonaws.com/coverr/mp4/In-The-Clouds.mp4" -->
		<!-- src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Man-and-Sea.mp4" -->
		<!-- src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Beach-Camera.mp4" -->
		<!-- src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Beach-please.mp4" -->
		<!-- src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Window-Snow.mp4" -->
		<source
		src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Home.mp4"
		type="video/mp4">Your browser does not support the video tag.
	I suggest you upgrade your browser. </video> 
	</div>
	<div><br></div>
	<div><br></div>
	<div><br></div>
		<div><br></div>
	<section id="one" class="no-padding" style="background-color: #f7f7f7;">
	<br>
	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
				<h2 class="margin-top-0 text-primary" style="color: #1d1d1d;">Recommended destinations</h2>
				<br>
			</div>
		</div>
	</div>
	<div class="container-fluid" >
		<div class="row no-gutter">
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="http://cfile29.uf.tistory.com/image/163226395022EA1329757B">
					<img
					src="/resources/screenshot/seoul1.jpg" width="500" height="450"
					class="img-responsive" alt="Image 1">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<font size="15">서울</font>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="http://cfile211.uf.daum.net/image/2237DA4A534FD7200C0A09">
					<img
					src="/resources/screenshot/gyoungju.jpg" width="500" height="450"
					class="img-responsive" alt="Image 2">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<font size="15">경주</font>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="http://chulsa.kr/files/attach/images/66/906/313/005/IMG_9479-1.jpg">
					<img
					src="/resources/screenshot/busan1.jpg" width="500" height="450"
					class="img-responsive" alt="Image 3">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<font size="15">부산</font>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="http://chulsa.kr/files/attach/images/66/057/353/DSC_0082_10.jpg">
					<img
					src="/resources/screenshot/jeju2.jpg" width="500" height="450"
					class="img-responsive" alt="Image 4">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<font size="15">제주</font>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="http://cfile235.uf.daum.net/image/200ACA1A4B47F4632D7B79">
					<img
					src="/resources/screenshot/andong1.jpg" width="500" height="450"
					class="img-responsive" alt="Image 5">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<font size="15">안동</font>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="http://cfile7.uf.tistory.com/image/15249F3B4F6AB7A81B5EAE">
					<img
					src="/resources/screenshot/yeosu.jpg" width="500" height="450"
					class="img-responsive" alt="Image 6">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<font size="15">여수</font>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<br><br>
	</section>
	<div><br></div>
	<section class="bg-primary" id="two">
	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
				<h2 class="margin-top-0 text-primary" style="color: black;">About Us</h2>
				<br>
				<p class="text-faded" style="color: #1d1d1d; text-align: left;">
				 WhereHouse는 2016년 12월에 창립되어 서울시 금천구 가산동에
				본사를 두고 있습니다. 온라인을 통해 서로의 독특한 숙소들을 올리고, 발견하고, 예약할수 있는 커뮤니티 플랫폼 입니다.<br>
				 WhereHouse는 특별한 여행 경험을 가능하게 합니다. 하룻밤 지낼 아파트, 일주일 동안 지낼 수 있는 주택,
				한달 동안 지낼 수 있는 빌라 등 다양한 가격대의 숙소가 여러분을 기다리고 있습니다.<br>
				 WhereHouse는 고객님이 만족할수 있도록 서비스를 제공하며, 사용자 커뮤니티가 지속적으로 성장할 수 있도록 노력하겠습니다.</p>
			</div>
		</div>
	</div>
	</section>
	
	<footer id="footer">
	<%@include file="footer.jsp"%>
	</footer>
	
</body>
</html>