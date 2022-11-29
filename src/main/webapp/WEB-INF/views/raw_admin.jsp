<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>raw admin</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>

    <div class="content">
        <h2 class="title"><div class="triangle"></div>원자재관리</h2>
        <form action="raw_admin" id="actionForm" method="get">
        <div class="sc_btn_area">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            <input class="btn sc_btn" type="submit" value="검색">
        </div>
	        <div class="sc_lookup">
	            <table>
	                <tr>
		           		<th>품목코드</th>
	                    <td><input class="box" type="text" name="raw_id" value="${pageMaker.cri.raw_id}"></td>
	                    <th>품목명</th>
		                <td><input class="box" type="text" name="raw_name" value="${pageMaker.cri.raw_name}"></td>
	                </tr>
	            </table>
	        </div>
			<div class="list_btn_area on">
				<button type="button" class="btn btn-primary raw_upload">등록</button>
		        <button type="button" class="btn btn-primary raw_modify">수정</button>
		        <button type="button" class="btn btn-primary raw_delete">삭제</button>
		    </div>
	        <div class="list">
	            <table>
	                <tr>
	                    <th width="10%">품번</th>
	                    <th width="60%">품목명</th>
	                    <th width="20%">규격</th>
	                    <th width="10%">가격(원)</th>
	                </tr>
			        <c:forEach items="${rlist}" var="list">
		            <tr>
		            	<td><c:out value="${list.raw_id}"></c:out></td>
		            	<td><c:out value="${list.raw_name}"></c:out></td>
		            	<td><c:out value="${list.raw_standard}"></c:out></td>
		            	<td><c:out value="${list.raw_price}"></c:out></td>
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
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){
	// 원자재 등록
	$('.raw_upload').on('click', function(){
		$('.list table tr').removeClass("on");
		openWin = window.open("raw_upload", "childWin", "top=250px, left=620px, width=500, height=370");
	})
	
	// 선택된 원자재 수정, 삭제
	$('.list table tr').not(":first").on('click', function(){
	var tr = $(this); // 첫번째 tr를 제외한 선택된 tr
	var r_id = tr.children(":first").text(); // raw_id

	if(tr.hasClass("on")){
		tr.removeClass("on");	
	} else{
		tr.siblings().removeClass("on");
		tr.addClass("on");
	}
	
	// 원자재 수정
	$('.raw_modify').on('click', function(){
		if(tr.hasClass("on")){
			openWin = window.open("raw_modify?raw_id="+r_id, "childWin", "top=250px, left=620px, width=500, height=545");		
		}
	})
	
	// 원자재 삭제
	$('.raw_delete').on('click', function(){
		if(tr.hasClass("on")){
			$.ajax({
	            type : "post",
	            url : "raw_delete",
	            data : {raw_id : r_id},
	            dataType : "json",
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            success : function(data){
	            	alert("process success");
	            	location.reload();
	            },
	            error : function(data){
	            	alert("error");
	            }
			}) // ajax
		}
	})
})
})
</script>
</body>
</html>