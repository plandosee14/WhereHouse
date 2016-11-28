<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp" %></header>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<script type="text/javascript" src="/resources/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
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

</style>
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
<body data-spy="scroll" data-target=".navbar">
	<br><br><br>
	<div id="album">
		<img id="back" src="/resources/screenshot/seoul.jpg" width="94%">
	</div>
	<div id="reserve">
		<img class="floating" src="/resources/screenshot/busan.jpg">
	</div>
	<div id="textb">
		<textarea rows="100px" cols="110px" color="black">dlfkl;sjdkafpoasdjkoasd</textarea>
	</div>
</body>
</html>