<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header>
<br>
<br>
<br>
<br>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/myPage.css" type="text/css" />
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 기본 설정*/
a {
	text-decoration: none;
	color: #000000;
}

a:hover {
	color: #ff0000;
}

/* nav tag */
nav ul {
	padding-top: 10px;
}

nav ul li {
	display: inline;
	border-left: 1px solid #999;
	font: bold 12px Dotum;
	padding: 0 10px;
}

nav ul li:first-child {
	border-left: none;
}
</style>

</head>

<body>

	<div class="container">
		<!-- Custom Tabs -->

		<div class="nav-tabs-custom">

			<h1>
				<span class="glyphicon glyphicon-question-sign" style="color: blue"></span><font
					color="black">MyPage</font>
			</h1>
			<hr>
			<nav>
			<ul>
				<li><a href="/mypage">장바구니</a></li>
				<li><a href="/mypage/payinfo">결제정보</a></li>
				<li><a href="/mypage/reginfo">등록정보</a></li>
				<li><a href="/mypage/read">개인정보</a></li>
			</ul>
			</nav>

			<br>
			<h3>결제정보</h3>
			<br>

			<table class="table table-bordered">
				<tr style="color: black">
					<th>집 사진</th>
					<th>예약한 집번호</th>
					<th>지불한 금액</th>
					<th>예약한 날짜</th>
					<th>집 전화번호</th>
				</tr>


				<c:forEach items="${mList}" var="basketVO">

					<tr style="color: black">
						<td><img src="../resources/img/house/${basketVO.h_thumnail}"
							width="70"></td>
						<td>${basketVO.h_no}</td>
						<td></td>
						<td></td>
						<td></td>

					</tr>

				</c:forEach>

			</table>
		</div>
	</div>

</body>

</html>
