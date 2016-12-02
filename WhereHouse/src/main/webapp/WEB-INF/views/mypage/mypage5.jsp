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
					<i class="fa fa-pencil"></i> 
					<font color="black">회원정보 수정</font>
				</h1>
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
		<li class="active read"><a href="/mypage/read"> <i class="fa fa-pencil"></i> 
		<span>회원정보 수정</span>
		</a></li>
		<li><a href="/mypage/delete"> <i class="fa fa-trash"></i> <span>회원탈퇴</span></a>
		</li>
	</ul>
	</aside>
	<div align="left">
		<br>

		<div id="contact-form" class="contatct-form">
			<div class="loader"></div>
			<form name="update" method="post">

				<div class="row" style="text-align: left;">

					<label for="m_id">아이디<span class="required"></span></label> <input
						id="m_id" name="m_id" type="text" value="${member.m_id }"
						readonly="readonly" />

				</div>
				<div class="row" style="text-align: left">

					<label for="m_no">회원번호<span class="required"></span></label> <input
						id="m_no" name="m_no" type="text" value="${member.m_no }"
						readonly="readonly" />

				</div>
				<div class="row" style="text-align: left">

					<label for="m_name">이름<span class="required"></span></label> <input
						id="m_name" name="m_name" type="text" value="${member.m_name }"
						readonly="readonly" />

				</div>

				<div class="row" style="text-align: left">
					<label for="m_phone">휴대폰<span class="required"></span></label> <input
						id="m_phone" name="m_phone" type="text" value="${member.m_phone }"
						maxlength="20" />

				</div>



				<div class="row">
					<input type="submit" name="submit" class="btn btn-danger btn-sm"
						value="수정하기" /> <input type="button" name="reset"
						class="btn btn-danger btn-sm" id="pageback" value="취소" />
				</div>

			</form>
		</div>

	</div>
   </div>
  </div>
</body>

</html>