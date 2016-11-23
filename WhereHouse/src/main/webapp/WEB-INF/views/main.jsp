<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"
	charset="UTF-8"></script>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WH</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" href="resources/css/styles.css" />
<script type="text/javascript">
       $(document).ready(function(){
    	      $("#registbtn").click(function(){
    	         $.ajax({
    	            
    	            url:"/member/register",
    	            type: "post",
    	            data:{
    	            	m_id : $('#registidp').text(),
    	            	m_pass : $('#registpass').val(),
    	            	m_name : $('#registname').val(),
    	            	m_phone : $('#registphone').val()
    	            },
    	            success:function(result){
    	               if(result=='success'){
    	            	  var congtitle = $('#registname').val()+'님 <br>가입을 환영합니다!'
    	                  $('#alerttitle').html(congtitle);
    	                  $('#alertcontent').html('이곳에서 서로의 집을 공유하고<br>그곳의 문화도 느껴보세요.');
    	                  $('#registid').val('');
    	               	  $('#registpass').val('');
    	               	  $('#registpasscheck').val('');
    	                  $('#registname').val('');
    	                  $('#registphone').val('');
    	                  $('#alertModal').modal("show");
    	                  $('#RegisterModal').modal("hide");
    	                  $('#registid').fadeIn('100');
    	                  $('#registidp').fadeOut('100');
    	               }//회원가입시 회원가입창 초기화
    	               else{
    	            	   $('#alerttitle').html('회원가입 실패');
     	                   $('#alertcontent').html('회원가입에 실패하였습니다.<br>잠시후 다시 시도해주세요.');
     	                   $('#alertModal').modal("show");
    	               }//실패
    	           
    	            }
    	         });
    	      });//signup버튼
    	      
    	      $('#loginmodalclose').click(function() {
    	    	  $('#loginid').val('');
    	    	  $('#loginpass').val('');
    	      });//로그인모달창 닫기 버튼
    	      
    	      $('#RegisterModalbutton').click(function() {
    	    	  $('#registid').val('');
               	  $('#registpass').val('');
               	  $('#registpasscheck').val('');
                  $('#registname').val('');
                  $('#registphone').val('');

    	      });//close시 회원가입창 초기화
    	      
    	      $('#registid').click(function() {
    	    	$('#certificationtext').fadeOut('100');//인증번호 입력텍스트 숨기기
	            $('#checkCertification').fadeOut('100');//인증번호 확인 버튼  숨기기
    	      	$('#CheckIDModal').modal("show");
    	      });//이메일인증창 SHOW
    	      
    	      $('#checkid').click(function() {
    	    	  $('#checkid').fadeOut('100');
    	      	$.ajax({
    	      		url:"/member/checkid",
    	            type: "post",
    	            data:{
    	            	m_id : $('#checkidtext').val()
    	            },
    	            success:function(result){
    	            	if (result == "0") {
    	            		$('#checkid').fadeIn('100');
    	            		$('#alerttitle').html('Email 발송 실패');
      	                    $('#alertcontent').html('해당 아이디(E-mail)로 회원가입한<br>회원이 이미 존재합니다.');
    	            		$('#alertModal').modal("show");
    	            		$('#checkid').fadeIn('100');
						}else {
    	            		$('#hiddencertification').val(result);
							$('#checkidtext').hide('100');
							$('#successcheckid').html($('#checkidtext').val());
							$('#certificationtext').fadeIn('100');//인증번호 입력텍스트 보이기
		    	            $('#checkCertification').fadeIn('100');//인증번호 확인 버튼  보이기
							$('#alerttitle').html('Email 발송 성공');
      	                    $('#alertcontent').html('인증번호를 입력해주세요.');
    	            		$('#alertModal').modal("show");
						}
    	            }
    	      	})
    	      });//이메일 인증 보내기
    	      
    	      $('#checkCertification').click(function() {
    	    	  if ($('#certificationtext').val()==$('#hiddencertification').val()) {
    	    		  $('#registid').fadeOut('100');
    	    		  $('#registidp').text($('#successcheckid').text());
    	    		  $('#CheckIDModal').modal("hide");
    	    		  $('#checkidtext').val('');
    	    		  $('#successcheckid').text('');
    	    		  $('#checkidtext').fadeIn('100');
    	    		  $('#checkid').fadeIn('100');
    	    		  
				}
    	    	  else {
    	    		  	$('#alerttitle').html('인증실패');
	                    $('#alertcontent').html('인증번호를 확인해주세요.');
	            		$('#alertModal').modal("show");
				}
      	      });//인증번호 확인 버튼 클릭시
    	      
    	   });//ready
    	   
    </script>
