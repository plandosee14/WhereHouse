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
	<div style="background: white;"> </div>
	<section class="bg-primary" id="one">
	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
				<h2 class="margin-top-0 text-primary">Built On The Bootstrap
					Grid</h2>
				<br>
				<p class="text-faded">Bootstrap's responsive grid comes in 4
					sizes or "breakpoints": tiny (xs), small(sm), medium(md) and
					large(lg). These 4 grid sizes enable you create responsive layouts
					that behave accordingly on different devices.</p>
				<a href="#two" class="btn btn-default btn-xl page-scroll">Learn
					More</a>
			</div>
		</div>
	</div>
	</section>
	
	<section id="two" class="no-padding">
	<div class="container-fluid">
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
	</section>
	
	<footer id="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-6 col-sm-3 column">
				<h4>Information</h4>
				<ul class="list-unstyled">
					<li><a href="">Products</a></li>
					<li><a href="">Services</a></li>
					<li><a href="">Benefits</a></li>
					<li><a href="">Developers</a></li>
				</ul>
			</div>
			<div class="col-xs-6 col-sm-3 column">
				<h4>111111111</h4>
				<ul class="list-unstyled">
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Delivery Information</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms &amp; Conditions</a></li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-3 column">
				<h4>Stay Posted</h4>
				<form>
					<div class="form-group">
						<input type="text" class="form-control"
							title="No spam, we promise!" placeholder="Tell us your email">
					</div>
					<div class="form-group">
						<button class="btn btn-primary" data-toggle="modal"
							data-target="#alertModal" type="button">Subscribe for
							updates</button>
					</div>
				</form>
			</div>
			<div class="col-xs-12 col-sm-3 text-right">
				<h4>Follow</h4>
				<ul class="list-inline">
					<li><a rel="nofollow" href="" title="Twitter"><i
							class="icon-lg ion-social-twitter-outline"></i></a>&nbsp;</li>
					<li><a rel="nofollow" href="" title="Facebook"><i
							class="icon-lg ion-social-facebook-outline"></i></a>&nbsp;</li>
					<li><a rel="nofollow" href="" title="Dribble"><i
							class="icon-lg ion-social-dribbble-outline"></i></a></li>
				</ul>
			</div>
		</div>
		<br /> <span class="pull-right text-muted small"><a
			href="http://www.bootstrapzero.com">Landing Zero by BootstrapZero</a>
			©2015 Company</span>
	</div>
	</footer>
	
</body>
</html>