<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header>
<header><%@include file="../mypageHeader.jsp"%></header>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/myPage.css" type="text/css" />
<html>

<head>
<link rel="stylesheet" href="/resources/css/mypageMenu.css" />
<title>Insert title here</title>

<style type="text/css">
#mainDiv {
	width: 85%;
	float: right;
}
</style>

<script>
	$(document).ready(function() {

		$('#mypageLink').click(function() {
			location.reload();
		});
		
		$('#mypageLink2').click(function() {
			location.reload();
		});

	});
</script>
</head>

<body>
	<br><br><br>
	<div class="container" id="mainDiv">
		<!-- Custom Tabs -->

		<div class="nav-tabs-custom">
			<div id="mypageLink" style="cursor: pointer;">
				<h1>
					<i class="fa fa-info-circle"></i>
					<font color="black">등록정보</font>
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
				<li><a href="/mypage">
						<i class="fa fa-cart-plus"></i> <span>장바구니</span>
				</a></li>
				<li><a href="/mypage/payinfo"> <i class="fa fa-credit-card"></i>
						<span>결제정보</span>
				</a></li>
				<li class="active read"><a href="/mypage/reginfo"> <i class="fa fa-info-circle"></i>
						<span>등록정보</span>
				</a></li>
				<li><a href="/mypage/read"> <i class="fa fa-pencil"></i> <span>회원정보
							수정</span>
				</a></li>
				<li><a href="/mypage/delete"> <i class="fa fa-trash"></i> <span>회원탈퇴</span></a>
				</li>
			</ul>
			</aside>

			<br>

			<table class="table table-bordered">
				<tr style="color: black">
					<th>예약한 사람</th>
					<th>전화번호</th>
					<th>예약한 날짜</th>
				</tr>


				<c:forEach items="${mList}" var="basketVO">

					<tr style="color: black">
						<td>${member.m_name}</td>
						<td></td>
						<td></td>
					</tr>

				</c:forEach>

			</table>
		</div>
	</div>

</body>

</html>
