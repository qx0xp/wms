<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>monthly order status</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./resources/css/style.css">
<style>
.sc_lookup table th{
    width: 16.6%;
}
.sc_lookup table td{
	width: 16.6%;
}
.chart{
	margin: 0 auto;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>

    <div class="content">
        <h2 class="title"><div class="triangle"></div>월별입출고건수</h2>
        <form action="monthly_order.do" id="actionForm" method="get">
        <div class="sc_btn_area">
            <input class="btn sc_btn" type="button" value="검색">
        </div>
		<div class="sc_lookup">
		    <table>
		        <tr>
		            <th>조회날짜</th>
		            <td>
		            	<div class="dateBox">
		            	<input type="text" class="datepicker" id="datepicker1" name="start_date" placeholder="조회 시작일자" value="${slist.cri.start_date}">
		            	<span>~</span>
		            	<input type="text" class="datepicker" id="datepicker2" name="end_date" placeholder="조회 종료일자" value="${slist.cri.end_date}">
		            	</div>
		            </td>
		        </tr>
		    </table>
		</div>
        <div class="list">
			<div class="chart">
				<canvas id="canvas" width="800" height="250"></canvas>
			</div> 
        </div>
    	</form>
    </div>
</div> <!--#container-->

<%@ include file="footer.jsp" %>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){
	getGraph();
	
	 $('#datepicker1').datepicker({
			dateFormat: 'yy-mm',
			changeMonth: true,
		    changeYear: true,
		    showButtonPanel: true,
		    onClose: function(dateText, inst) {  
	            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val(); 
	            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); 
	            $(this).datepicker('setDate', new Date(year, month, 1));
	            $(".ui-datepicker-calendar").css("display","none");
	        }
		});
		$("#datepicker1").focus(function () {
			$(".ui-datepicker-calendar").css("display","none");
			$("#ui-datepicker-div").position({
				  my: "center top",
				  at: "center bottom",
				  of: $(this)
			});
     });
	 
		$('#datepicker2').datepicker({
			dateFormat: 'yy-mm',
			changeMonth: true,
		    changeYear: true,
		    showButtonPanel: true,
		    onClose: function(dateText, inst) {  
	            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val(); 
	            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); 
	            $(this).datepicker('setDate', new Date(year, month, 1));
	            $(".ui-datepicker-calendar").css("display","none");
	        }
		});
		$("#datepicker2").focus(function () {
			$(".ui-datepicker-calendar").css("display","none");
			$("#ui-datepicker-div").position({
				  my: "center top",
				  at: "center bottom",
				  of: $(this)
			});
     });     

	$(".sc_btn").on("click",function(e){
		e.preventDefault();
		
		// 날짜 유효성 검사
    	if(!($('#datepicker1').val()!=''&&$('#datepicekr2').val()!='')){
    		alert("날짜를 입력해주세요.");
    		return false;
    	} else if(($('#datepicker1').val()==''&&$('#datepicker2').val()!='')||($('#datepicker1').val()!=''&&$('#datepicker2').val()=='')){
    		alert("날짜 입력을 다시 해주세요.");
    		return false;
    	}
    	
		getGraph();
	})
	
    function getGraph(){
		var recLabels = [];
		var recData = [];
		var delLabels = [];
		var delData = [];
		
		var start_date = $('input[name=start_date]').val();
		var end_date = $('input[name=end_date]').val();
		
		var dateArr = new Array();
		var nDate = new Date(start_date);
		var eDate = new Date(end_date);

		while(nDate<=eDate){
			dateArr.push(nDate.getFullYear() + "-" + (("0" + (nDate.getMonth() + 1)).slice(-2))); // 현재 달(숫자) 추출한 거 배열에 넣음
			nDate.setMonth(nDate.getMonth()+1);
			console.log(nDate);
		}
		
		console.log(dateArr);
  	  
  	  $.ajax({
			url: "/ovolo/monthly_order.do",
			type: "post",
			data: {start_date: start_date,
					end_date: end_date},
			dataType: "json",
			success: function(data){
				$.each(data.receive, function(inx, obj){
					recLabels.push(obj.month);
					recData.push(obj.count);
				});
				
				$.each(data.delivery, function(inx, obj){
					delLabels.push(obj.month);
					delData.push(obj.count);
				});
				
				console.log(data.receive);
				console.log(data.delivery);
			  // 그래프
  			  new Chart(document.getElementById("canvas"), {
  		    	  type: 'line',
  		    	  data: {
  		    	    labels: dateArr, // X축 
  		    	    datasets: [
   		    	      {data: recData, // 값
   	  		    	        label: "입고",
   	  		    	        borderColor: "#ededed",
   	  		    	        fill: false
   	   		    	 },
   		    	      {data: delData, // 값
     		    	        label: "출고",
     		    	        borderColor: "#333",
     		    	        fill: false
      		    	 }
					]},
  		    	  options: {
  		    	    title: {
  		    	      display: true,
  		    	      text: '월별수주현황',
  		    	    },
	  		    	  scales: {
	                      yAxes: [{
	                              display: true,
	                              ticks: {
	                                  beginAtZero: true
	                              }
	                          }]
	                  }
  		    	  }
  		    	}); //그래프
  		  },
  		  error:function(){
  			  alert("실패");
  		  }  
  	  }) // ajax	  
    } // getGraph
})
</script>
</body>
</html>