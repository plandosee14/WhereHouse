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

#mainDiv {
	width:85%;
	float:right;
}
</style>


<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/mypage/removebasket");
			formObj.submit();
		});

		$('#mypageLink').click(function() {
			location.reload();
		});
		
		$('#mypageLink2').click(function() {
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
<br><br><br>
	<div class="container" id="mainDiv">
		<!-- Custom Tabs -->

		<div class="nav-tabs-custom">
			<div id="mypageLink" style="cursor: pointer;">
				<h1>
					<i class="fa fa-cart-plus"></i>
					<font color="black">장바구니</font>
				</h1>
				<div style="border-bottom: 2px solid black"></div>
			</div>
			<input type="checkbox" id="menu_state" checked>
			<aside> <!-- <label for="menu_state"><i class="fa"></i></label> -->
			<ul>
		  <div id="mypageLink2" style="cursor: pointer;">
				<ul style="font-size: 30; color: #3A3A3A">&nbsp;
				  
				 <span style="font-family: ; font-weight: bold;">MyPage</span>
				</ul>
			  </div>
				<br>
				<li data-content="3" class="active">
					<a href="/mypage">
					<i class="fa fa-cart-plus"></i>
					<span>장바구니</span></a>
				</li>
				<li>
					<a href="/mypage/payinfo"> <i class="fa fa-credit-card"></i>
						<span>결제정보</span>
					</a>
				</li>
				<li>
					<a href="/mypage/reginfo"> <i class="fa fa-info-circle"></i>
						<span>등록정보</span>
				</a></li>
				<li>
					<a href="/mypage/checkForm"> <i class="fa fa-pencil"></i> <span>회원정보
							수정</span>
				</a></li>
				<li>
					<a href="/mypage/checkDelForm"> <i class="fa fa-trash"></i> <span>회원탈퇴</span></a>
				</li>
			</ul>
			</aside>
			<br> <br> <br>
			<c:forEach items="${bList}" var="myBasketVO">
				<div class="basketList">
					<center>
						<div style="width:100% ; height:300px; overflow: hidden;">
						<img src="../resources/img/house/${myBasketVO.h_thumnail}"
							width="95%" height="300px">
						</div>
					</center>
					<form role="form" method="post">
						<div class="basketText">
							<input type='hidden' name='b_no' value="${myBasketVO.b_no}">
							장바구니번호 : ${myBasketVO.b_no }<br> 
							집번호 : ${myBasketVO.h_no }<br>
							집종류 : ${myBasketVO.h_type }<br> 
							집유형 : ${myBasketVO.h_livetype }<br>
							<button type="submit" class="btn btn-danger">REMOVE</button>
						</div>
					</form>
				</div>
			</c:forEach>
		</div>
	</div>

</body>

</html>
