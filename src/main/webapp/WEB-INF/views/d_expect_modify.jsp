<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>d expect modify</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/style.css">	
<style>
.modal-dialog{
    margin-top: -130px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="modal-dialog">
		<div class="modal-content">
		    <div class="modal-header">
		    <h5 class="modal-title" id="exampleModalLabel">출고예정수정</h5>
		    </div>
		    <div class="modal-body">
		    	<form id="target" method="post" >
		        <table>
		            <tr>
		                <th style="display:none;">출고예정번호</th>
		                <td style="display:none;"><input class="box" type="text" value="${modify.d_expect_id}" name="d_expect_id" readonly></td>
		            </tr>
		            <tr>
		                <th>출고예정날짜</th>
		                <td><input type="date" id="d_expect_date" class="box setValue" value="${modify.d_expect_date}" name="d_expect_date"></td>
		            </tr>
		            <tr>
		                <th>품목코드</th>
		                <td><input class="box" type="text" value="${modify.raw_id}" readonly></td>
		            </tr>
		            <tr>
		                <th>품목명</th>
		                <td><input class="box" type="text" value="${modify.raw_name}" readonly></td>
		            </tr>
		            <tr>
		                <th>재고량</th>
		                <td><input class="box" id="inventory_quantity" type="text" value="${modify.inventory_quantity}" readonly></td>
		            </tr>
		            <tr>
		                <th>출고예정수량(개)</th>
		                <td><input class="box setValue" id="d_expect_quantity" type="text" value="${modify.d_expect_quantity}" name="d_expect_quantity"></td>
		            </tr>
		            <tr>
		                <th>창고명</th>
		                <td><input class="box" type="text" value="${modify.storage_name}" readonly></td>
		            </tr>
		            <tr>
		                <th>구역명</th>
		                <td><input class="box" type="text" value="${modify.storageArea_name}" readonly></td>
		            </tr>
		            <tr>
		                <th>출하지</th>
		                <td>
		                     <select id="shipment" name="shipment_bno" class="box setValue">
		                         <option value='' selected>------ 선택 ------</option>
		                         <option value="1">울산1공장</option>
		                         <option value="2">울산2공장</option>
		                         <option value="3">울산3공장</option>
		                         <option value="4">울산4공장</option>
		                         <option value="5">울산5공장</option>
		                     </select>
		                </td>
		            </tr>
		        </table>
		        <input class="shipment" type="hidden" value="${modify.shipment_bno}" >  
		        <input class="old_quantity" type="hidden" value="${modify.d_expect_quantity}" >  
		        <input type="hidden" id="inventory_id" name="inventory_id" class="box" value="${modify.inventory_id}">
		        <input id="inventory_quantity_update" type="hidden" value="${modify.inventory_quantity}" name="inventory_quantity" readonly>
		    </form>
		    </div>
		    <div class="modal-footer">
		    	<button type="submit" class="btn btn-primary" id="d_expect_modify" >변경</button>
		    </div>
		</div>
		</div>
	</div>   

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){	
	var shipment = $(".shipment").val();
	$("select[name='shipment_bno']").val(shipment);
	var actionForm=$("#target1");
	
	// 변경 클릭하면
	$("#d_expect_modify").on("click",function(e){
		e.preventDefault();
		
		var d_expect_date = $("#d_expect_date").val();
		// 기존수량
		var inventory_quantity = $("#inventory_quantity").val();
		// 새로운 출고수량
		var d_expect_quantity = $("#d_expect_quantity").val();
		// 기존출고수량
		var old_quantity = $(".old_quantity").val();
		// 추가로 출고할수량
		var add_quantity = d_expect_quantity-old_quantity;
		// 새로운 창고수량 = 기존수량-추가로출고할수량
		var inventory_quantity_update = inventory_quantity-add_quantity;
		$("#inventory_quantity_update").val(inventory_quantity_update);

		console.log("vvvvvv"+inventory_quantity_update);
		
		// 현재 날짜랑 출고 날짜 비교
		var date = new Date();
		var deliveryDate = new Date(d_expect_date);
		var max_quantity = parseInt(old_quantity) + parseInt(inventory_quantity);
	    
		// 유효성 검사
		if(date.getFullYear() >= deliveryDate.getFullYear() &&
            date.getMonth() >= deliveryDate.getMonth() &&
            date.getDate() > deliveryDate.getDate()){
          	alert("출고 예정 날짜는 현재 날짜보다 빠를 수 없습니다.");
          	return false;
	    } else if(max_quantity < d_expect_quantity){
    		alert("출고할 수 있는 수량을 넘었습니다.");
    		return false;
    	} else if(d_expect_quantity==0){
    		alert("0은 입력할 수 없습니다.");
    		return false;
    	} else if($('#shipment').val()==''){
    		alert('출하지를 선택해주세요.');
    		return false;
    	}
		
		console.log("max_quantity"+max_quantity);
	    console.log("old_quantity"+old_quantity);
	    console.log("inventory_quantity"+inventory_quantity);
	    console.log("d_expect_quantity"+d_expect_quantity);
		
	    var frm = $('#target').serialize();

		// 출고 예정 수정
	      $.ajax({
	            method : "post",
	            url : "d_expect_modify",
	            data : frm,
	            async : false,
	            dataType : "json",
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            success : function(data){
                    alert("등록되었습니다.");
	            	self.close();
	                opener.parent.location.reload();
	            },
	            error : function(data){
	               alert("입력값을 확인해주세요.");
	            }
	        })
	})	
})
</script>
</body>
</html>