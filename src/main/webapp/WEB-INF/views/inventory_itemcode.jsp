<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inventory itemcode</title>
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
	
	.list table th{
		width: 16.6%;
	}
</style>
</head>
<body>
		<div class="content">
       		<h2 class="title">재고선택</h2>
            <form id="actionForm" action="/ovolo/inventory_itemcode" method="get">
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
	                        <th>수량(개)</th>
	                        <th>창고명</th>
	                        <th>구역명</th>
	                    </tr>
	                    <c:forEach items="${inventory_item_list}" var="inventory_item">
	                    <tr>                            
	                        <td><c:out value="${inventory_item.raw_id}"/></td>
	                        <td><c:out value="${inventory_item.raw_name}"/></td>
	                        <td><c:out value="${inventory_item.inventory_quantity}"/></td>
	                        <td><c:out value="${inventory_item.storage_name}"/></td>
	                        <td><c:out value="${inventory_item.storageArea_name}"/></td>       
	                        <td style="display:none;"><c:out value="${inventory_item.inventory_id}"/></td>	                 
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
$('.list table tr').not(":first").on('click', function(){
	$(opener.document).find("#raw_id_input").val($(this).children().eq(0).text());
	$(opener.document).find("#raw_name_input").val($(this).children().eq(1).text());
	$(opener.document).find("#storage").val($(this).children().eq(3).text());
	$(opener.document).find("#storage_area").val($(this).children().eq(4).text());
	$(opener.document).find("#inventory_id").val($(this).children().eq(5).text());
	$(opener.document).find("#inventory_quantity").val($(this).children().eq(2).text());
	window.close();
})
</script>
</body>
</html>