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
							placeholder="Search here..." id="searchtext" style="margin-left: 6%;">
				 &nbsp; <a
				 class="btn btn-primary btn-xl page-scroll" id="searchbtn"><i class="glyphicon glyphicon-search"></i></a></div>
				
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
	<div style="background: black;"><br></div>
	<div style="background: #dcdcf0;"><br></div>
		
	<section id="one" class="no-padding" style="background-color: #dcdcf0;">
	<br>
	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
				<h2 class="margin-top-0 text-primary" style="color: #1d1d1d;">Recommended destinatios</h2>
				<br>
			</div>
		</div>
	</div>
	<div class="container-fluid" >
		<div class="row no-gutter">
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1430916273432-273c2db881a0%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3Df047e8284d2fdc1df0fd57a5d294614d">
					<img
					src="/resources/screenshot/seoul.jpg" width="500" height="450"
					class="img-responsive" alt="Image 1">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<i class="icon-lg ion-ios-search"></i>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="//splashbase.s3.amazonaws.com/getrefe/regular/tumblr_nqune4OGHl1slhhf0o1_1280.jpg">
					<img
					src="/resources/screenshot/gyoungju.jpg" width="500" height="450"
					class="img-responsive" alt="Image 2">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<i class="icon-lg ion-ios-search"></i>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1433959352364-9314c5b6eb0b%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3D3b9bc6caa190332e91472b6828a120a4">
					<img
					src="/resources/screenshot/busan.jpg" width="500" height="450"
					class="img-responsive" alt="Image 3">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<i class="icon-lg ion-ios-search"></i>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-moto-drawing-illusion-nabeel-1440x960.jpg">
					<img
					src="/resources/screenshot/incheon.jpg" width="500" height="450"
					class="img-responsive" alt="Image 4">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<i class="icon-lg ion-ios-search"></i>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-new-york-crosswalk-nabeel-1440x960.jpg">
					<img
					src="/resources/screenshot/jeju.jpg" width="500" height="450"
					class="img-responsive" alt="Image 5">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<i class="icon-lg ion-ios-search"></i>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-clothes-exotic-travel-nabeel-1440x960.jpg">
					<img
					src="/resources/screenshot/yeosu.jpg" width="500" height="450"
					class="img-responsive" alt="Image 6">
					<div class="gallery-box-caption">
						<div class="gallery-box-content">
							<div>
								<i class="icon-lg ion-ios-search"></i>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<br><br>
	</section>
	<div style="background: black;"><br></div>	
	<section class="bg-primary" id="two">
	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
				<h2 class="margin-top-0 text-primary" style="color: black;">Introduce WhereHouse</h2>
				<br>
				<p class="text-faded" style="color: #1d1d1d;">소개쓸곳</p>
			</div>
		</div>
	</div>
	</section>
	
	<footer id="footer">
	<div class="container-fluid">
	<br><br>
		<br /> <span class="pull-right text-muted small"><a>WhereHouse</a>
			©2016 Company</span>
	</div>
	</footer>
	
</body>
</html>