<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<%@include file="../header.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="/resources/css/detail.css" />
<link rel="stylesheet" href="/resources/css/star.css" />
<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
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

<script type="text/javascript">
var disabledDays = ${dateList};
var startDay = ${startDate}; //string
var syear = startDay.substr(0,4);
var smonth = startDay.substr(5,2);
var sday = startDay.substr(8,2);

var endDay = ${endDate};
var eyear = endDay.substr(0,4);
var emonth = endDay.substr(5,2);
var eday = endDay.substr(8,2);


jQuery(function($){

    $.datepicker.regional['ko'] = {closeText: '닫기',prevText: '이전달',nextText: '다음달',currentText: '오늘',monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],weekHeader: 'Wk',dateFormat: 'yy-mm-dd',firstDay: 0,isRTL: false,showMonthAfterYear: true,yearSuffix: ''};

    $.datepicker.setDefaults($.datepicker.regional['ko']);

    $('.r_startdate').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: disableAllTheseDays   });

});
// 특정날짜들 배열




alert(typeof(syear)+syear);
alert(typeof(smonth)+smonth);
alert(typeof(sday)+sday); 

function disableAllTheseDays(date) {

    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();

    for (i = 0; i < disabledDays.length; i++) {

        if(($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1)||(date >new Date(eyear,emonth-1,eday))||(date <new Date(syear,smonth-1,sday))) {

            return [false];

        }

    }
    if((date >new Date(eyear,emonth-1,eday))||(date <new Date(syear,smonth-1,sday)))
    	return [false];

    return [true];

}
</script>

</head>
<body>
	<br><br><br>
	<div id="album">
		<img id="back" src="../resources/img/house/${houseVO.h_thumnail}">
	</div>
	<div id="reserve">
		<form id="reserveform" action="reservationForm">
			<div id="reservediv" style="border:1px solid gray; background-color: lavender;">
				<input type="hidden" value="${m_id}" name="m_id">
				<input type="hidden" value="${h_no}" name="h_no">
				
				<div class="font_price">${houseVO.h_fare} 원/1박</div>
				<div class="contentList"><div class="contentList Title">체크인 : </div>
				<input type="text" name="date1" class="r_startdate"  value=""  style="border:1px solid #ccc; width: 50%;">
				</div>
				<div class="contentList"><div class="contentList Title">체크아웃 : </div>
				<input type="text" name="date1" class="r_startdate"  value=""  style="border:1px solid #ccc ; width: 50%; float:left;">
				</div>
				
				<div class="contentList"><div class="contentList Title">인원 : </div> 
				<select>
					<c:forEach begin="1" end="${houseVO.h_peoplecnt}" varStatus="status">
					<option>${status.index}</option>
					</c:forEach>
   				</select> 명
				</div>
				
					<div align="center">
						<input type="submit" id="reservation" class="reservation" value="예약하기">
						<c:if test="${m_id!=null}">
							<button type="button" id="addbasket" style="margin-left: 30px;">장바구니담기</button>
						</c:if>
					</div>
				</div>
		</form>
	</div>  
