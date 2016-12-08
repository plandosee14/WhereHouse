<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../header.jsp" %>
<title>예약</title>
<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
<script type="text/javascript">
jQuery(function($){

	    $.datepicker.regional['ko'] = {closeText: '닫기',prevText: '이전달',nextText: '다음달',currentText: '오늘',monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],weekHeader: 'Wk',dateFormat: 'yy-mm-dd',firstDay: 0,isRTL: false,showMonthAfterYear: true,yearSuffix: ''};

	    $.datepicker.setDefaults($.datepicker.regional['ko']);

	    $('.r_startdate').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: disableAllTheseDays   });

	});

	// 특정날짜들 배열

	var disabledDays = ["2016-12-8","2016-12-25","2016-12-9"];
	function disableAllTheseDays(date) {
		
	    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	
	    for (i = 0; i < disabledDays.length; i++) {
	
	        if(($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1)||(date < new Date())||(date >new Date(2016,11,26))) {
	
	            return [false];
	
	        }
	
	    }
	
	    return [true];
	
	}
	
</script>
</head>
<body>
<p>체크인 : <input type="text" name="date1" class="r_startdate" value="" style="border:1px solid #ccc"><br /></p>
<p>체크아웃 : <input type="text" name="date1" class="r_startdate" value="" style="border:1px solid #ccc"><br /></p>

</body>
</html>