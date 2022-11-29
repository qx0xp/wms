<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receiving status</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./resources/css/style.css">
<style>
   .receiving_back{
      width: 100px;
   }
</style>
</head>
<body>
	<%@ include file="header.jsp" %>

	<div class="content">
	<h2 class="title"><div class="triangle"></div>입고대기</h2>
	<form id="actionForm" action="/ovolo/receiving_status" method="get">
	<div class="sc_btn_area">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	    <input class="btn sc_btn" type="submit" value="검색">
	</div>
	<div class="sc_lookup">
	    <table>
	        <tr>
	            <th>품목명</th>
	            <td>
	            	<input class="box" type="text" id="raw_name" name="raw_name" value="${pageMaker.cri.raw_name}">
	            </td>
	            <th>입고날짜</th>
	            <td><!--<input class="box" type="text" name="receiving_date" value="${pageMaker.cri.receiving_date}">-->
	            	<div class="dateBox">
	            	<input type="text" class="datepicker" id="datepicker1" name="start_date" placeholder="조회 시작일자" value="${pageMaker.cri.start_date}">
	            	<span>~</span>
	            	<input type="text" class="datepicker" id="datepicker2" name="end_date" placeholder="조회 종료일자" value="${pageMaker.cri.end_date}">
	            	</div>
	            </td>
	        </tr>
	        <tr>
	            <th>품목코드</th>
	            <td>
	            	<div class="search">
		               	<input class="box" type="text" id="raw_id_input" name="raw_id" value="${pageMaker.cri.raw_id}">
		                <button type="button" id="rawBtn">찾기</button>
	                </div>
	            </td>
	            <th>거래처</th>
	            <td>
		            <div class="search">
		               	<input class="box" type="text" name="client_name" value="${pageMaker.cri.client_name}">
		                <button type="button" id="clientBtn">찾기</button>
	                </div>
                </td>
	        </tr>
	    </table>
	</div>
	<div class="list_btn_area on">
        <button type="button" class="btn btn-primary receiving_modify">수정</button>
        <button type="button" class="btn btn-primary receiving_back">입고지시 철회</button>
        <button type="button" class="btn btn-primary receiving_confirm">확정</button>
        <!-- <button class="btn btn-primary receiving_delete">삭제</button> -->
    </div>
    <div class="list">
		<table>
			<tr>
	            <th style="display:none;" width="10%">입고예정번호</th>
	            <th width="10%">입고날짜</th>
	            <th width="10%">품목코드</th>
	            <th width="20%">품목명</th>
	            <th width="10%">수량(개)</th>
	            <th width="10%">창고명</th>
	            <th width="10%">구역명</th>
	            <th width="15%">거래처</th>
	        </tr>
	        <c:forEach items="${status_list}" var="status">               
	        <tr>                               
	            <td style="display:none;">${status.expect_id}</td>
	            <td>${status.expect_date}</td>
	            <td>${status.raw_id}</td>
	            <td>${status.raw_name}</td>
	            <td>${status.expect_quantity}</td>
	            <td>${status.storage_name}</td>
	            <td>${status.storageArea_name}</td>
	            <td>${status.client_name}</td>
	          	<td style="display:none;">${status.client_id}</td>
	            <td style="display:none;"><input type="hidden" id="id" value="${login.id}"></td>
	        </tr>
	        </c:forEach>
	    </table>
    </div>
                
	<nav aria-label="Page navigation example">
		<ul class="pagination">
	     	<c:if test="${pageMaker.prev}">
	      	<li class="page-item paginate_button">
		        <a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
		        </a>
	      	</li>
	      	</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item paginate_button"><a class="page-link" href="${num}">${num}</a></li>
			</c:forEach>
	     	<c:if test="${pageMaker.next}">
			<li class="page-item paginate_button">
				<a class="page-link" href="${pageMaker.endPage+1}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
			</c:if>
		</ul>
	</nav>
	</form>
    </div>
</div> <!--#container-->

	<%@ include file="footer.jsp" %>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

	  // 입고 대기 목록 선택
	  $('.list table tr').not(":first").on('click', function(){
	     var tr = $(this);
	     var td = tr.children();
	     var expect_id = tr.children(":first").text();
	     var tdArr = new Array();
	     
	     // 배열에 값담기
	     td.each(function(i){
	    	 tdArr.push(td.eq(i).text());
	     })
	
	     if($(this).hasClass("on")){
	        tr.removeClass("on");   
	     } else{
	        tr.siblings().removeClass("on");
	        tr.addClass("on");
	     }
	     
	     console.log("receiving_id :"+ expect_id + "raw_id :"+  tdArr[2] + " receiving_quantity : " + tdArr[4] + "storage_name : " + tdArr[5] + "storageArea_name : " + tdArr[6]);
	     
	     // 입고 수정 페이지 이동
	     $('.receiving_modify').on('click', function(){
	        if(tr.hasClass("on")){
	           openWin = window.open("receiving_modify?expect_id="+expect_id, "childWin", "width=650px, height=627px, top=150px, left=620px, scrollbars=yes");      
	        }
	     })
	     
	     // 입고 지시 back
        $('.receiving_back').on('click', function(){
           if(tr.hasClass("on")){
              $.ajax({
                     type : "post",
                     url : "receiving_back", 
                     data : {expect_id : expect_id},
                     async : false,
                     dataType : "json",
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                     success : function(data){
                         location.reload();
                         alert("입고 지시가 철회되었습니다.");
                     },
                     error : function(data){
                        alert("error");
                     }
                 })
           }
           tr.removeClass("on"); 
        })
	     
        // 입고 지시 back
        $('.receiving_back').on('click', function(){
           if(tr.hasClass("on")){
              $.ajax({
                     type : "post",
                     url : "receiving_back", 
                     data : {expect_id : expect_id},
                     async : false,
                     dataType : "json",
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                     success : function(data){
                         location.reload();
                         alert("입고 지시가 철회되었습니다.");
                     },
                     error : function(data){
                        alert("error");
                     }
                 })
           }
           tr.removeClass("on"); 
        })
        
	     // 입고 확정
	     $('.receiving_confirm').on('click', function(){
	    	 if(tr.hasClass("on")){
	    		 $.ajax({
			            type : "post",
			            url : "receiving_confirm", 
			            data : {expect_id : expect_id, 
			            	raw_id : tdArr[2], 
			            	receiving_quantity :  tdArr[4],
			            	receiving_date : tdArr[1],
			            	inventory_quantity : tdArr[4], 
			            	storage_name : tdArr[5], 
			            	storageArea_name : tdArr[6],
			            	client_id: tdArr[8],
			            	
			            	history_category: "입고",
			            	history_detail: tdArr[5]+tdArr[6]+" 입고",
			            	diff_quantity: tdArr[4],
			            	history_admin: $('#id').val()},
			            async : false,
			            dataType : "json",
			            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			            success : function(data){
			                location.reload();
			                alert("입고 확정되었습니다.");
			            },
			            error : function(data){
			               alert("error");
			            }
			        })
	    	 }
			tr.removeClass("on"); 
	     })
	     
	     // 입고 삭제
	     $('.receiving_delete').on('click', function(){
	    	 if(tr.hasClass("on")){
	    		 $.ajax({
			            type : "post",
			            url : "receiving_delete", 
			            data : {expect_id : expect_id},
			            async : false,
			            dataType : "json",
			            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			            success : function(data){
			                location.reload();
			                alert("삭제되었습니다.");
			            },
			            error : function(data){
			               alert("error");
			            }
			        })
	    	 }
	    	 tr.removeClass("on");
	     })
	  })	
})
</script>
</body>
</html>