<div style="float:left; width:60%; border:1px solid gray; background-color:lavender;">
	<div><!-- 항목 모음 Div -->
		<div class="categoryTitle"><!--항목명  -->
			<span>숙소</span>
		</div>
		<div class="categorySub">
			<div class="subContent"><!-- 좌측 항목 -->
				<div>
					<span>숙소 유형 : </span>
					<span>${houseVO.h_type }</span>
				</div>
				<div>
					<span>숙소 방의 수 : </span>
					<span>${houseVO.h_livetype }</span>
				</div>				
				<div>
					<span>입실 가능 날짜 : </span>
					<span>${houseVO.h_startdate }</span>
				</div>
				<div>
					<span>체크 인 아웃 시간 : </span>
					<span>${houseVO.h_checktime }</span>
				</div>
			</div>
			<div class="subContent"><!-- 우측 항목 -->
				<div>
					<span>숙박 가능 인원 수 : </span>
					<span>${houseVO.h_peoplecnt }</span>
				</div>
				<div>
					<span>숙박 가격 : </span>
					<span>${houseVO.h_fare }</span>
				</div>
				<div>
					<span>퇴실 날짜 : </span>
					<span>${houseVO.h_enddate }</span>
				</div>
			</div>
		</div>
	</div>
	
	<div><!-- 항목 모음 Div -->
		<div class="categoryTitle"><!--항목명  -->
			<span>편의사항</span>
		</div>
		<div class="categorySub">
				<div>
				<c:forEach items="${oList}" var="houseOptionVO">
				<c:if test="${houseOptionVO=='o_air'}">
				  에어컨
				</c:if>
				<c:if test="${houseOptionVO=='o_kitchen'}">
				  주방
				</c:if>
				<c:if test="${houseOptionVO=='o_park'}">
				  주차장
				</c:if>
				<c:if test="${houseOptionVO=='o_smoke'}">
				  흡연
				</c:if>
				<c:if test="${houseOptionVO=='o_washer'}">
				  세탁기
				</c:if>
				<c:if test="${houseOptionVO=='o_cook'}">
				  조리도구
				</c:if>
				<c:if test="${houseOptionVO=='o_toiletries'}">
				  세면도구
				</c:if>
				<c:if test="${houseOptionVO=='o_tv'}">
				  tv
				</c:if>
				<c:if test="${houseOptionVO=='o_wifi'}">
				  와이파이
				</c:if>
				</c:forEach>
				</div>
		</div>
	</div>
	<div><!-- 항목 모음 Div -->
		<div class="categoryTitle"><!--항목명  -->
			<span>판매자</span>
		</div>
		<div class="categorySub">
			<div class="subContent"><!-- 좌측 항목 -->
				<div>
					<span>판매자 이름 : </span>
					<span>${houseVO.m_name }</span>
				</div>
				<div>
					<span>판매자 전화번호 : </span>
					<span>${houseVO.m_phone }</span>
				</div>
			</div>
			<div class="subContent"><!-- 우측 항목 -->
				<div>
					<span>판매자 이메일 주소 : </span>
					<span>${houseVO.m_id}</span>
				</div>
				<div>
					<span>주소 : </span>
					<span>${houseVO.h_address}</span>
				</div>
			</div>
		</div>
	</div>
	<div><!-- 항목 모음 Div -->
		<div class="categoryTitle"><!--항목명  -->
			<span>이용 규칙</span>
		</div>
		<div class="categorySub">
				<div>
					<span>${houseVO.h_rule }</span>
				</div>
		</div>
	</div>
	<div><!-- 항목 모음 Div -->
		<div class="categoryTitle"><!--항목명  -->
			<span>소개</span>
		</div>
		<div class="categorySub">
				<div>
					<span>${houseVO.h_info }</span>
				</div>
		</div>
	</div>
	
	<div><!-- 항목 모음 Div -->
		<div class="categoryTitle"><!--항목명  -->
			<span>평점</span>
		</div>
		<div class="categorySub">
			<!-- 그래프 -->
			<div>
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
		</div>
	</div>
	
	<div><!-- 항목 모음 Div -->
		<div class="categoryTitle"><!--항목명  -->
			<span>후기</span>
		</div>
		<div class="categorySub">
			<!-- 댓글 리스트 -->
			<div>
				<c:if test="${m_id != null}"> 
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label><br>
					<input class="form-controll" type="text" value="${m_name }" id="newCommentWriter" size="60%" readonly="readonly"><br> 
					<label for="exampleInputEmail1">Comment Text</label> <br>
					<input class="form-controll" type="text" placeholder="Comment TEXT" id="newCommentText" size="60%">
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
<div id="map"
		style="height:60%;width:60%;position: fixed;"></div>	

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
	<script type="text/javascript"
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3xicslxG92qCXj6ltH4xrVW96C5OhSIE&signed_in=true&callback=initMap" async defer></script>	
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
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 18,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center : {
				lat : ${houseVO.h_pi_x},
				lng : ${houseVO.h_pi_y}
			}
		});
		var geocoder = new google.maps.Geocoder();

	var mylocationimage = '/resources/img/house/mylocation.png';
	markergps = new google.maps.Marker(
			{
				map : map,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				position : {
					lat : ${houseVO.h_pi_x},
					lng : ${houseVO.h_pi_y}
				},
				title : '${houseVO.h_title}',
				icon : mylocationimage,
				animation : google.maps.Animation.DROP,
			});
	}


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
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	</body>

</html>