<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
    	    	  if($('#registidp').text()==null||$('#registidp').text()==""){
    	    		  $('#alerttitle').html('아이디');
	                  $('#alertcontent').html('아이디를 확인해주세요.');
	                  $('#alertModal').modal("show");
    	    	  }else if ($('#registpass').val()==null||$('#registpass').val()==""||$('#registpass').val().replace(" ", "").length != $('#registpass').val().length||$('#registpass').val().length<6 || $('#registpass').val().length>15) {
    	    		  $('#alerttitle').html('비밀번호');
	                  $('#alertcontent').html('비밀번호를 확인해주세요.');
	                  $('#alertModal').modal("show");
				}else if ($('#registname').val()==null||$('#registname').val()==""||$('#registname').val().replace(" ", "").length != $('#registname').val().length||$('#registname').val().length<1||$('#registname').val().length>15) {
					  $('#alerttitle').html('이름');
	                  $('#alertcontent').html('이름을 확인해주세요.');
	                  $('#alertModal').modal("show");
				}else if ($('#registphone').val()==null||$('#registphone').val()==""||isNaN($('#registphone').val())||$('#registphone').val().replace(" ", "").length != $('#registphone').val().length||$('#registphone').val().length<8||$('#registphone').val().length>20) {
					
				}
    	      else{
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
    	      }});//signup버튼
       		
    	      
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
    	      	$('#CheckIDModal').modal("show");
    	      });//이메일인증창 SHOW
    	      
    	      $('#registeraccountbtn').click(function() {
      	    	$('#certificationtext').fadeOut('100');//인증번호 입력텍스트 숨기기
  	            $('#checkCertification').fadeOut('100');//인증번호 확인 버튼  숨기기
  	            $('#certificationtext').val('');//인증번호 확인 버튼  숨기기
      	      });
    	      
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
					title="" href="#LoginModal" id="loginmodalbtn">Login</a>
				</li>
			</ul>
		</div>
	</div>
	</nav>
	
	
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
					<input type="password" class="form-control" placeholder="Password (6-15)"
						name="pass" id="registpass" style="margin-bottom: 3%;"> <input
						type="password" class="form-control" placeholder="PasswordCheck"
						name="passcheck" id="registpasscheck" style="margin-bottom: 3%;">
					<input type="text" class="form-control" placeholder="name"
						name="name" id="registname" style="margin-bottom: 3%;"> <input
						type="text" class="form-control" placeholder="phone exception(-)" name="phone"
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
					<h5 class="text-center" style="margin-bottom: 20%">Please enter your email in the id field</h5>
					
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
						data-dismiss="modal" aria-hidden="true" id="CheckIDModalbutton" style="margin-top: 20%">Close</button>
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
							type="text" class="form-control" placeholder="Phone exception(-)" name="phone"
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
							class="form-control" placeholder="phone exception(-)" name="phone"
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
	