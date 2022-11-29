<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inventory adjust</title>
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
        <h2 class="title"><div class="triangle"></div>재고실사</h2>
        <form action="inventory_adjust" id="actionForm" method="get">
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
            <!-- <button type="button" class="btn full_correction">일괄보정</button> -->
        </div>
        <div class="list">
            <table>
                <tr>
                    <th style="display:none;" width="10%">재고번호</th>
                    <th width="10%">품목코드</th>
                    <th width="20%">품목명</th>
                    <th width="10%">창고명</th>
                    <th width="10%">구역명</th>
                    <th style="display:none;" width="10%">예정재고</th>
					<th width="10%">전산재고</th>
                    <th width="10%">실재고</th>
                    <th width="10%">전산재고-실재고</th>
                    <th width="10%">보정</th>
                </tr>
		        <c:forEach items="${ilist}" var="list">
		        <tr>
	           		<td style="display:none;" class="inv_id">${list.inventory_id}</td>
	           		<td class="r_id">${list.raw_id}</td>
	           		<td class="r_name">${list.raw_name}</td>
	           		<td class="stg_name">${list.storage_name}</td>
	           		<td class="stgArea_name">${list.storageArea_name}</td>
	           		<td style="display:none;" class="inventory_quantity">${list.inventory_quantity}</td>
	           		<td class="real_quantity">${list.real_quantity}</td>
	           		<td style="background-color:#F2F2F2;cursor:text;"><input type="text" class="real_input" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(|..*)|./g, '$1');" value='' style="width:90%;margin:0 auto;"></td>
	           		<td style="background-color:#F2F2F2;"><input type="text" class="diff_quantity" style="width:90%;margin:0 auto;display:none;" readonly></td>
	           		<td style="background-color:#F2F2F2;"><button type="button" class="adjustBtn" style="width:90%;height:30px;display:none;margin:0 auto;background-color:#333;color:#fff;border:none;">보정</button></td>
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
	// 실재고 항목 block
	$('.list table tr').not(":first").on('click', function(){
		$(this).find('.real_input').css('display', 'block');
	})
	
	// 실재고 입력 시, 차이량 산정(전산재고-실재고)
	$('.real_input').on('change',function(){
		var t = $(this).parents('tr');
		t.find('.diff_quantity').css('display', 'block');
		t.find('.diff_quantity').val(t.find('.real_quantity').text()-t.find('.real_input').val());
		
		// 실재고가 ''이거나 null이면 차이 수량 0처리 -> 차이수량, 실재고 display none
		if(t.find('.real_input').val()==''||t.find('.real_input').val()==null){
			t.find('.diff_quantity').val(0);
			t.find('.diff_quantity').css('display', 'none');
		}
		
		// 재고 조정 버튼 생성
		if(t.find('.diff_quantity').val()==0){
			t.find('.adjustBtn').css('display', 'none');
		} else{
			t.find('.adjustBtn').css('display', 'block');
		}
	})
	
	
	
	// 체크 객체 클릭
			$('.full_correction').on('click', function(){;
				var chkObj = $('.checkBox:checked');
				$.each(chkObj, function(i){
					if(chkObj.eq(i).prop("checked")==true){
						var t = $(chkObj).eq(i).parents('tr');
						console.log(i);
						console.log(i+"번째"+t);
						console.log("-----------");
						console.log(t.find('.r_id').text());
						if(!(t.find('.diff_quantity').val()==''||t.find('.diff_quantity').val()==null)){
							$.ajax({
					           type : "post",
					           url : "inventory_adjust",
					           data : {
					        	   history_category: "재고실사",
					        	   history_detail: t.find('.real_quantity').text() + "->" + t.find('.real_input').val() + " 수량 변경",
					        	   raw_id: t.find('.r_id').text(),
					        	   diff_quantity: Math.abs(t.find('.diff_quantity').val()),
					        	   d_inventory_id: t.find('.inv_id').text(),
					        	   inventory_id: t.find('.inv_id').text(),
					        	   inventory_quantity: (t.find('.inventory_quantity').text()-t.find('.diff_quantity').val()),
					        	   real_quantity: t.find('.real_input').val(),
					        	   history_admin: t.find('#id').val()
					        	   },
					           dataType : "json",
					           contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					           success : function(data){
					        	location.reload();
					           	//alert("process success");
					           	// 화면상 값 변경
					           	//$('.select').find('.inventory_quantity').text(data.inventory_quantity);
					           	//$('.select').find('.real_quantity').text(data.real_quantity);
					           	//$('.select').find('.diff_quantity').val(null);
					           	
					           	//$('.select').find('.diff_quantity').css('display', 'none');
					           //	$('.select').find('.adjustBtn').css('display', 'none');
					           	//t.removeClass('select');
					           },
					           error : function(request, status, error){
					           	alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
					           }
					       }) // ajax
						}
					}
				})
				}) // 클릭 이벤트

	
	// 재고 조정
	$('.adjustBtn').on('click', function(){
		var t = $(this).parents('tr');
		t.siblings().removeClass('select');
		t.addClass('select');
		
		if(t.hasClass('select')){
			$.ajax({
		           type : "post",
		           url : "inventory_adjust",
		           data : {
		        	   history_category: "재고실사",
		        	   history_detail: t.find('.real_quantity').text() + "->" + t.find('.real_input').val() + " 수량 변경",
		        	   raw_id: t.find('.r_id').text(),
		        	   diff_quantity: Math.abs(t.find('.diff_quantity').val()),
		        	   d_inventory_id: t.find('.inv_id').text(),
		        	   inventory_id: t.find('.inv_id').text(),
		        	   inventory_quantity: (t.find('.inventory_quantity').text()-t.find('.diff_quantity').val()),
		        	   real_quantity: t.find('.real_input').val(),
		        	   history_admin: t.find('#id').val()
		        	   },
		           dataType : "json",
		           contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		           success : function(data){
		           	alert("process success");
		           	// 화면상 값 변경
		           	$('.select').find('.inventory_quantity').text(data.inventory_quantity);
		           	$('.select').find('.real_quantity').text(data.real_quantity);
		           	$('.select').find('.diff_quantity').val(null);
		           	
		           	$('.select').find('.diff_quantity').css('display', 'none');
		           	$('.select').find('.adjustBtn').css('display', 'none');
		           	t.removeClass('select');
		           },
		           error : function(request, status, error){
		           	alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		           }
		       }) // ajax
		}
	})
})
</script>
</body>
</html>