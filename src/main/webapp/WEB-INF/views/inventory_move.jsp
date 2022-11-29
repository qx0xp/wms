<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inventory move</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/style.css">
<style>
.sc_lookup table th {
    width: 16.6%;
}
.sc_lookup table td {
    width: 16.6%;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>

    <div class="content">
    
        <h2 class="title"><div class="triangle"></div>재고이동</h2>
        <form action="inventory_move" id="actionForm" method="get">
        <div class="sc_btn_area">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            <input class="btn sc_btn" type="submit" value="검색">
        </div>
        <div class="sc_lookup">
            <table>
                <tr>
                	<th>품목코드</th>
		            <td>
		            	<div class="search">
			               	<input class="box" type="text" id="raw_id_input" name="raw_id" value="${pageMaker.cri.raw_id}">
			                <button type="button" id="rawBtn">찾기</button>
		                </div>
		            </td>
		            <th>품목명</th>
		            <td>
		            	<input class="box" type="text" id="raw_name" name="raw_name" value="${pageMaker.cri.raw_name}">
		            </td>
		            <th>창고구역</th>
                    <td>
                    	<div class="stg_box">
                   		<select id="storageBox" class="box setValue" name="storage_name">
                       		<option value="${pageMaker.cri.storage_name}" hidden>${pageMaker.cri.storage_name}창고</option>
                       		<c:forEach items="${storageName}" var="storageN">
                       			<option value="${storageN.storage_name}">${storageN.storage_name}창고</option>
                       		</c:forEach>
                       	</select>
                   	    <select id="storageAreaBox" class="box setValue" name="storageArea_name">
                       		<option value="${pageMaker.cri.storageArea_name}" hidden>${pageMaker.cri.storageArea_name}구역</option>
                       	</select>
                    	</div>
                    </td>
	           	</tr>
            </table>
        </div>
        <div class="list_btn_area">
            <button type="button" class="btn inventory_upd">수정</button>
        </div>
        <div class="list">
            <table>
                <tr>
                    <th style="display:none;" width="10%">재고번호</th>
                    <th width="10%">품목코드</th>
                    <th width="40%">품목명</th>
                    <th width="10%">예정재고</th>
                    <th width="10%">실재고</th>
                    <th width="10%">창고명</th>
                    <th width="10%">구역명</th>
                </tr>
		        <c:forEach items="${ilist}" var="list">
		        <tr>
	           		<td style="display:none;">${list.inventory_id}</td>
	           		<td>${list.raw_id}</td>
	           		<td>${list.raw_name}</td>
	           		<td>${list.inventory_quantity}</td>
	           		<td>${list.real_quantity}</td>
	           		<td>${list.storage_name}</td>
	           		<td>${list.storageArea_name}</td>
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
    	</form><!-- form -->
    </div>
</div> <!--#container-->

<%@ include file="footer.jsp" %>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){
	// 이동할 재고 선택
	$('.list table tr').not(":first").on('click', function(){
		var tr = $(this);
		var td = tr.children(":first").text();

		if($(this).hasClass("on")){
			tr.removeClass("on");	
		} else{
			tr.siblings().removeClass("on");
			tr.addClass("on");
		}
		
		$('.inventory_upd').on('click', function(){
			if(tr.hasClass("on")){
				openWin = window.open("inventory_move_popup?inventory_id="+td, "childWin", "top=250px, left=620px, width=500, height=545");		
			}
		})
	})
})
</script>
</body>
</html>