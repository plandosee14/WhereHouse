<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header><%@include file="../header.jsp"%></header>
<header><%@include file="../mypageHeader.jsp"%></header>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* $(document).ready(function () {
		$('#pass').click(function() {
			alert($('#user_pass').val());
		});
}); */
		
		
		
</script>
</head>
<body>
<br><br><br>
<br><br><br>
<center>
	<h1>
		<i class="fa fa-question-circle"></i>
		<font color="black">비밀번호를 입력해주세요!</font>
	</h1>
<br><br>
<form action="/mypage/check2">
비밀번호 : <input type="password" name=m_pass id="user_pass" size="15"> 
<input class="btn btn-danger" type="submit" value=확인 id="pass">
</form>
</center>
</body>
</html>