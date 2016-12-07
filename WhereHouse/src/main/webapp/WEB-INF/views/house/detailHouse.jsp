<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<%@include file="../header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
	width:90%;
	max-height: 450px;
}
#reserve {
	position: fixed;
	top:460px;
	width:30px;
	right:33%;
	padding-top:60px;
	z-index: 10;
}

#reserve>#reserveform>#reservediv {
	width:1350%;
}

#textb{
	top:450px;
}

textarea{
	color:black;
}

.text-cente{
	margin: 0 0 0 5%;
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
		<img id="back" src="/resources/screenshot/seoul.jpg">
	</div>
	<div id="reserve">
		<form id="reserveform">
			<div id="reservediv" style="border:1px solid red;height:600px">
				<input type="hidden" value="${m_id}" name="m_id">
				<input type="hidden" value="${h_no}" name="h_no">
				<button type="button" id="reservation" class="reservation">예약하기</button>
			</div>
		</form>
	</div>
	<div id="textb">
		<textarea rows="100px" cols="110px">dlfklsjdkafpoasdjkoasd</textarea>
	</div>
	
	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div>
					<h3>평점</h3>
				</div>
				<div class="box-header">
					<h3 class="box-title">후기</h3>
				</div>
				<font color="black" size="5">총점</font>
				<span class="star-output1">
			  		<span class="input">
			  			<c:forEach var="j" begin="1" end="10" step="1">
			    			<input type="radio" name="avgscore" id="a${j}" value="${house.h_avgscore/(5*house.h_scorecnt)}"><label for="a${j}"><c:out value="${0.5*j}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-output"><b>0</b>점</output>
				</span><br>				
				<font color="black" size="5">정확성</font>
				<span class="star-output1">
			  		<span class="input">
			  			<c:forEach var="j" begin="1" end="10" step="1">
			    			<input type="radio" name="rightscore" id="q${j}" value="${j}"><label for="q${j}"><c:out value="${0.5*j}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-output"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">청결도</font>
				<span class="star-output2">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="cleanscore" id="w${i}" value="${i}"><label for="w${i}"><c:out value="${0.5*i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-output2"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">체크인</font>
				<span class="star-output3">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="checkscore" id="e${i}" value="${i}"><label for="e${i}"><c:out value="${0.5*i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-output3"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">커뮤니케이션</font>
				<span class="star-output4">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="commuscore" id="f${i}" value="${i}"><label for="f${i}"><c:out value="${0.5*i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-output4"><b>0</b>점</output>
				</span>
				<c:if test="${checkGrade == 'true'}" >
				<font color="black" size="5">정확성</font>
				<span class="star-input">
			  		<span class="input">
			  			<c:forEach var="j" begin="1" end="10" step="1">
			    			<input type="radio" name="rightscore" id="p${j}" value="${j}"><label for="p${j}"><c:out value="${0.5*j}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-input"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">청결도</font>
				<span class="star-input2">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="cleanscore" id="s${i}" value="${i}"><label for="s${i}"><c:out value="${0.5*i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-input2"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">체크인</font>
				<span class="star-input3">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="checkscore" id="r${i}" value="${i}"><label for="r${i}"><c:out value="${0.5*i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-input3"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">커뮤니케이션</font>
				<span class="star-input4">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="commuscore" id="c${i}" value="${i}"><label for="c${i}"><c:out value="${0.5*i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-input4"><b>0</b>점</output>
				</span>
				<button type="button" id="bt_grade">평점 입력</button>
			</c:if>     
			<c:if test="${m_id != null}"> 
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label><br>
					<input class="form-controll" type="text" value="${m_name }" id="newCommentWriter" size="90%" readonly="readonly"><br> 
					<label for="exampleInputEmail1">Comment Text</label> <br>
					<input class="form-controll" type="text" placeholder="Comment TEXT" id="newCommentText" size="90%">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="bt btn-primary" id="commentAddBtn">ADD COMMENT</button>
				</div>
			</div>
			</c:if>
			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="commentDiv"></li>
			</ul>

			<div class='text-cente'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>
			</div>
		</div>
		
          
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="commenttext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="commentModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="commentDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
	
	<script src="/resources/js/star.js"></script>
	<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<li class="commentLi" data-c_no={{c_no}}>
	 <div class="timeline-item" >
	  <span class="time">
		{{prettifyDate c_regdate}}
	  </span>
	  <h3 class="timeline-header"><strong>{{c_no}}</strong> -{{m_name}}</h3>
	  <div class="timeline-body">{{c_content}} </div>
  	  <div class="timeline-footer">
  	   <a class="bt btn-primary btn-xs" 
		    data-toggle="modal" data-target="#modifyModal">Modify</a>
    	</div>
	  </div>			
	</li>
	{{/each}}
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
	
		var html = template(commentArr);
		$(".commentLi").remove();
		target.html(html);
	
	}
	var h_no = ${houseVO.h_no};
	var commentPage = 3;
	
	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#commentDiv"), $('#template'));
			printPaging2(data.pageMaker, $(".pagination"));
	 
			$("#modifyModal").modal('hide');
	 
		});
	}
	
	var printPaging2 = function(pageMaker, target) {
		var str="";
		var more=pageMaker.cri.perPageNum;
		str += "<li><a href='"+(more+3)+"'>"+'더보기'+"</a></li>  <li><a href='"+3+"'>"+ '원상태로'+"</a></li>";
		target.html(str);
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
	
	getPage("/comments/" + h_no+"/3");
	/*  $("#commentDiv").on("click", function() {
		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/comments/" + h_no+"/1");
	
	});
	  */
	
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		commentPage = $(this).attr("href");
		
		getPage("/comments/"+h_no+"/"+commentPage);
		
	});


	$("#commentAddBtn").on("click",function(){
		 
		 var commenterObj = $("#newCommentWriter");
		 var commenttextObj = $("#newCommentText");
		 var commenter = commenterObj.val();
		 var commenttext = commenttextObj.val();
		
		  
		  $.ajax({
				type:'post',
				url:'/comments/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({h_no:h_no, m_name:commenter, c_content:commenttext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						commentPage = 1;
						getPage("/comments/"+h_no+"/"+commentPage );
						commenterObj.val("");
						commenttextObj.val("");
					}
			}});
	});

	$(".timeline").on("click", ".commentLi", function(event){
		
		var comment = $(this);
		
		$("#commenttext").val(comment.find('.timeline-body').text());
		$(".modal-title").html(comment.attr("data-c_no"));
		
	});
	
	

	$("#commentModBtn").on("click",function(){
		  
		  var c_no = $(".modal-title").html();
		  var commenttext = $("#commenttext").val();
		  
		  $.ajax({
				type:'put',
				url:'/comments/'+c_no,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({c_content:commenttext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/comments/"+h_no+"/"+commentPage );
					}
			}});
	});

	$("#bt_grade").on("click",function(){
		var g_rightObj = $("input[name=rightscore]");
		var g_cleanObj = $("input[name=cleanscore]");
		var g_checkObj = $("input[name=checkscore]");
		var g_commuObj = $("input[name=commuscore]");
		var g_right = g_rightObj.val();
		var g_clean = g_cleanObj.val();
		var g_check = g_checkObj.val();
		var g_commu = g_commuObj.val();
			$.ajax({
				type:'put',
				url:'/grades/',
				headers: {
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({h_no=h_no, g_rightscore=g_right, g_cleanscore=g_clean, g_checkscore=g_check, g_commuscore=g_commu}),
				dataType:'text',
				success:function(result){
					if(result=='SUCCESS'){
						getPage("/grades/"+h_no);
						g_rightObj.val("");
						g_cleanObj.val("");
						g_checkObj.val("");
						g_commuObj.val("");
					}
				}
			});
	});

	$("#commentDelBtn").on("click",function(){
		  
		  var c_no = $(".modal-title").html();
		  var commenttext = $("#commenttext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/comments/'+c_no,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/comments/"+h_no+"/"+commentPage );
					}
			}});
		});
		
	</script>
	</body>
</html>