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
<script>
Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year + "/" + month + "/" + date;
});

var printData = function(commentArr, target, templateObject) {

	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(".commentLi").remove();
	target.after(html);

}

var h_no = ${HouseVO.h_no};

var commentPage = 1;

function getPage(pageInfo) {

	$.getJSON(pageInfo, function(data) {
		printData(data.list, $("#commentDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));

		$("#modifyModal").modal('hide');

	});
}

var printPaging = function(pageMaker, target) {

	var str = "";

	if (pageMaker.prev) {
		str += "<li><a href='" + (pageMaker.startPage - 1)
				+ "'> << </a></li>";
	}

	for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
		var strClass = pageMaker.cri.page == i ? 'class=active' : '';
		str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
	}

	if (pageMaker.next) {
		str += "<li><a href='" + (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
	}

	target.html(str);
};

$("#commentDiv").on("click", function() {

	if ($(".timeline li").size() > 1) {
		return;
	}
	getPage("/comment/" + h_no + "/1");

});

$(".pagination").on("click", "li a", function(event){
	
	event.preventDefault();
	
	commentPage = $(this).attr("href");
	
	getPage("/comment/"+h_no+"/"+commentPage);
	
});
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
	<ul class="timeline">
				<li class="time-label" id="commentDiv"><span class="bg-green">
						comment List </span></li>
			</ul>
			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>
	<script src="/resources/js/star.js"></script>
	<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<li class="commentLi" data-c_no={{c_no}}>
	<i class="fa fa-comments bg-blue"></i>
	 <div class="timeline-item" >
	  <span class="time">
	    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
	  </span>
	  <h3 class="timeline-header"><strong>{{c_no}}</strong> -{{commenter}}</h3>
	  <div class="timeline-body">{{commenttext}} </div>
  	  <div class="timeline-footer">
  	   <a class="btn btn-primary btn-xs" 
		    data-toggle="modal" data-target="#modifyModal">Modify</a>
    	</div>
	  </div>			
	</li>
	{{/each}}
	</script>
	</body>
</html>