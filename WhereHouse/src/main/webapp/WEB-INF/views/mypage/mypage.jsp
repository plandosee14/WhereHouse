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
#faq_list {
	border-bottom: 1px solid #ccc 
}

#faq_list li {
	border-top: 1px solid #ccc;
	padding: 0 5px
}

#faq_list li h4 a {
	display: block;
	padding: 8px
}

#faq_list li p {
	border-top: 1px dotted #eaeaea;
	padding: 8px;
	line-height: 18px
}

#faq_list li.unfold h4 a {
	font-weight: bold
}

#faq_list li.fold p {
	display: none
}

* {
	padding: 0;
	margin: 0 auto;
}

#wrap {
	width: 1024px;
}

.basketList {
	width: 33%;
	float: left;
	box-sizing: border-box;
}

.basketText {
	size: 12;
	margin: 10;
}
</style>

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

#nav_menu ul {
 list-style-type:none;
 background-color:#000000;
 padding:1px 5px 5px 1px;
 float:left;
}
 
#nav_menu ul li {
 display:inline;
 border-left: 1px solid #c0c0c0;
 padding: 0px 10px 0px 10px;
 margin: 5px 0px 5px 0px;
 color:#ffffff;
 font-size:9pt;
}
 
#nav_menu ul li:first-child {
 border-left: none;
}
 
/* 특별하게 정해지지 않은 링크 속성에 모두 적용할 스타일 : 흰글씨 / 밑줄없앰 */
#nav_menu a {
 text-decoration:none;
 color:#ffffff
}
 
/* 링크에 마우스 롤오버시 적용되는 스타일 : 하단에 노란 밑줄이(border-bottom) 생김 */
#nav_menu a:hover {
 color:#D4F4FA;
 border-bottom:3px solid yellow;
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
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	
</script>

</head>

<body>

	<div class="container">
		<!-- Custom Tabs -->

		<div class="nav-tabs-custom">
			<div id="mypageLink" style="cursor: pointer;">
			<h1>
				<span class="glyphicon glyphicon-question-sign" style="color: blue"></span>
				<font color="black">MyPage</font>
			</h1>
			</div>
			<hr>
		<div id="nav_menu">
			<nav>
			<ul>
				<li><a href="/mypage">장바구니</a></li>
				<li><a href="/mypage/payinfo">결제정보</a></li>
				<li><a href="/mypage/reginfo">등록정보</a></li>
				<li><a href="/mypage/read">개인정보</a></li>
			</ul>
			</nav>
		</div>

			<br>
			<h3>찜목록</h3>
			<br>
			<c:forEach items="${mList}" var="myBasketVO">
				<div class="basketList">
					<center>
						<img src="../resources/img/house/${myBasketVO.h_thumnail}"
							width="95%">
					</center>
				<form role="form" method="post">
					<div class="basketText">
						<input type='hidden' name='b_no' value="${myBasketVO.b_no}">
						장바구니번호 : ${myBasketVO.b_no }<br> 집번호 : ${myBasketVO.h_no }<br>
						집종류 : ${myBasketVO.h_type }<br> 집유형 : ${myBasketVO.h_livetype }<br>
						<button type="submit" class="btn btn-danger">REMOVE</button>
					</div>
				</form>
				</div>
			</c:forEach>
		</div>
	</div>

</body>

</html>