</head>
<body>
	<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="#first"><i
				class="ion-ios-analytics-outline"></i> WhereHouse</a>
		</div>
		<div class="navbar-collapse collapse" id="bs-navbar">
			<ul class="nav navbar-nav">
				<li><a class="page-scroll" href="#one">Intro</a></li>
				<li><a class="page-scroll" href="#two">Highlights</a></li>
				<li><a class="page-scroll" href="#three">Gallery</a></li>
				<li><a class="page-scroll" href="#four">Features</a></li>
				<li><a class="page-scroll" href="#last">Contact</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a class="page-scroll" data-toggle="modal"
					title="A free Bootstrap video landing theme" href="#LoginModal">Login</a>
				</li>
			</ul>
		</div>
	</div>
	</nav>
	<header id="first">
	<div class="header-content">
		<div class="inner">
			<h1 class="cursive">WhereHouse</h1>
			<h4>We can share our homes and feel their culture.</h4>
			<hr>
			<a href="#video-background" id="toggleVideo" data-toggle="collapse"
				class="btn btn-primary btn-xl">Toggle Video</a> &nbsp; <a
				href="#one" class="btn btn-primary btn-xl page-scroll">Get
				Started</a>
		</div>
	</div>
	<video autoplay="" loop="" class="fillWidth fadeIn wow collapse in"
		data-wow-delay="0.5s"
		poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg"
		id="video-background"> <source
		src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Traffic-blurred2.mp4"
		type="video/mp4">Your browser does not support the video tag.
	I suggest you upgrade your browser. </video> </header>
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
				<a href="#three" class="btn btn-default btn-xl page-scroll">Learn
					More</a>
			</div>
		</div>
	</div>
	</section>
	<section id="two">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="margin-top-0 text-primary">Flexible Layouts</h2>
				<hr class="primary">
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 text-center">
				<div class="feature">
					<i class="icon-lg ion-android-laptop wow fadeIn"
						data-wow-delay=".3s"></i>
					<h3>Responsive</h3>
					<p class="text-muted">Your site looks good everywhere</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 text-center">
				<div class="feature">
					<i class="icon-lg ion-social-sass wow fadeInUp"
						data-wow-delay=".2s"></i>
					<h3>Customizable</h3>
					<p class="text-muted">Easy to theme and customize with SASS</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 text-center">
				<div class="feature">
					<i class="icon-lg ion-ios-star-outline wow fadeIn"
						data-wow-delay=".3s"></i>
					<h3>Consistent</h3>
					<p class="text-muted">A mature, well-tested, stable codebase</p>
				</div>
			</div>
		</div>
	</div>
	</section>
	<section id="three" class="no-padding">
	<div class="container-fluid">
		<div class="row no-gutter">
			<div class="col-lg-4 col-sm-6">
				<a href="#galleryModal" class="gallery-box" data-toggle="modal"
					data-src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1430916273432-273c2db881a0%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3Df047e8284d2fdc1df0fd57a5d294614d">
					<img
					src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1430916273432-273c2db881a0%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3Df047e8284d2fdc1df0fd57a5d294614d"
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
					src="//splashbase.s3.amazonaws.com/getrefe/regular/tumblr_nqune4OGHl1slhhf0o1_1280.jpg"
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
					src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1433959352364-9314c5b6eb0b%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3D3b9bc6caa190332e91472b6828a120a4"
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
					src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-moto-drawing-illusion-nabeel-1440x960.jpg"
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
					src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-new-york-crosswalk-nabeel-1440x960.jpg"
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
					src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-clothes-exotic-travel-nabeel-1440x960.jpg"
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
	<section class="container-fluid" id="four">
	<div class="row">
		<div
			class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
			<h2 class="text-center text-primary">Features</h2>
			<hr>
			<div class="media wow fadeInRight">
				<h3>Simple</h3>
				<div class="media-body media-middle">
					<p>What could be easier? Get started fast with this landing
						page starter theme.</p>
				</div>
				<div class="media-right">
					<i class="icon-lg ion-ios-bolt-outline"></i>
				</div>
			</div>
			<hr>
			<div class="media wow fadeIn">
				<h3>Free</h3>
				<div class="media-left">
					<a href="#alertModal" data-toggle="modal" data-target="#alertModal"><i
						class="icon-lg ion-ios-cloud-download-outline"></i></a>
				</div>
				<div class="media-body media-middle">
					<p>Yes, please. Grab it for yourself, and make something
						awesome with this.</p>
				</div>
			</div>
			<hr>
			<div class="media wow fadeInRight">
				<h3>Unique</h3>
				<div class="media-body media-middle">
					<p>Because you don't want your Bootstrap site, to look like a
						Bootstrap site.</p>
				</div>
				<div class="media-right">
					<i class="icon-lg ion-ios-snowy"></i>
				</div>
			</div>
			<hr>
			<div class="media wow fadeIn">
				<h3>Popular</h3>
				<div class="media-left">
					<i class="icon-lg ion-ios-heart-outline"></i>
				</div>
				<div class="media-body media-middle">
					<p>There's good reason why Bootstrap is the most used frontend
						framework in the world.</p>
				</div>
			</div>
			<hr>
			<div class="media wow fadeInRight">
				<h3>Tested</h3>
				<div class="media-body media-middle">
					<p>Bootstrap is matured and well-tested. It's a stable codebase
						that provides consistency.</p>
				</div>
				<div class="media-right">
					<i class="icon-lg ion-ios-flask-outline"></i>
				</div>
			</div>
		</div>
	</div>
	</section>
	<aside class="bg-dark">
	<div class="container text-center">
		<div class="call-to-action">
			<h2 class="text-primary">Get Started</h2>
			<a
				href="http://www.bootstrapzero.com/bootstrap-template/landing-zero"
				target="ext" class="btn btn-default btn-lg wow flipInX">Free
				Download</a>
		</div>
		<br>
		<hr />
		<br>
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="row">
					<h6 class="wide-space text-center">BOOTSTRAP IS BASED ON THESE
						STANDARDS</h6>
					<div class="col-sm-3 col-xs-6 text-center">
						<i class="icon-lg ion-social-html5-outline" title="html 5"></i>
					</div>
					<div class="col-sm-3 col-xs-6 text-center">
						<i class="icon-lg ion-social-sass" title="sass"></i>
					</div>
					<div class="col-sm-3 col-xs-6 text-center">
						<i class="icon-lg ion-social-javascript-outline"
							title="javascript"></i>
					</div>
					<div class="col-sm-3 col-xs-6 text-center">
						<i class="icon-lg ion-social-css3-outline" title="css 3"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	</aside>
	<section id="last">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="margin-top-0 wow fadeIn">Get in Touch</h2>
				<hr class="primary">
				<p>We love feedback. Fill out the form below and we'll get back
					to you as soon as possible.</p>
			</div>
			<div class="col-lg-10 col-lg-offset-1 text-center">
				<form class="contact-form row">
					<div class="col-md-4">
						<label></label> <input type="text" class="form-control"
							placeholder="Name">
					</div>
					<div class="col-md-4">
						<label></label> <input type="text" class="form-control"
							placeholder="Email">
					</div>
					<div class="col-md-4">
						<label></label> <input type="text" class="form-control"
							placeholder="Phone">
					</div>
					<div class="col-md-12">
						<label></label>
						<textarea class="form-control" rows="9"
							placeholder="Your message here.."></textarea>
					</div>
					<div class="col-md-4 col-md-offset-4">
						<label></label>
						<button type="button" data-toggle="modal"
							data-target="#alertModal"
							class="btn btn-primary btn-block btn-lg">
							Send <i class="ion-android-arrow-forward"></i>
						</button>
					</div>
				</form>
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
	<div id="galleryModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<img src="//placehold.it/1200x700/222?text=..." id="galleryImage"
						class="img-responsive" />
					<p>
						<br />
						<button class="btn btn-primary btn-lg center-block"
							data-dismiss="modal" aria-hidden="true">
							Close <i class="ion-android-close"></i>
						</button>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div id="LoginModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center">Login</h2>
					<h5 class="text-center">Welcome WhereHouse</h5>
					<form action="Login">
						<input type="text" class="form-control" placeholder="ID (E-mail)" name="id"
							style="margin-top: 3%;" id="loginid"><br> <input type="password"
							class="form-control" placeholder="Password" name="pass"
							style="margin-bottom: 3%;" id="loginpass">
						<button type="button" data-toggle="modal"
							data-target="#alertModal"
							class="btn btn-primary btn-block btn-lg">
							Sign in <i class="ion-android-arrow-forward"></i>
						</button>
					</form>
					<p class="text-center" style="margin-top: 3%;">
						<a data-toggle="modal" data-target="#RegisterModal" id="registeraccountbtn">Sign up</a> /
						<a data-toggle="modal" data-target="#FindModal">Find Account</a>
					</p>
					<br />
					<button class="btn btn-primary btn-lg center-block"
						data-dismiss="modal" aria-hidden="true" id="loginmodalclose">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="RegisterModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center">Register Account</h2>
					<h5 class="text-center" style="margin-bottom: 3%;">Welcome WhereHouse</h5>
					<input type="text" class="form-control" placeholder="ID (E-mail)" name="id"
						id="registid" style=" margin-bottom: 3%;">
						<p class="text-center" id="registidp"></p>
					<input type="password" class="form-control" placeholder="Password"
						name="pass" id="registpass" style="margin-bottom: 3%;"> <input
						type="password" class="form-control" placeholder="PasswordCheck"
						name="passcheck" id="registpasscheck" style="margin-bottom: 3%;">
					<input type="text" class="form-control" placeholder="name"
						name="name" id="registname" style="margin-bottom: 3%;"> <input
						type="text" class="form-control" placeholder="phone" name="phone"
						id="registphone" style="margin-bottom: 3%;">
					<button type="button" id="registbtn"
						class="btn btn-primary btn-block btn-lg">
						Sign up <i class="ion-android-arrow-forward"></i>
					</button>
					<br />
					<button class="btn btn-primary btn-lg center-block"
						data-dismiss="modal" aria-hidden="true" id="RegisterModalbutton">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="CheckIDModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true" style="z-index: 100000;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center">Check ID</h2>
					<h5 class="text-center" style="margin-bottom: 5%">Please enter your email in the id field</h5>
					
					<input type="text" class="form-control" placeholder="ID (E-mail)" name="id"
						id="checkidtext" style=" margin-bottom: 3%;">
						<p class="text-center" id="successcheckid"></p>
					<button type="button" id="checkid"
						class="btn btn-primary btn-block btn-lg">
						Send certification num <i class="ion-android-arrow-forward"></i>
					</button>
					<input type="text" class="form-control" placeholder="Certification number"
						name="name" id="certificationtext" style="margin-bottom: 3%; margin-top: 3%;">
					<button type="button" id="checkCertification"
						class="btn btn-primary btn-block btn-lg">
						Check certification num <i class="ion-android-arrow-forward"></i>
					</button>
					<br />
					<button class="btn btn-primary btn-lg center-block"
						data-dismiss="modal" aria-hidden="true" id="CheckIDModalbutton">Close</button>
						<input type="hidden" id="hiddencertification">
				</div>
			</div>
		</div>
	</div>
	
	<div id="FindModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center">Find Account</h2>
					<h5 class="text-center">Find ID</h5>
					<form>
						<input type="text" class="form-control" placeholder="Name"
							name="name" style="margin-top: 3%; margin-bottom: 3%;"> <input
							type="text" class="form-control" placeholder="Phone" name="phone"
							style="margin-bottom: 3%;">
						<button type="button" data-toggle="modal"
							data-target="#alertModal"
							class="btn btn-primary btn-block btn-lg">
							Find ID <i class="ion-android-arrow-forward"></i>
						</button>
					</form>
					<br>
					<br>
					<h5 class="text-center">Find Password</h5>
					<form>
						<input type="text" class="form-control" placeholder="ID (E-mail)" name="id"
							style="margin-top: 3%; margin-bottom: 3%;"> <input
							type="text" class="form-control" placeholder="name" name="name"
							style="margin-bottom: 3%;"> <input type="text"
							class="form-control" placeholder="phone" name="phone"
							style="margin-bottom: 3%;">
						<button type="button" data-toggle="modal"
							data-target="#alertModal"
							class="btn btn-primary btn-block btn-lg">
							Find Pass <i class="ion-android-arrow-forward"></i>
						</button>
						<br />
					</form>

					<button class="btn btn-primary btn-lg center-block"
						data-dismiss="modal" aria-hidden="true">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div id="alertModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true" style="z-index: 100000;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center" id="alerttitle"></h2>
					<p class="text-center" id="alertcontent"></p>
					<p class="text-center">
					</p>
					<br />
					<button class="btn btn-primary btn-lg center-block"
						data-dismiss="modal" aria-hidden="true">
						OK <i class="ion-android-close"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--scripts loaded here from cdn for performance -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>