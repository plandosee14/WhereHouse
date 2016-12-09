<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header>
<header><%@include file="../mypageHeader.jsp"%></header>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		
/* 		$('#estimate').click(function() {
			var m_score = $('#est_score').val();
			
			$.ajax({
				url : '/mypage/reginfoAjax',
				data : {"m_score":m_score},
				success : function(data){
					$('#alerttitle').html('회원평가');
			        $('#alertcontent').html('회원평가가 완료되었습니다.');
			        $('#alertModal').modal("show");
					/* window.location.replace("/mypage/reginfo"); 
				}
			});
		}); */
		
	

	});
	 var btn_off = function(r_no) {
		  //btn = document.getElementById('estimate'+r_no);
		  //btn.disabled = 'disabled';
		  //$('#estimate'+r_no).hide();
		  $('#abc_'+r_no).html('<font color=blue>평가되었습니다.</font>');
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
				<li><a href="/mypage/checkForm"> <i class="fa fa-pencil"></i> <span>회원정보
							수정</span>
				</a></li>
				<li><a href="/mypage/checkDelForm"> <i class="fa fa-trash"></i> <span>회원탈퇴</span></a>
				</li>
			</ul>
			</aside>

			<br>

			<table class="table table-bordered" style="text-align: center">
				<tr style="color: black; font-weight: bold; background-color: #C0C0C0">
					<td>집 사진</td>
					<td>예약한 ID(이름)</td>
					<td>전화번호</td>
					<td>예약한 날짜</td>
					<td>인원</td>
				</tr>


				<c:forEach items="${regList}" var="registerVO">

					<tr style="color: black">
						<td><img
							src="../resources/img/house/${registerVO.h_thumnail}"
							width="70px" height="50px"></td>
						<td>${registerVO.m_id}(${registerVO.m_name})</td>
						<td>${registerVO.m_phone}</td>
						<td>
						<fmt:formatDate value="${registerVO.r_startdate}" pattern="yyyy-MM-dd "/>~
						<fmt:formatDate value="${registerVO.r_enddate}" pattern="yyyy-MM-dd "/></td>
						<td>${registerVO.r_peoplecnt}</td>

					</tr>

				</c:forEach>

			</table>
			
			<br><br><br>
			
			<table class="table table-bordered" style="text-align: center">
				<tr style="color: black; font-weight: bold; background-color: #C0C0C0">
					<td>집 사진</td>
					<td>예약한 ID(이름)</td>
					<td>숙박 날짜</td>
					<td>평가</td>
				</tr>


				<c:forEach items="${estList}" var="estimateVO" varStatus="status">

					<tr style="color: black">
						<td>
							<img src="../resources/img/house/${estimateVO.h_thumnail}" width="70px" height="50px">
						</td>
						<td>${estimateVO.m_id}(${estimateVO.m_name})</td>
						<td>
						<fmt:formatDate value="${estimateVO.r_startdate}" pattern="yyyy-MM-dd "/>~
						<fmt:formatDate value="${estimateVO.r_enddate}" pattern="yyyy-MM-dd "/></td>
						<td id="abc_${estimateVO.r_no}">
						
						<select name="score" id="est_score${estimateVO.r_no}">
   						 <option selected value=3>-선택하세요-
    					 <option value=2>2
    					 <option value=1>1
    					 <option value=0>0
    					 <option value=-1>-1
    					 <option value=-2>-2
    					</select>
    						<input type="button" value="평가하기" id="estimate${estimateVO.r_no}" onclick="grade('${estimateVO.m_id}','${estimateVO.r_no}' )">
    					 <c:forEach items="${rList}" var="rno"> 
    						 <c:if test="${estimateVO.r_no ==rno}">	 
    						 				<!-- 함수호출 -->
    						 	<script type="text/javascript">
    						 	   btn_off(${rno});
    						 	
    						 	</script>
							 </c:if> 
						 </c:forEach> 
						</td>

					</tr>

				</c:forEach>

			</table>
			<c:forEach items="${rList}" var="rno">
			   ${rList}, 
			</c:forEach>
			
		</div>
	</div>

</body>
<script type="text/javascript">

function grade(m_id,r_no) {
	alert('쨘');
	var m_score = $('#est_score'+r_no).val();
	alert(m_score);
	
	$.ajax({
		url : '/mypage/reginfoAjax',
		data : {"m_score":m_score,
			    "m_id": m_id   ,
			    "r_no": r_no  
		},
		success : function(data){
			$('#alerttitle').html('회원평가');
	        $('#alertcontent').html('회원평가가 완료되었습니다.');
	        $('#alertModal').modal("show");
			/* window.location.replace("/mypage/reginfo"); */
		}
	});
};
</script>

</html>
