<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/resources/css/rsvForm.css" />
<title>예약</title>
<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
	jQuery(function($) {

		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)',
					'5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)', '9월(SEP)',
					'10월(OCT)', '11월(NOV)', '12월(DEC)' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			showMonthAfterYear : true,
			yearSuffix : ''
		};

		$.datepicker.setDefaults($.datepicker.regional['ko']);

		$('.r_startdate').datepicker({
			showOn : 'both',
			buttonText : "달력",
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			yearRange : 'c-99:c+99',
			constrainInput : true,
			maxDate : '+1y',
			beforeShowDay : disableAllTheseDays
		});

	});

	// 특정날짜들 배열

	var disabledDays = $
	{
		dateList
	};
	var startDay = $
	{
		startDate
	}; //string
	var syear = startDay.substr(0, 4);
	var smonth = startDay.substr(5, 2);
	var sday = startDay.substr(8, 2);

	var endDay = $
	{
		endDate
	};
	var eyear = endDay.substr(0, 4);
	var emonth = endDay.substr(5, 2);
	var eday = endDay.substr(8, 2);

	//alert(typeof(disabledDays[0]));
	alert(typeof (syear) + syear);
	alert(typeof (smonth) + smonth);
	alert(typeof (sday) + sday);

	function disableAllTheseDays(date) {

		var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();

		for (i = 0; i < disabledDays.length; i++) {

			if (($.inArray(y + '-' + (m + 1) + '-' + d, disabledDays) != -1)
					|| (date > new Date(eyear, emonth - 1, eday))
					|| (date < new Date(syear, smonth - 1, sday))) {

				return [ false ];

			}

		}

		return [ true ];

	}
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	
	<center>
	<table width=80% align=center>
		<tr>
			<td width=50%>
				<div class="container_ctn">
					<input type="hidden" name="m_id" value=${m_id}>
					<div class="font1" style="margin-bottom:15px;">결재수단</div>
					<div class="contentList"><div class="contentList Title">카드번호 : </div>
						<input type="text"></div>
					<div class="contentList"><div class="contentList Title">만료일 : </div>
						<input type="text"></div>
					<div class="contentList"><div class="contentList Title">보안코드 : </div>
						<input type="text"></div>
					<div class="contentList"><div class="contentList Title">결제자이름 : </div>
						<input type="text"></div>
					<div class="contentList"><div class="contentList Title">우편번호 : </div>
						<input type="text"></div>
				</div>
			</td>
			<td width=50%>
				<div class="container_ctn">
				<form action="/reservation">
					<div class="font1">${houseVO.h_title} 집</div>
					<div align="center" style="width:100%; min-height: 150px; border:1px dotted black;">
						<img alt="" src="/resource/img./house/${houseVO.h_thumnail}" width="200"></div>
					<p>
						<input type="hidden" name="${m_id}"> 
						<input type="hidden" name="${houseVO.h_no}"> 
						<input type="hidden" name="${m_id}"> 
						<div class="contentList"><div class="contentList Title">체크인 : </div>
						<input type="text" name="rstartdate" class="r_startdate" value="${r_startdate}" 
								style="border: 1px solid #ccc"></div>
					</p>
					<p>
						<div class="contentList"><div class="contentList Title">체크아웃 : </div>
						<input type="text" name="renddate" class="r_startdate" value="${r_enddate}" 
								style="border:1px solid #ccc"></div>
					</p>
					<div class="contentList"><div class="contentList Title">인원 : </div>
					<select name="r_peoplecnt">
						<c:forEach begin="1" end="${houseVO.h_peoplecnt}" varStatus="status">
							<c:if test="${status.index==r_peoplecnt}">
								<option selected="selected">${status.index}</option>
							</c:if>
							<c:if test="${status.index!=r_peoplecnt}">
								<option>${status.index}</option>
							</c:if>
						</c:forEach>
   					</select></div>
					<div class="contentList"><div class="contentList Title">1박 가격 : </div>${houseVO.h_fare} 원/1박</div>
					<input type="hidden" name="r_fare" value="${houseVO.h_fare}">
					<div id="price"></div>
					<input type="submit" class="submitBtn btn_confirm" value="결재완료" align="middle">
				 </form>
				</div>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>