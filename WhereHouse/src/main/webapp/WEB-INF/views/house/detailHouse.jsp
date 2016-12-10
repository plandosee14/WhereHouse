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
				<c:if test="${m_id!=null}">
					<button type="button" id="addbasket">장바구니담기</button>
				</c:if>
			</div>
		</form>
	</div>  
	<div class="container-fluid">
	  <div class="row">
    	<div class="col-sm-2" style="background-color:lavender;border-right:2px solid #fff;">목록
    		<div style="height:200px;border-top:2px solid #fff;font-size:40px;">숙소</div>
    		<div style="border-top:2px solid #fff;font-size:40px;">편의사항</div>
    		<div style="border-top:2px solid #fff;font-size:40px;">평점</div>
    		<div style="border-top:2px solid #fff;font-size:40px;">후기</div>
    	</div>
    	<div class="col-sm-5" style="background-color:lavender;">항목
    		<div style="border-top:2px solid #fff;font-size:20px;">사는 사람</div>
    		<div style="border-top:2px solid #fff;font-size:20px;">사는 사람</div>
    		<div style="border-top:2px solid #fff;font-size:20px;">
    			<div id="Nwagon"></div>
				<c:if test="${checkGrade == 'true'}" >
				<font color="black" size="5">정확성</font>
				<span class="star-input">
			  		<span class="input">
			  			<c:forEach var="j" begin="1" end="10" step="1">
			    			<input type="radio" name="rightscore" id="p${j}" value="${j}"><label for="p${j}"><c:out value="${j}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-input"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">청결도</font>
				<span class="star-input2">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="cleanscore" id="s${i}" value="${i}"><label for="s${i}"><c:out value="${i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-input2"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">체크인</font>
				<span class="star-input3">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="checkscore" id="r${i}" value="${i}"><label for="r${i}"><c:out value="${i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-input3"><b>0</b>점</output>
				</span><br>
				<font color="black" size="5">커뮤니케이션</font>
				<span class="star-input4">
			  		<span class="input">
			  			<c:forEach var="i" begin="1" end="10" step="1">
			    			<input type="radio" name="commuscore" id="c${i}" value="${i}"><label for="c${i}"><c:out value="${i}"/></label>
			    		</c:forEach>
			  		</span>
			  		<output for="star-input4"><b>0</b>점</output>
				</span>
				<button type="button" id="bt_grade">평점 입력</button>
				</c:if>     
			</div>
			<div style="border-top:2px solid #fff;font-size:20px;">
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
	<link rel="stylesheet" href="/resources/css/Nwagon.css" type="text/css">
	<script src="/resources/js/Nwagon.js"></script>
	<script src="/resources/js/star.js"></script>
	<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<li class="commentLi" data-c_no={{c_no}}>
	 <div class="timeline-item" >
	  <span class="time">
		{{prettifyDate c_regdate}}
	  </span>
	  <h3 class="timeline-header"> -{{m_name}}</h3>
	  <div class="timeline-body">{{c_content}} </div>
  	  <div class="timeline-footer">
		{{#eqCommenter m_name}}
  	   <a class="bt btn-primary btn-xs" 
		    data-toggle="modal" data-target="#modifyModal">Modify</a>
	{{/eqCommenter}}
      </div>
	  </div>			
	</li>
	{{/each}}
	</script>
	<script>
	
	Handlebars.registerHelper("eqCommenter",function(commenter, block){
		var accum = '';
		if(commenter == '${m_name}'){
			accum += block.fn();
		}
		return accum;
	});
	
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
	
/* 	var printPaging = function(pageMaker, target) {

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
	}; */
	
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

	$("#addbasket").on("click",function(){
		alert(h_no);
		$.ajax({
			type:'post',
			url:'/baskets/insert',
			 /* headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" 
			     },  */
			data: {"h_no":h_no},
			success:function(result){
				if(result == 'SUCCESS'){
					location.reload();
				}
			}
		});
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

	var h_no = ${houseVO.h_no};
	$("#bt_grade").on("click",function(){
		
		var pscore = $(':radio[name="rightscore"]:checked').val();
		var sscore = $(':radio[name="cleanscore"]:checked').val();
		var rscore = $(':radio[name="checkscore"]:checked').val();
		var cscore = $(':radio[name="commuscore"]:checked').val();
		$.ajax({
	      		url:"/grades/insert",
	            type: "post",
	            data:{
	            	h_no : h_no,
	            	g_rightscore : pscore,
	            	g_cleanscore : sscore,
	            	g_checkscore : rscore,
	            	g_commuscore : cscore
	            },
	            success:function(result){
	            	if (result == "success") {
		                  location.reload();
				}else {
					  $('#alerttitle').html('실패');
	                  $('#alertcontent').html('ID, Passwor.');
	                  $('#alertModal').modal("show");
				}
	            }
	      	})
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
	
	if(${houseVO.h_scorecnt != 0}){
		var rightscore = (${houseVO.h_rightscore}*10/${houseVO.h_scorecnt});
		var cleanscore = (${houseVO.h_cleanscore}*10/${houseVO.h_scorecnt});
		var checkscore = (${houseVO.h_checkscore}*10/${houseVO.h_scorecnt});
		var commuscore = (${houseVO.h_commuscore}*10/${houseVO.h_scorecnt});
	}else{
		var rightscore = 0;
		var cleanscore = 0;
		var checkscore = 0;
		var commuscore = 0;
	}
	var options = {
			'legend':{
				names: [
				'정확성',
				'청결도',
				'체크인',
				'커뮤니케이션',
			]
		},
		'dataset': {
			title: 'Web accessibility status',
			values: [[rightscore,cleanscore,checkscore,commuscore]],
			bgColor: '#f9f9f9',
			fgColor: '#808080',
		},
		'chartDiv': 'Nwagon',
		'chartType': 'radar',
		'chartSize': { width: 600, height: 300 }
	};
	Nwagon.chart(options);
	</script>
	</body>
</html>