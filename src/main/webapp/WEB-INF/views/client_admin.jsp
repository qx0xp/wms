<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>client admin</title>
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
        <h2 class="title"><div class="triangle"></div>거래처관리</h2>
        <form action="client_admin" id="actionForm" method="get">
        <div class="sc_btn_area">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            <input class="btn sc_btn" type="submit" value="검색">
        </div>
	        <div class="sc_lookup">
	            <table>
	                <tr>
		           		<th>거래처</th>
			            <td>
				            <div class="search">
				               	<input class="box" type="text" name="client_name" value="${pageMaker.cri.client_name}">
				                <button type="button" id="clientBtn">찾기</button>
			                </div>
		                </td>
	                    <th>담당자명</th>
		                <td><input class="box" type="text" name="client_manager" value="${pageMaker.cri.client_manager}"></td>
	                </tr>
	            </table>
	        </div>
			<div class="list_btn_area on">
				<button type="button" class="btn btn-primary client_upload">등록</button>
		        <button type="button" class="btn btn-primary client_modify">수정</button>
		        <button type="button" class="btn btn-primary client_delete">삭제</button>
		    </div>
	        <div class="list inventory_dtl">
	            <table>
	                <tr>
	                    <th width="10%">거래처코드</th>
	                    <th width="50%">거래처명</th>
	                    <th width="30%">연락처</th>
	                    <th width="10%">담당자명</th>
	                </tr>
			        <c:forEach items="${clist}" var="list">
		            <tr>
		            	<td><c:out value="${list.client_id}"></c:out></td>
		            	<td><c:out value="${list.client_name}"></c:out></td>
		            	<td class="c_tel"><c:out value="${list.client_tel}"></c:out></td>
		            	<td><c:out value="${list.client_manager}"></c:out></td>
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
	// 거래처 등록
	$('.client_upload').on('click', function(){
		$('.list table tr').removeClass("on");
		openWin = window.open("client_upload", "childWin", "top=250px, left=620px, width=500, height=545");
	})
	
	// 거래처 항목 선택
	$('.list table tr').not(":first").on('click', function(){
		var tr = $(this);
		var c_id = tr.children(":first").text();
	
		if(tr.hasClass("on")){
			tr.removeClass("on");	
		} else{
			tr.siblings().removeClass("on");
			tr.addClass("on");
		}
		
		// 거래처 수정
		$('.client_modify').on('click', function(){
			if(tr.hasClass("on")){
				openWin = window.open("client_modify?client_id="+c_id, "childWin", "top=250px, left=620px, width=500, height=545");		
			}
		})
		
		// 거래처 삭제
		$('.client_delete').on('click', function(){
			if(tr.hasClass("on")){
				$.ajax({
		            type : "post",
		            url : "client_delete",
		            data : {client_id : c_id},
		            dataType : "json",
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            success : function(data){
		            	alert("process success");
		            	location.reload();
		            },
		            error : function(data){
		            	alert("error");
		            }
				})
			}
		})
	})
})
</script>
</body>
</html>