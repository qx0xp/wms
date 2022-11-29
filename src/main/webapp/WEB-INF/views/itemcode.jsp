<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>itemcode</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/itemcode.css">
<style>
	.pagination{
		justify-content: center;
	}
	.list .on td{
	background-color: #eee;
	color: #666;
	}
</style>
</head>
<body>
		<div class="content">
       		<h2 class="title">품목코드 찾기</h2>
            <form id="actionForm" action="/ovolo/itemcode" method="get">
	            <div class="sc_btn_area">
		        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		    		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		            <input class="btn sc_btn" type="submit" value="조회">
	            </div>
				<div class="sc_lookup">
				    <table>
				    	<tr>
				    		<th>품목코드</th>
				            <td><input class="box" type="text" name="raw_id" value="${pageMaker.cri.raw_id}"></td>
				    	</tr>
				        <tr>
				            <th>품목명</th>
				            <td><input class="box" type="text" name="keyword" value="${pageMaker.cri.keyword}"></td>
				        </tr>
				    </table>
				</div>
	            <div class="list">
	            	<table>
	                    <tr>
	                        <th>품목코드</th>
	                        <th>품목명</th>
	                    </tr>
	                    <c:forEach items="${item_list}" var="item">
	                    <tr>                               
	                        <td><c:out value="${item.raw_id}"/></td>
	                        <td><c:out value="${item.raw_name}"/></td>
	                        <td style="display:none;"><c:out value="${item.raw_unit}"/></td>
	                        <td style="display:none;"><c:out value="${item.client_name}"/></td>	                        
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
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){
	//품목 항목 선택
	$('.list table tr').not(":first").on('mouseover', function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
		} else{
			$(this).siblings().removeClass('on');
			$(this).addClass('on');
		}
		
		$(this).on('click', function(){
			$(opener.document).find("#raw_id_input").val($(this).children().eq(0).text());
			$(opener.document).find("#raw_name_input").val($(this).children().eq(1).text());
			$(opener.document).find("#raw_unit_input").val($(this).children().eq(2).text());
			//$(opener.document).find("#client_name_input").val($(this).children().eq(3).text());
			window.close();
		})
	})
})
</script>
</body>
</html>