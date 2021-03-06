<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="/resources/js/jquery-1.8.3.min.js"
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
<link rel="stylesheet" href="/resources/css/styles.css" />
<script type="text/javascript">

       $(document).ready(function(){
    	   $('#loginbtn').click(function() {
 	      	$.ajax({
 	      		url:"/member/login",
 	            type: "post",
 	            data:{
 	            	m_id : $('#loginid').val(),
 	            	m_pass : $('#loginpass').val()
 	            },
 	            success:function(result){
 	            	if (result == "fail") {
 	            		 $('#alerttitle').html('로그인 실패');
		                  $('#alertcontent').html('ID, Password를 확인해주세요.');
		                  $('#alertModal').modal("show");
					 }
 	            	else if(result == "success"){
 	            		location.reload();
					}else if (result.substring("정지") != null) {
						  $('#alerttitle').html('로그인 실패');
		                  $('#alertcontent').html(result);
		                  $('#alertModal').modal("show");
					}else {
						  $('#alerttitle').html('로그인 실패');
		                  $('#alertcontent').html(result);
		                  $('#alertModal').modal("show");
					}
 	            }
 	      	})
 	      });//sign in버튼 클릭시
    	   
    	   $('#loginmodalbtn').click(function() {
    		   if ($('#loginmodalbtn').text() == "로그인") {
    		   $('#LoginModal').modal({backdrop: 'static'});
			}
    	   });//로그인 모달창 띄우기
    	   
    	   $('#logout').click(function() {
    		   $.ajax({
   	            url:"/member/logout",
   	            type: "post",
   	            success:function(result){
   	               if (result=="success") {
	                  location.reload();
				}
   	            }
   	         });
    	   });//로그아웃 클릭시
 	      
    	      $("#registbtn").click(function(){
    	    	  if($('#registidp').text()==null||$('#registidp').text()==""){
    	    		  $('#alerttitle').html('아이디');
	                  $('#alertcontent').html('아이디를 확인해주세요.');
	                  $('#alertModal').modal("show");
    	    	  }else if ($('#registpass').val()==null||$('#registpass').val()==""||$('#registpass').val().replace(" ", "").length != $('#registpass').val().length||$('#registpass').val().length<6 || $('#registpass').val().length>15|| $('#registpass').val() != $('#registpasscheck').val()) {
    	    		  $('#alerttitle').html('비밀번호');
	                  $('#alertcontent').html('비밀번호를 확인해주세요.');
	                  $('#alertModal').modal("show");
				}else if ($('#registname').val()==null||$('#registname').val()==""||$('#registname').val().replace(" ", "").length != $('#registname').val().length||$('#registname').val().length<1||$('#registname').val().length>15) {
					  $('#alerttitle').html('이름');
	                  $('#alertcontent').html('이름을 확인해주세요.');
	                  $('#alertModal').modal("show");
				}else if ($('#registphone').val()==null||$('#registphone').val()==""||isNaN($('#registphone').val())||$('#registphone').val().replace(" ", "").length != $('#registphone').val().length||$('#registphone').val().length<2||$('#registphone').val().length>8) {
					  $('#alerttitle').html('전화번호');
	                  $('#alertcontent').html('전화번호를 확인해주세요.');
	                  $('#alertModal').modal("show");
				}else if ($('#registphone1').val()==null||$('#registphone1').val()==""||isNaN($('#registphone1').val())||$('#registphone1').val().replace(" ", "").length != $('#registphone1').val().length||$('#registphone1').val().length<2||$('#registphone1').val().length>8) {
					  $('#alerttitle').html('전화번호');
	                  $('#alertcontent').html('전화번호를 확인해주세요.');
	                  $('#alertModal').modal("show");
				}else if ($('#registphone2').val()==null||$('#registphone2').val()==""||isNaN($('#registphone2').val())||$('#registphone2').val().replace(" ", "").length != $('#registphone2').val().length||$('#registphone2').val().length<2||$('#registphone2').val().length>8) {
					  $('#alerttitle').html('전화번호');
	                  $('#alertcontent').html('전화번호를 확인해주세요.');
	                  $('#alertModal').modal("show");
				}
    	      else{
    	         $.ajax({
    	            url:"/member/register",
    	            type: "post",
    	            data:{
    	            	m_id : $('#registidp').text(),
    	            	m_pass : $('#registpass').val(),
    	            	m_name : $('#registname').val(),
    	            	m_phone : $('#registphone').val()+"-"+$('#registphone1').val()+"-"+$('#registphone2').val()
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
    	                  $('#registphone1').val('');
    	                  $('#registphone2').val('');
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
                  $('#registphone1').val('');
                  $('#registphone2').val('');

    	      });//close시 회원가입창 초기화
    	      
    	      $('#registid').click(function() {
    	      	$('#CheckIDModal').modal({backdrop: 'static'});
    	      	$('#checkidtext').val('');
    	      });//이메일인증창 SHOW
    	      
    	      $('#registeraccountbtn').click(function() {
      	    	$('#certificationtext').fadeOut('100');//인증번호 입력텍스트 숨기기
  	            $('#checkCertification').fadeOut('100');//인증번호 확인 버튼  숨기기
  	            $('#certificationtext').val('');//인증번호 확인 버튼  숨기기
  	            $('#passicon').attr("class","");
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
    	      
      	      
      	      $('#findidbtn').click(function() {
      	    	$.ajax({
    	      		url:"/member/findid",
    	            type: "post",
    	            data:{
    	            	m_name : $('#findidnametext').val(),
    	            	m_phone : $('#findidphonetext').val()+"-"+$('#findidphonetext1').val()+"-"+$('#findidphonetext2').val()
    	            },
    	            success:function(result){
    	            	if (result==null||result=="") {
							$('#findidresult').text('입력하신 회원정보와 일치하는 ID가 존재하지 않습니다.');
						}else {
							$('#findidnametext').val('');
	    	            	$('#findidphonetext').val('');
	    	            	$('#findidphonetext1').val('');
	    	            	$('#findidphonetext2').val('');
							$('#findidresult').html('ID = <font size = "5">'+ result+'</font> 입니다.');
						}
    	            }
    	      	});
      	      });//아이디찾기
      	      
      	    $('#findpassbtn').click(function() {
      	    	$('#findpassbtn').fadeOut('100');
      	    	$.ajax({
    	      		url:"/member/findpass",
    	            type: "post",
    	            data:{
    	            	m_id : $('#findpassidtext').val(),
    	            	m_name : $('#findpassnametext').val(),
    	            	m_phone : $('#findpassphonetext').val()+"-"+$('#findpassphonetext1').val()+"-"+$('#findpassphonetext2').val()
    	            },
    	            success:function(result){
    	            	if (result==null || result=="0") {
    	            		$('#alerttitle').html('E-mail 발송 실패');
      	                    $('#alertcontent').html('입력하신 정보와 일치하는 ID가 없습니다.');
    	            		$('#alertModal').modal("show");
    	            		$('#findpassbtn').fadeIn('100');
						}else {
							$('#alerttitle').html('E-mail이 발송성공');
      	                    $('#alertcontent').html('E-mail로 발송된 비밀번호로 로그인하여주세요.');
    	            		$('#alertModal').modal("show");
    	            		$('#findpassidtext').val('');
    	            		$('#findpassnametext').val('');
    	            		$('#findpassphonetext').val('');
    	            		$('#findpassphonetext1').val('')
    	            		$('#findpassphonetext2').val('')
    	            		$('#findpassbtn').fadeIn('100');
						}
    	            }
    	      	});
      	      });//비번찾기
      	      
      	      $('#findAccountbtn').click(function() {
      	      	$('#findidnametext').val('');
      	      	$('#findidphonetext').val('');
      	      	$('#findidphonetext1').val('');
      	      	$('#findidphonetext2').val('');
      	      	$('#findidresult').html('');
      	      	$('#findpassidtext').val('');
      	      	$('#findpassnametext').val('');
      	      	$('#findpassphonetext').val('');
      	      	$('#findpassphonetext1').val('');
      	      	$('#findpassphonetext2').val('');
      	        $('#findpassbtn').fadeIn('100');
      	      });//findAccount클릭시 id란 초기화
      	      
      	      $('#registpass').keyup(function() {
      	      	if ($('#registpass').val().length >= 6 && $('#registpass').val() == $('#registpasscheck').val()) {
					$('#passicon').attr("class","glyphicon glyphicon-ok");
				}else if ($('#registpass').val()==""||$('#registpasscheck').val()=="") {
					$('#passicon').attr("class","");
				}
      	      	else {
					$('#passicon').attr("class","glyphicon glyphicon-remove");
				}
      	      });
      	    $('#registpasscheck').keyup(function() {
      	      	if ($('#registpass').val().length >= 6 && $('#registpass').val() == $('#registpasscheck').val()) {
					$('#passicon').attr("class","glyphicon glyphicon-ok");
				}else if ($('#registpass').val()==""||$('#registpasscheck').val()=="") {
					$('#passicon').attr("class","");
				}
      	      	else {
					$('#passicon').attr("class","glyphicon glyphicon-remove");
				}
      	      });
      	      
      	    $('#mainsearchbtn').click(function() {
      	    	location.replace("/search");
      	    });//검색창으로 넘기기
      	    
      	    
      	    
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
			<a class="navbar-brand page-scroll" href="/"><i
				class="glyphicon glyphicon-home"></i> WhereHouse</a>
		</div>
		<div class="navbar-collapse collapse" id="bs-navbar">
			<ul class="nav navbar-nav">
				<li><a class="page-scroll" href="/search">집 검색</a></li>
			<% String m_name = (String)request.getSession().getAttribute("m_name"); %>
			<%if(m_name == null || m_name.equals("")){%>
			<% }else{%>
				<li><a class="page-scroll" href="/house/registerForm">집 등록</a></li>
			<%} %>
			</ul>
			<%if(m_name == null || m_name.equals("")){%>
			<ul class="nav navbar-nav navbar-right">
				<li><a style="cursor: pointer;" id="loginmodalbtn">로그인</a></li>
			</ul>
			<% }else{%>
				<ul class="nav navbar-nav navbar-right" style="margin-right: 1%; margin-top: 1%; " >
				<li><div id="userinfo" style="font-size: 20px; display: inline; font: 900;"><div class="dropdown">
  			<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
   			 <i class="glyphicon glyphicon-user"></i> <%=m_name%>
   			 <span class="caret"></span>
  			</button>
  			<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
    			<li role="presentation"><a role="menuitem" tabindex="-1" href="/mypage" style="cursor: pointer;">장바구니</a></li>
    			<li role="presentation"><a role="menuitem" tabindex="-1" href="/mypage/payinfo" style="cursor: pointer;">결제정보</a></li>
    			<li role="presentation"><a role="menuitem" tabindex="-1" href="/mypage/reginfo" style="cursor: pointer;">등록정보</a></li>
    			<li role="presentation"><a role="menuitem" tabindex="-1" href="/mypage/checkForm" style="cursor: pointer;">정보수정</a></li>
    			<li role="presentation" class="divider"></li>
    			<li role="presentation"><a role="menuitem" tabindex="-1" id="logout" style="cursor: pointer;">로그아웃 <i class="glyphicon glyphicon-log-out"></i></a></li>
  			</ul>
			</li>
			</ul>
			<% }%>
		</div>
	</div>
	</nav>
	
	
		
	<div id="LoginModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center">로그인</h2>
					<h5 class="text-center">WhereHouse</h5>
					<form action="Login">
						<input type="text" class="form-control" placeholder="ID (E-mail)" name="id"
							style="margin-top: 3%;" id="loginid"><br> <input type="password"
							class="form-control" placeholder="Password" name="pass"
							style="margin-bottom: 3%;" id="loginpass">
						<button type="button" 
							class="btn btn-primary btn-block btn-lg" id="loginbtn">
							로그인 <i class="ion-android-arrow-forward"></i>
						</button>
					</form>
					<p class="text-center" style="margin-top: 3%;">
						<a data-toggle="modal" data-target="#RegisterModal" data-backdrop='static' id="registeraccountbtn" style="cursor: pointer;">회원가입</a> /
						<a data-toggle="modal" data-target="#FindModal" data-backdrop='static' id="findAccountbtn" style="cursor: pointer;">ID/PASS 찾기</a>
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
					<h2 class="text-center">회원가입</h2>
					<h5 class="text-center" style="margin-bottom: 3%;">WhereHouse</h5>
					<input type="text" class="form-control" placeholder="ID (E-mail)" name="id"
						id="registid" style=" margin-bottom: 3%;">
						<p class="text-center" id="registidp"></p>
					<input type="password" class="form-control" placeholder="Password (6-15)"
						name="pass" id="registpass" style="margin-bottom: 3%;">
						<div>
						<input
						type="password" class="form-control2" placeholder="PasswordCheck"
						name="passcheck" id="registpasscheck" style="margin-bottom: 3%; width: 95%; margin-right: 2%"><i id="passicon"></i></div>
					<input type="text" class="form-control" placeholder="name"
						name="name" id="registname" style="margin-bottom: 3%;"> <input
						type="text" class="form-control2" placeholder="phone" name="phone"
						id="registphone" style="margin-bottom: 3%; width: 20%;">
						-
						<input
						type="text" class="form-control2" placeholder="phone" name="phone"
						id="registphone1" style="margin-bottom: 3%; width: 37.5%;">
						-
						<input
						type="text" class="form-control2" placeholder="phone" name="phone"
						id="registphone2" style="margin-bottom: 3%; width: 37.5%;">
					<button type="button" id="registbtn"
						class="btn btn-primary btn-block btn-lg">
						회원가입 <i class="glyphicon glyphicon-upload"></i>
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
					<h2 class="text-center">아이디 확인</h2>
					<h5 class="text-center" style="margin-bottom: 20%">WhereHouse</h5>
					
					<input type="text" class="form-control" placeholder="ID (E-mail)" name="id"
						id="checkidtext" style=" margin-bottom: 3%;">
						<p class="text-center" id="successcheckid"></p>
					<button type="button" id="checkid"
						class="btn btn-primary btn-block btn-lg">
						인증번호 발송 <i class="ion-android-arrow-forward"></i>
					</button>
					<input type="text" class="form-control" placeholder="Certification number"
						name="name" id="certificationtext" style="margin-bottom: 3%; margin-top: 3%;">
					<button type="button" id="checkCertification"
						class="btn btn-primary btn-block btn-lg">
						인증번호 발송 <i class="ion-android-arrow-forward"></i>
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
					<h2 class="text-center">계정 찾기</h2>
					<h5 class="text-center">ID 찾기</h5>
					<form>
						<input type="text" class="form-control" placeholder="Name"
							name="name" style="margin-top: 3%; margin-bottom: 3%;" id="findidnametext"> <input
							type="text" class="form-control2" placeholder="Phone" name="phone"
							style="margin-bottom: 3%; width: 20%;" id="findidphonetext">
							-
							<input
							type="text" class="form-control2" placeholder="Phone" name="phone"
							style="margin-bottom: 3%; width: 37.5%;" id="findidphonetext1">
							-
							<input
							type="text" class="form-control2" placeholder="Phone" name="phone"
							style="margin-bottom: 3%; width: 37.5%;" id="findidphonetext2">
						<button type="button" class="btn btn-primary btn-block btn-lg"  id="findidbtn">
							ID 찾기 <i class="glyphicon glyphicon-search"></i>
						</button>
						<h5 class="text-center" id="findidresult"> </h5>
					</form>
					<br>
					<br>
					<h5 class="text-center">Password 찾기</h5>
					<form>
						<input type="text" class="form-control" placeholder="ID (E-mail)" name="id"
							style="margin-top: 3%; margin-bottom: 3%;" id="findpassidtext">
							<input
							type="text" class="form-control" placeholder="name" name="name"
							style="margin-bottom: 3%;" id="findpassnametext">
							<input type="text"
							class="form-control2" placeholder="phone" name="phone"
							style="margin-bottom: 3%; width: 20%;" id="findpassphonetext">
							-
							<input type="text"
							class="form-control2" placeholder="phone" name="phone"
							style="margin-bottom: 3%; width: 37.5%;" id="findpassphonetext1">
							-
							<input type="text"
							class="form-control2" placeholder="phone" name="phone"
							style="margin-bottom: 3%; width: 37.5%;" id="findpassphonetext2">
						<button type="button"
							class="btn btn-primary btn-block btn-lg" id="findpassbtn">
							Pass 찾기 <i class="glyphicon glyphicon-search"></i>
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
						OK
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="hiddensearch">
	
	<!--scripts loaded here from cdn for performance -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
	<script src="/resources/js/scripts.js"></script>
	