<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory move popup</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/style.css">
<style>
.modal-dialog{
    position: relative;
    top: 0;
    max-width: 800px;
    margin: 0 auto;
}	
</style>
</head>
<body>
	<div id="wrap">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">재고이동</h5>
            </div>
            <div class="modal-body">
            	<form id="invMoveForm" method="post">
                <table>
                <c:forEach items="${ilist}" var="list">
                    <tr>
                        <th style="display:none;">재고번호</th>
                        <td style="display:none;"><input class="box" id="inventory_id" name="inventory_id" type="text" value="${list.inventory_id}" readonly></td>
                    </tr>
                    <tr> 
                        <th>품목코드</th>
                        <td><input class="box" id="raw_id" name="raw_id" type="text" value="${list.raw_id}" readonly></td>
                    </tr>
                    <tr>
                        <th>품목명</th>
                        <td><input class="box" type="text" value="${list.raw_name}" readonly></td>
                    </tr>
                    <tr>
                        <th>기존 창고구역</th>
                        <td>
                        	<input class="box" id="old_storage" name="old_storage" type="text" value="${list.storage_name}${list.storageArea_name}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>기존 수량</th>
                        <td><input class="box" id="old_quantity" name="old_quantity" type="text" value="${list.inventory_quantity}" readonly></td>
                    </tr>
                    <tr>
                        <th>보내는 창고</th>
                        <td>
                        	<select id="storageBox" class="box setValue" name="storage_name">
                        		<option value="" hidden>선택</option>
                        		<c:forEach items="${storageName}" var="storageN">
                        			<option value="${storageN.storage_name}">${storageN.storage_name}</option>
                        		</c:forEach>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <th>보내는 구역</th>
                        <td>
                        	<select id="storageAreaBox" class="box setValue" name="storageArea_name">
                        		<option value="">선택</option>
                        	</select>
                        	<input type="hidden" id="new_storage" name="new_storage">
                        </td>
                    </tr>
                    <tr>
                        <th>이동 수량</th>
                        <td>
                        	<input class="box setValue" type="text" id="inventory_quantity" name="inventory_quantity"
                        	oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(|..*)|./g, '$1');"
                        	placeholder="수량을 입력해주세요.">
                        	<input type="hidden" id="diff_quantity" name="diff_quantity">
                        	<input type="hidden" id="id" name="id" value="${login.id}">
                        </td>
                    </tr>
					<tr>
                        <th>이동 사유</th>
                        <td>
                        	<select id="msg_bno" class="box setValue" name="msg_bno">
                        		<option value="" hidden>선택</option>
                        		<c:forEach items="${moveMsg}" var="move_msg">
                        			<option value="${move_msg.msg_bno}">${move_msg.msg_name}</option>
                        		</c:forEach>
                        	</select>
                        </td>
                    </tr>
                </c:forEach>
                </table>
                </form>
            </div>
            <div class="modal-footer">
            <button type="button" id="inventory_move_upd" class="btn btn-primary">변경</button>
            </div>
        </div>
        </div>
	</div>
        
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){
	// 재고 이동 시, 유효성 검사
	$('#inventory_move_upd').on("click", function(e){
		e.preventDefault();
		var newStg = $('#storageBox option:selected').val();
		var newStgArea = $('#storageAreaBox option:selected').val();
		var inv_quantity = $('input[name=inventory_quantity]').val();
		var stg = $('#old_storage').val();
		var msg = $('#msg_bno').val();
		
		// 창고구역, 수량 입력 확인
		if(newStg==""){
			alert("창고를 설정해주세요.");
			return false;
		} else if(newStgArea==""){
			alert("창고구역을 설정해주세요.");
			return false;
		}  else if(stg==(newStg+newStgArea)){
			alert("기존 창고와 같은 창고입니다.");
			return false;
		} else if(inv_quantity==""){
			alert("수량을 입력해주세요.");
			return false;
		} else if(inv_quantity=='0'){
			alert('양수를 입력해주세요.');
			return false;
		} else if(Number($('#old_quantity').val())<Number(inv_quantity)){
			alert('기존 수량을 초과하였습니다.');
			return false;
		} else if(msg==''){
			alert('이동 사유를 입력해주세요.');
			return false;
		}
		
		var stg = $('#storageBox').val();
		var stgArea = $('#storageAreaBox').val();
		var new_storage = $('input[name=new_storage]').val(stg+stgArea);
		var diff_quantity=$('input[name=diff_quantity]').val(inv_quantity);

		$.ajax({
            type : "post",
            url : "inventory_move_popup",
            data : {
            	inventory_quantity: inv_quantity,
            	storage_name: newStg,
            	storageArea_name: newStgArea,
            	history_category: "재고이동",
            	history_detail: $('#old_storage').val() + "->" + $('#new_storage').val() + " 위치 이동",
            	raw_id: $('#raw_id').val(),
            	diff_quantity: $('#diff_quantity').val(),
            	d_inventory_id: $('#inventory_id').val(),
            	inventory_id: $('#inventory_id').val(),
            	history_admin: $('#id').val(),
            	msg_bno: $('#msg_bno').val()
            },
            dataType : "json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success : function(data){
            	alert("process success");
                self.close();
                opener.parent.location.reload();
            },
            error : function(data){
            	alert("error");
            }
        })
	})
})
</script>
</body>
</html>