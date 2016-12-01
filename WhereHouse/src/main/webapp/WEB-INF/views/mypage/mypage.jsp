<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header><br><br>
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
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                     
         
         /* nav tag */
         nav ul{padding-top:10px;}                     /*  상단 여백 10px  */
         nav ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            border-left:1px solid #999;             /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
            font:bold 12px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding:0 10px;                         /* 각 메뉴 간격 */
        }
         nav ul li:first-child{border-left:none;}     /* 메뉴 분류중 제일 왼쪽의 "|"는 삭제        
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
			<h3>찜목록</h3>
			<br>
						<c:forEach items="${mList}" var="myBasketVO">
							<div class="basketList">
								<center>
									<img  src="../resources/img/house/${myBasketVO.h_thumnail}"
										width="95%">
								</center>
								<div class="basketText">
									장바구니번호 : ${myBasketVO.b_no }<br> 
									집번호 : ${myBasketVO.h_no }<br>
									집종류 : ${myBasketVO.h_type }<br> 
									집유형 : ${myBasketVO.h_livetype }<br>
									 <button type="button" class="btn btn-danger" onclick="">X</button>
								</div>
							</div>
						</c:forEach>

	
					
			</div>
		</div>

</body>

</html>
