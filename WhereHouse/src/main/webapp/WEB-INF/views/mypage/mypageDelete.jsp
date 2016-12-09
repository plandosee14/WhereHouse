<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header>
<header><%@include file="../mypageHeader.jsp"%></header>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link rel="stylesheet" href="/resources/css/mypageMenu.css" />

<style type="text/css">
#mainDiv {
	width: 85%;
	float: right;
}

.btn_cancle {
	color: #000;
	background-color:#ccc;
	border: 1px solid #ccc;
	border-radius:20px;
	padding:5px 10px;
	font-size:12px;
	line-height:1.5;
}

</style>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		$('#mypageLink').click(function() {
			location.reload();
		});
		$('#mypageLink2').click(function() {
			location.reload();
		});

	});//ready
</script>

</head>

<body>
	<br><br><br>
	<div class="container" id="mainDiv">	
	  <div class="nav-tabs-custom">
			<div id="mypageLink" style="cursor: pointer;">
				<h1>
					<i class="fa fa-trash"></i> 
					<font color="black">회원 탈퇴</font>
				</h1>
				<div style="border-bottom: 2px solid black"></div>
			</div>
			<hr>
	<input type="checkbox" id="menu_state" checked>
	<aside>
	<ul>
			  <div id="mypageLink2" style="cursor: pointer;">
				<ul style="font-size: 30; color: #3A3A3A">&nbsp;
				  
				 <span style="font-family: ; font-weight: bold;">MyPage</span>
				</ul>
			  </div>
				<br>	  
		<li data-content="3"><a href="/mypage">
				<i class="fa fa-cart-plus"></i> <span>장바구니</span>
		</a></li>
		<li><a href="/mypage/payinfo"> <i class="fa fa-credit-card"></i>
				<span>결제정보</span>
		</a></li>
		<li><a href="/mypage/reginfo"> <i class="fa fa-info-circle"></i>
				<span>등록정보</span>
		</a></li>
		<li><a href="/mypage/checkForm"> <i class="fa fa-pencil"></i> 
		<span>회원정보 수정</span>
		</a></li>
		<li class="active read"><a href="/mypage/deleteForm"> <i class="fa fa-trash"></i> <span>회원탈퇴</span></a>
		</li>
	</ul>
	</aside>
	<div align="left">
		<br>

		<div id="contact-form" class="contatct-form">
			<div class="loader"></div>
			탈퇴를 하시면 아이디를 사용하실수 없으며, <br>
			30일이전 회원탈퇴를 철회하시려면 관리자에게<br>
			문의해 주시기 바랍니다.<br>
			30일후에는 회원님의 정보는 모두 삭제되고<br>
			계정을 복구 하실수 없습니다.<br>
			정말 탈퇴하시겠습니까? <br>
		</div><br><br>
		<form method="post" action="delete">
			<input type="submit" name="submit" class="btn btn-danger btn-sm" value="탈퇴하기" /> 
			<input type="button" name="reset" class="btn_cancle" id="pageback" value="취소"/>
		</form>	
	</div>
   </div>
  </div>
</body>

</html>