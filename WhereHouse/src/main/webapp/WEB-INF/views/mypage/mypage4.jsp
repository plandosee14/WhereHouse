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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>

<body>
<div class="container">
<div class="row">
                <div class="col-md-12">
                    <div>
                    <!-- Classic Heading -->
                 <h1>
				<span class="glyphicon glyphicon-question-sign" style="color: blue"></span><font
					color="black">MyPage</font>
			</h1>
                   
                    <!-- Start Contact Form -->
                    <div id="contact-form" class="contatct-form">
                        <div class="loader"></div>
                        <form name="update" method="post">
                    
                            <div class="row" style="text-align: center">
                                <div class="col-md-3">
                                    <label for="userid">아이디<span class="required"></span></label>
                                    <input id="userid" name="userid" type="text" value="${member.m_id }" readonly="readonly" />                   
                                </div>
                            </div>
                            <div class="row" style="text-align: center">
                                <div class="col-md-3">
                                    <label for="name">회원번호<span class="required"></span></label>
                                    <input id="name" name="name" type="text" value="${member.m_no }" readonly="readonly"/>                   
                                </div>
                            </div>
                            <div class="row" style="text-align: center">
                                <div class="col-md-3">
                                    <label for="gender">이름<span class="required"></span></label>
                                    <input id="gender" name="gender" type="text" value="${member.m_name }" readonly="readonly"/>                   
                                </div>
                            </div>
                         
                            <div class="row" style="text-align: center">
                                <div class="col-md-3">
                                    <label for="e-mail">휴대폰번호<span class="required"></span></label>
                                    <input id="e-mail" name="email" type="text" value="${member.m_phone }" maxlength="20"  />
                                </div>
                                </div>
                     
                               

                            <div class="row">
                                    <input type="submit" name="submit" class="btn btn-danger btn-sm" value="수정하기" />
                                    <input type="button" name="reset" class="btn btn-danger btn-sm" id="pageback"  value="취소" />
                                </div>
                        
                        </form>    </div>
                    
                        
                    </div>
             
	

                </div>

            </div>
        </div>

    <!-- End content -->

</body>

</html>
