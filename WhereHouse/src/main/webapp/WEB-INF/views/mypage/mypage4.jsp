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
			<h3>개인정보 수정 및 탈퇴</h3>
			<br>
			


                    <div id="contact-form" class="contatct-form">
                        <div class="loader"></div>
                        <form name="update" method="post">
                    
                            <div class="row" style="text-align: center">
                                <div class="col-md-3">
                                    <label for="m_id">아이디<span class="required"></span></label>
                                    <input id="m_id" name="m_id" type="text" value="${member.m_id }" readonly="readonly" />                   
                                </div>
                            </div>
                            <div class="row" style="text-align: center">
                                <div class="col-md-3">
                                    <label for="m_no">회원번호<span class="required"></span></label>
                                    <input id="m_no" name="m_no" type="text" value="${member.m_no }" readonly="readonly"/>                   
                                </div>
                            </div>
                            <div class="row" style="text-align: center">
                                <div class="col-md-3">
                                    <label for="m_name">이름<span class="required"></span></label>
                                    <input id="m_name" name="m_name" type="text" value="${member.m_name }" readonly="readonly"/>                   
                                </div>
                            </div>
                         
                            <div class="row" style="text-align: center">
                                <div class="col-md-3">
                                    <label for="m_phone">휴대폰<span class="required"></span></label>
                                    <input id="m_phone" name="m_phone" type="text" value="${member.m_phone }" maxlength="20"  />
                                </div>
                            </div>
                     
                               

                            <div class="row">
                                    <input type="submit" name="submit" class="btn btn-danger btn-sm" value="수정하기" />
                                    <input type="button" name="reset" class="btn btn-danger btn-sm" id="pageback"  value="취소" />
                                </div>
                        
                        </form>    
                      </div>			


	
					
			</div>
		</div>

</body>

</html>
