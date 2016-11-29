<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include><br>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원관리
	<table class="table">
		<tr>
			<th><font color="black">번호</font></th>
			<th><font color="black">아이디</font></th>
			<th><font color="black">이름</font></th>
			<th><font color="black">폰번호</font></th>
			<th><font color="black">가입일</font></th>
		</tr>
		<c:forEach items="${memberlist}" var="memberVO">
			<tr>
				<td><font color="black">${memberVO.m_no}</font></td>
				<td><a href='/admin?m_no=${memberVO.m_no}'>${memberVO.m_id}</a></td>
				<td><font color="black">${memberVO.m_name}</font></td>
				<td><font color="black">${memberVO.m_phone}</font></td>
				<td><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${memberVO.m_regdate}" /></font></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>