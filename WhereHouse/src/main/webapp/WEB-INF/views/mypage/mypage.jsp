<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <header><%@include file="../header.jsp" %></header><br><br>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #faq_list {border-bottom:1px solid #ccc}
 #faq_list li {border-top:1px solid #ccc; padding:0 5px}
 #faq_list li h4 a {display:block; padding:8px}
 #faq_list li p {border-top:1px dotted #eaeaea; padding:8px; line-height:18px}
 #faq_list li.unfold h4 a {font-weight:bold}
 #faq_list li.fold p {display:none}
 </style>


 <script type="text/javascript">

 jQuery(function($){
 	$('textarea').css({'height':'100%','width':'100%'});
  var faqList = $("#faq_list>li"); //리스트를 변수로 저장
 faqList.attr("class","fold"); //dom이 로딩되면 다 접어서 닫아준다
 function unfoldFaq(){
   if($(this).parent().parent("li").hasClass("unfold")){ //열려있으면
    $(this).parent().parent("li").removeClass("unfold").addClass("fold"); //닫아주고
  } else { //닫혀있으면
   faqList.attr("class","fold"); //다른 리스트는 닫아주고
   $(this).parent().parent("li").removeClass("fold").addClass("unfold"); //클릭한 리스트는 열어준다
  }
  }
  faqList.find(">h4>a").click(unfoldFaq);
  
  
 });
 
 function previous(){
	 location.href="./faq_list.ok?page=1";
 }
 
 
 
 
 </script>
</head>

<body>
<!-- Custom Tabs -->

<div class="nav-tabs-custom">

<h1><span class="glyphicon glyphicon-question-sign" style="color: blue"></span><font color="black">MyPage</font></h1><hr>
       
          
	<ul class="nav nav-tabs" style="background-color: #F3CA5A">
		<li><a href="#tab_1" data-toggle="tab">장바구니</a></li>
		<li><a href="#tab_2" data-toggle="tab">결제정보</a></li>
		<li><a href="#tab_3" data-toggle="tab">등록정보</a></li>
		<li><a href="#tab_4" data-toggle="tab">개인정보</a></li>

		<li class="pull-right"><h4><font color="black">${page}페이지/${pageCount}페이지</font></h4></li>
	</ul>
	<br>
	<div class="tab-content">
		<div class="tab-pane active" id="tab_1" style="background:#000000;background:rgba(0,0,0,0);">
			
			<!-------- tab1 자리 --------->
	 
<div style="background:#000000;background:rgba(0,0,0,0);">

<ul id="faq_list" style="background:#000000;background:rgba(0,0,0,0);">
<c:forEach items="${list}" var="v">
  <li style="background:#000000;background:rgba(0,0,0,0);">
      <h4><a href="#a1">장바구니 목록</a></h4>
         <p>
         <c:if test="${v.b_no }">
  		<img  src="./img/${v.m_id }"><br>
  		</c:if>
         <textarea disabled="disabled" style="border:0;background-color:transparent">${v.contents }</textarea></p>
     </li>
   </c:forEach>
 </ul>
 </div>
 <div align="center">

</div>
			
		</div>


			<!-------- tab2 자리 --------->
		<div class="tab-pane" id="tab_2">

<ul id="faq_list" >
<c:forEach items="${list }" var="v">
	<c:if test="${v.options=='game' }">
  <li>
      <h4><a href="#a1">${v.subject }</a></h4>
         <p>
         <c:if test="${v.fileName!=null }">
  		<img  src="./img/${v.fileName }"><br>
  		</c:if>
         <textarea disabled="disabled" style="border:0;background-color:transparent">${v.contents }</textarea></p>
     </li>
     </c:if>
   </c:forEach>
 </ul>
		</div>

			<!-------- tab3 자리 --------->
		<div class="tab-pane" id="tab_3">
	
	<ul id="faq_list" >
<c:forEach items="${list }" var="v">
	<c:if test="${v.options=='excute' }">
  <li>
      <h4><a href="#a1">${v.subject }</a></h4>
         <p>
         <c:if test="${v.fileName!=null }">
  		<img  src="./img/${v.fileName }"><br>
  		</c:if>
         <textarea disabled="disabled" style="border:0;background-color:transparent">${v.contents }</textarea></p>
     </li>
     </c:if>
 </c:forEach>
 </ul>
	
	
	
	
		</div>

			<!-------- tab4 자리 --------->
		<div class="tab-pane" id="tab_4">

<ul id="faq_list" >
<c:forEach items="${list }" var="v">
	<c:if test="${v.options=='graphic' }">
  <li>
      <h4><a href="#a1">${v.subject }</a></h4>
         <p>
         <c:if test="${v.fileName!=null }">
  		<img  src="./img/${v.fileName }"><br>
  		</c:if>
         <textarea disabled="disabled" style="border:0;background-color:transparent">${v.contents }</textarea></p>
     </li>
     </c:if>
   </c:forEach>
 </ul>

</div>

	</div>
</div>
<div align="center">
<nav>
  <ul class="pagination pagination-lg">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	
    <li>
    	<c:forEach  begin="1"  end="${pageCount }" var="i">
    	<a href="faq_list.ok?page=${i}">${i }</a>
    	</c:forEach>
    </li>
    

    
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</div>
<form action="./faq_create.ok"  >
	<div align="right">
	<input class="btn btn-info" type="button" value="처음으로" onclick="previous()">
	<c:if test="${currentNickName=='관리자'}">
	<input class="btn btn-warning" type="submit" value="글등록">
	</c:if>
	</div>
</form>



</body>

</html>
              