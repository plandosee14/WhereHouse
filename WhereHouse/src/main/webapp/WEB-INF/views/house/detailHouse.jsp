<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<%@include file="../header.jsp" %>
<style type="text/css">
html, body {
 margin-left: 40px;
 margin-top: 0px;
 margin-right: 40px;
 margin-bottom: 0px;
}
#album{
	top:0px;
	left:0px;
	height:450px;
	
}
#album #back{
	top: 0px;
	left: 0px;
	max-height: 450px;
}
#reserve {
	position: fixed;
	top:460px;
	width:30px;
	right:33%;
	padding-top:60px;
}

#textb{
	top:450px;
}

textarea{
	color:black;
}

</style>
<link rel="stylesheet" href="/resources/css/star.css" />
<script>
	var currentScrollTop = 0;
	window.onload = function() {
		scrollController();
		$(window).on('scroll', function(){
			scrollController();
		});
	}
	
	function scrollController(){
		currentScrollTop = $(window).scrollTop();
		if(currentScrollTop < 450) {
			$('#album').css('top', -(currentScrollTop));
			$('#reserve').css('top', 450-(currentScrollTop));
			if($('#reserve').hasClass('fixed')){
				$('#reserve').removeClass('fixed');
			}
		}else {
			if(!$('#reserve').hasClass('fixed')){
					$('#album').css('top', -450);
					$('#reserve').css('top', 0);
					$('#reserve').addClass('fixed');
			}
			
		}
	}
</script>
</head>
<body>
	<br><br><br>
	<div id="album">
		<img id="back" src="/resources/screenshot/seoul.jpg" width="94%">
	</div>
	<div id="reserve">
		<img class="floating" src="/resources/screenshot/busan.jpg">
	</div>
	<div id="textb">
		<textarea rows="100px" cols="110px">dlfklsjdkafpoasdjkoasd</textarea>
	</div>
	<font color="black" size="5">청결도</font>
	<span class="star-input">
  		<span class="input">
  			<c:forEach var="i" begin="1" end="10" step="1">
    		<input type="radio" name="star-input" id="p${i}" value="${i}"><label for="p${i}"><c:out value="${0.5*i}"/></label>
    		</c:forEach>
  		</span>
  		<output for="star-input"><b>0</b>점</output>
	</span>
	<font color="black" size="5">커뮤니케이션</font>
	<span class="star-input2">
  		<span class="input">
  			<c:forEach var="i" begin="1" end="10" step="1">
    			<input type="radio" name="star-input2" id="s${i}" value="${i}"><label for="s${i}"><c:out value="${0.5*i}"/></label>
    		</c:forEach>
  		</span>
  		<output for="star-input2"><b>0</b>점</output>
	</span>
	<script src="/resources/js/star.js"></script>
	</body>
</html>