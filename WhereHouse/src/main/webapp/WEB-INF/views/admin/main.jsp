<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header>
<br>
<br>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<
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
					color="black">AdminPage</font>
			</h1>
			<hr>
 

			<ul class="nav nav-tabs" style="background-color: #F3CA5A">
				<li><a href="#tab_1" data-toggle="tab">회원관리</a></li>
				<li><a href="#tab_2" data-toggle="tab">집관리</a></li>
				<li><a href="#tab_3" data-toggle="tab">예약관리</a></li>
				<li><a href="#tab_4" data-toggle="tab">평점관리</a></li>
				<li><a href="#tab_4" data-toggle="tab">통계관리</a></li>


			</ul>
			<br>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1"
					style="background: #000000; background: rgba(0, 0, 0, 0);">

					<!-------- tab1 자리 --------->

					<div style="background: #000000; background: rgba(0, 0, 0, 0);">


						<table class="table">
							<tr>
								
								<th><font color="black">번호</font></th>
								<th><font color="black">아이디</font></th>
								<th><font color="black">이름</font></th>
								<th><font color="black">폰번호</font></th>
								<th><font color="black">가입일</font></th>
							</tr>
							<c:forEach items="${list}" var="memberVO">
								<tr>
									
									<td><font color="black">${memberVO.m_no}</font></td>
									<td><a href='/admin?m_no=${memberVO.m_no}'>${memberVO.m_id}</a></td>
									<td><font color="black">${memberVO.m_name}</font></td>
									<td><font color="black">${memberVO.m_phone}</font></td>
									<td><font color="black"><fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${memberVO.m_regdate}" /></font></td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<div align="center"></div>

				</div>


				<!-------- tab2 자리 --------->
				<div class="tab-pane" id="tab_2">

					<table class="table2">
						<tr>
							<th><font color="black">번호</font></th>
							<th><font color="black">아이디</font></th>
							<th><font color="black">주소</font></th>
							<th><font color="black">요금</font></th>
							<th><font color="black">예약일</font></th>
						</tr>
						<c:forEach items="${houselist}" var="houseVO">
							<tr>
								<td><font color="black">${houseVO.h_no}</font></td>
								<td>${houseVO.m_id}</td>
								<td><font color="black">${houseVO.h_address}</font></td>
								<td><font color="black">${houseVO.h_fare}</font></td>
								<td><font color="black"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${houseVO.h_startdate}" /></font></td>
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
								<td></td>
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
