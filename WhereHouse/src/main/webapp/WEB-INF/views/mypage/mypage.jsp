<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header>
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
<script type="text/javascript">
	jQuery(function($) {
		$('textarea').css({
			'height' : '100%',
			'width' : '100%'
		});
		var faqList = $("#faq_list>li"); //리스트를 변수로 저장
		faqList.attr("class", "fold"); //dom이 로딩되면 다 접어서 닫아준다
		function unfoldFaq() {
			if ($(this).parent().parent("li").hasClass("unfold")) { //열려있으면
				$(this).parent().parent("li").removeClass("unfold").addClass(
						"fold"); //닫아주고
			} else { //닫혀있으면
				faqList.attr("class", "fold"); //다른 리스트는 닫아주고
				$(this).parent().parent("li").removeClass("fold").addClass(
						"unfold"); //클릭한 리스트는 열어준다
			}
		}
		faqList.find(">h4>a").click(unfoldFaq);

	});

	function previous() {
		location.href = "/";
	}
</script>
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


			<ul class="nav nav-tabs" style="background-color: #F3CA5A">
				<li><a href="#tab_1" data-toggle="tab">장바구니</a></li>
				<li><a href="#tab_2" data-toggle="tab">결제정보</a></li>
				<li><a href="#tab_3" data-toggle="tab">등록정보</a></li>
				<li><a href="#tab_4" data-toggle="tab">개인정보</a></li>


			</ul>
			<br>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1"
					style="background: #000000; background: rgba(0, 0, 0, 0);">

					<!-------- tab1 자리 --------->

					<div style="background: #000000; background: rgba(0, 0, 0, 0);">
						<h2>
							<font color="black">찜목록</font>
						</h2>
						<br> <br>

						<c:forEach items="${mList}" var="myBasketVO">
							<div class="basketList">
								<center>
									<img src="../resources/img/house/${myBasketVO.h_thumnail}"
										width="95%">
								</center>
								<div class="basketText">
									장바구니번호 : ${myBasketVO.b_no }<br> 집번호 : ${myBasketVO.h_no }<br>
									집종류 : ${myBasketVO.h_type }<br> 집유형 :
									${myBasketVO.h_livetype }<br>
								</div>
							</div>
						</c:forEach>


					</div>
				</div>


				<!-------- tab2 자리 --------->
				<div class="tab-pane" id="tab_2">

					<table class="table table-bordered">
						<tr style="color: black">
							<th>집 사진</th>
							<th>예약한 집번호</th>
							<th>지불한 금액</th>
							<th>예약한 날짜</th>
							<th>집 전화번호</th>
						</tr>


						<c:forEach items="${list}" var="basketVO">

							<tr style="color: black">
								<td>${basketVO.b_no}</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>

							</tr>

						</c:forEach>

					</table>
				</div>

				<!-------- tab3 자리 --------->
				<div class="tab-pane" id="tab_3">

					<table class="table table-bordered">
						<tr style="color: black">
							<th>예약한 사람</th>
							<th>전화번호</th>
							<th>예약한 날짜</th>
						</tr>


						<c:forEach items="${list}" var="basketVO">

							<tr style="color: black">
								<td>${basketVO.b_no}</td>
								<td></td>
								<td></td>
							</tr>

						</c:forEach>

					</table>
				</div>

				<!-------- tab4 자리 --------->
				<div class="tab-pane" id="tab_4"></div>

			</div>
		</div>

	</div>
</body>

</html>
