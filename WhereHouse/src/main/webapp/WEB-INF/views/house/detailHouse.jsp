<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$('[data-spy="scroll"]').each(function(){
			var $spy = $(this);
			$spy.scrollspy($spy.data());
		});
	});
</script>
</head>
<body data-spy="scroll" data-target=".navbar">
	<div>
		<img src="/resources/screenshot/seoul.jpg" width="100%" height="450">
	</div>
	
</body>
</html>