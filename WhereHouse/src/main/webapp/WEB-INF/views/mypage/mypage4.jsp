<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header>
<header><%@include file="../mypageHeader.jsp"%></header>
<br>
<br>
<br>
<br>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<style type="text/css">
input[type="checkbox"]#menu_state {
  display: none;
}
input[type="checkbox"]:checked ~ aside {
  width: 250px;
}
input[type="checkbox"]:checked ~ aside label[for="menu_state"] i::before {
  content: "\f053";
}
input[type="checkbox"]:checked ~ aside ul {
  width: 100%;
}
input[type="checkbox"]:checked ~ aside ul li a i {
  border-right: 1px solid #2f343e;
}
input[type="checkbox"]:checked ~ aside ul li a span {
  opacity: 1;
  transition: opacity 0.25s ease-in-out;
}
input[type="checkbox"]:checked ~ main {
  left: 250px;
}
aside {
  position: fixed;
  z-index: 9;
  top: 0;
  left: 0;
  bottom: 0;
  background: #383e49;
  color: #9aa3a8;
  width: 50px;
  font-family: 'Montserrat', sans-serif;
  font-weight: lighter;
  transition: all 0.15s ease-in-out;
  margin-top: 61px;
}
aside label[for="menu_state"] i {
  cursor: pointer;
  position: absolute;
  top: 50%;
  right: -8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  background: #fff;
  font-size: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 15px;
  width: 15px;
  border-radius: 50%;
  border: 1px solid #ddd;
  transition: width 0.15s ease-in-out;
  z-index: 1;
}
aside label[for="menu_state"] i::before {
  margin-top: 2px;
  content: "\f054";
}
aside label[for="menu_state"] i:hover {
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
aside ul {
  overflow: hidden;
  display: block;
  width: 50px;
  list-style-type: none;
  padding: 0;
  margin: 0;
}
aside ul li {
  border: 1px solid #2f343e;
  position: relative;
}
aside ul li.unread:after {
  content: attr(data-content);
  position: absolute;
  top: 10px;
  left: 25px;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  color: #fff;
  background: #ef5952;
  font-size: 8px;
}
aside ul li:not(:last-child) {
  border-bottom: none;
}
aside ul li.active a {
  background: #4c515d;
  color: #fff;
}
aside ul li a {
  position: relative;
  display: block;
  white-space: nowrap;
  text-decoration: none;
  color: #9aa3a8;
  height: 50px;
  width: 100%;
  transition: all 0.15s ease-in-out;
}
aside ul li a:hover {
  background: #4c515d;
  color: #fff;
}
aside ul li a * {
  height: 100%;
  display: inline-block;
}
aside ul li a i {
  text-align: center;
  width: 50px;
  z-index: 999999;
}
aside ul li a i.fa {
  line-height: 50px;
}
aside ul li a span {
  padding-left: 25px;
  opacity: 0;
  line-height: 50px;
  transition: opacity 0.1s ease-in-out;
}
main {
  position: absolute;
  transition: all 0.15s ease-in-out;
  top: 0;
  left: 50px;
}
main header {
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  right: 0;
  height: 400px;
  background: url("http://www.blueb.co.kr/SRC2/_image/01.jpg");
  background-size: cover;
  background-position: 50% 50%;
  background-repeat: no-repeat;
}
main section {
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  background: #fff;
  padding: 25px;
  font-family: helvetica;
  font-weight: lighter;
  padding: 50px;
  margin: 150px 75px;
  transition: all 0.15s ease-in-out;
}
main section:hover {
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
main section h1 {
  padding-top: 0;
  margin-top: 0;
  font-weight: lighter;
}

</style>

<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");

	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/mypage/removebasket");
		formObj.submit();
	});

	$('#mypageLink').click(function() {
		location.reload();
	});
	
});//ready

</script>

</head>

<body>

<input type="checkbox" id="menu_state" checked>
<aside>
	<label for="menu_state"><i class="fa"></i></label>
	<ul>
		<li>
			<a href="/mypage">
				<i class="fa fa-inbox"></i>
				<span>장바구니</span>
			</a>
		</li>
		<li>
			<a href="/mypage/payinfo">
				<i class="fa fa-heart"></i>
				<span>결제정보</span>
			</a>
		</li>
		<li>
			<a href="/mypage/reginfo">
				<i class="fa fa-paper-plane"></i>
				<span>등록정보</span>
			</a>
		</li>
		<li class="active">
			<a href="/mypage/read">
				<i class="fa fa-pencil"></i>
				<span>회원정보 수정</span>
			</a>
		</li>
		<li>
			<a href="/mypage/read">
				<i class="fa fa-trash"></i>
				<span>회원탈퇴</span>
			</a>
		</li>
	</ul>
</aside>
		<div align="center">
			<br>
			<h3>개인정보 수정 및 탈퇴</h3>
			<br>



			<div id="contact-form" class="contatct-form">
				<div class="loader"></div>
				<form name="update" method="post">

					<div class="row" style="text-align: center">
						
							<label for="m_id">아이디<span class="required"></span></label> <input
								id="m_id" name="m_id" type="text" value="${member.m_id }"
								readonly="readonly" />
						
					</div>
					<div class="row" style="text-align: center">
						
							<label for="m_no">회원번호<span class="required"></span></label> <input
								id="m_no" name="m_no" type="text" value="${member.m_no }"
								readonly="readonly" />
						
					</div>
					<div class="row" style="text-align: center">
						
							<label for="m_name">이름<span class="required"></span></label> <input
								id="m_name" name="m_name" type="text" value="${member.m_name }"
								readonly="readonly" />
						
					</div>

					<div class="row" style="text-align: center">
						<label for="m_phone">휴대폰<span class="required"></span></label> <input
								id="m_phone" name="m_phone" type="text"
								value="${member.m_phone }" maxlength="20" />
						
					</div>



					<div class="row">
						<input type="submit" name="submit" class="btn btn-danger btn-sm"
							value="수정하기" /> <input type="button" name="reset"
							class="btn btn-danger btn-sm" id="pageback" value="취소" />
					</div>

				</form>
			</div>
		
</div>


</body>

</html>