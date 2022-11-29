<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receiving report</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./resources/css/style.css">
<style>
	#myChart{
		margin-left:135px;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>

	<div class="content">
    	<h2 class="title"><div class="triangle"></div>입고현황</h2>
        <form id="actionForm" action="/ovolo/receiving_report" method="get">
        <div class="sc_btn_area">
	       
			<input id="search" class="btn sc_btn" type="submit" value="검색">
        </div>
        
        <div class="sc_lookup">
		    <table>
		        <tr>
			        <th>입고유형</th>
		            <td>
				        <select id="receiving_category" name="receiving_category" class="box setValue">
				            <option value='' selected>--선택--</option>
				            <option value="A">품목별</option>
				            <option value="B">거래처별</option>
				        </select>
				    </td>
		            <th>조회기준 날짜</th>
		            <td><!--<input class="box" type="text" name="receiving_date" value="${pageMaker.cri.receiving_date}">-->
		            	<div class="dateBox">
		            	<input type="text" class="datepicker" id="datepicker1" name="start_date" placeholder="조회 시작일자" value="${getStart}">
		            	<span>~</span>
		            	<input type="text" class="datepicker" id="datepicker2" name="end_date" placeholder="조회 종료일자" value="${getEnd}">
		            	</div>
		            </td>
		        </tr>
		    </table>
		    <input class="category" type="hidden" value="${receiving_category}">
        </div>
        
		</form>
		
		<div>
		  <canvas id="myChart" width="1400" height="500"></canvas>
		</div>
		
		<table class="list" style="display : none;">
		<c:forEach items="${receiving_report}" var="report">
			<tr class="raw1">
				<td>${report.raw_id}</td>
			</tr>
			<tr class="raw2">
				<td>${report.raw_name}</td>
			</tr>
			<tr class="raw3">
				<td>${report.total_receiving_quantity}</td>
			</tr>
			<tr class="raw4">
				<td>${report.client_name}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</div> <!--#container-->
     
     <%@ include file="footer.jsp" %>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){
	 $('#datepicker1').datepicker({
         dateFormat: 'yy-mm-dd' //달력 날짜 형태
             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
             ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
             ,changeYear: true //option값 년 선택 가능
             ,changeMonth: true //option값  월 선택 가능                
             ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
             ,buttonImage: "resources/img/calendar.png" //버튼 이미지 경로
             ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
             ,buttonText: "선택" //버튼 호버 텍스트              
             ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
             ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
             ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
             ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
             ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
     });

	 $("#datepicker2").datepicker({
         dateFormat: 'yy-mm-dd' //달력 날짜 형태
             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
             ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
             ,changeYear: true //option값 년 선택 가능
             ,changeMonth: true //option값  월 선택 가능                
             ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
             ,buttonImage: "resources/img/calendar.png" //버튼 이미지 경로
             ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
             ,buttonText: "선택" //버튼 호버 텍스트              
             ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
             ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
             ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
             ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
             ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
     }); 
	
	 
	var category = $(".category").val();
	$("select[name='receiving_category']").val(category);
	
	const ctx = document.getElementById('myChart');
	  
	var td1 = $(".raw1").children();
	var td2 = $(".raw2").children();
	var td3 = $(".raw3").children();
	var td4 = $(".raw4").children();

   	var raw_id = new Array();
   	var raw_name = new Array();
   	var total_receiving_quantity = new Array();
   	var client_name = new Array();
   	
  	//배열에 값담기
    td1.each(function(i){
    	raw_id.push(td1.eq(i).text());
    })  
    
    td2.each(function(i){
    	raw_name.push(td2.eq(i).text());
    })  
    
    td3.each(function(i){
    	total_receiving_quantity.push(td3.eq(i).text());
    })  
    
    td4.each(function(i){
    	client_name.push(td4.eq(i).text());
    }) 
    
    console.log(raw_id);
    console.log(raw_name);
    console.log(total_receiving_quantity);
    console.log(client_name);
    console.log("category" + category);
    
    
    if(category =='A'){
    	new Chart(ctx, {
    	    type: 'bar',
    	    plugins: [ChartDataLabels],
    	    data: {
    	      labels: raw_name,
    	      datasets: [{
    	    	label: '품목별',
    	        datalabels: {
    	        	color:'#444',         // 너무 흐리다 싶어서 잘 보이도록 완전히 검게..
    				font:{size:15}        // pixel 단위이고, 수치로 입력
    	        },
    	        data: total_receiving_quantity,
    	        backgroundColor: '#9CA8D2',
    	        borderWidth: 1
    	      }]
    	    },
    	    options: {
    	      responsive: false,
    	      scales: {
    	        y: {
    	          beginAtZero: true
    	        }
    	      }
    	    }
    	  });
    	
    }else if(category =='B'){
    	new Chart(ctx, {
    	    type: 'bar',
    	    plugins: [ChartDataLabels],
    	    data: {
    	      labels: client_name,
    	      datasets: [{
    	    	label: '거래처별',
    	        datalabels: {
    	        	color:'#444',         // 너무 흐리다 싶어서 잘 보이도록 완전히 검게..
    				font:{size:15}        // pixel 단위이고, 수치로 입력
    	        },
    	        data: total_receiving_quantity,
    	        backgroundColor: '#9CA8D2',
    	        borderWidth: 1
    	      }]
    	    },
    	    options: {
    	      responsive: false,
    	      scales: {
    	        y: {
    	          beginAtZero: true
    	        }
    	      }
    	    }
    	  });
	  	    
    }else{
    	new Chart(ctx, {
    	    type: 'bar',
    	    plugins: [ChartDataLabels],
    	    data: {
    	      labels: [],
    	      datasets: [{
    	        data: [],
    	        backgroundColor: '#9CA8D2',
    	        borderWidth: 1
    	      }]
    	    },
    	    options: {
    	    	plugins:{
                    legend: {
                        display: false
                    },
                },
    	      responsive: false,
    	      scales: {
    	        y: {
    	          beginAtZero: true
    	        }
    	      }
    	    }
    	  });
    	
    }

})
</script>
</body>
</html>