<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receiving upload</title>
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
            <h5 class="modal-title" id="exampleModalLabel">입고예정등록</h5>
            </div>
            <div class="modal-body">
            	<form action="receiving_regist" method="post" id="target">
                <table>
					<tr>
					    <th>입고예정날짜</th>
					    <td><input type="date" id="expect_date" name="expect_date" class="box setValue"></td>
					</tr>
					<tr>
					    <th>품목코드</th>
					    <td>
						    <div class="search">
				               	<input class="box setValue" type="text" id="raw_id_input" name="raw_id" placeholder="품목코드를 선택하세요." readonly>
				                <button type="button" id="rawBtn">찾기</button>
			                </div>
					    </td>
					</tr>
					<tr>
					    <th>품목명</th>
					    <td><input id="raw_name_input" type="text" class="box" placeholder="품목명" readonly></td>
					</tr>
					<tr>
	                    <th>거래처명</th>
		                <td>
				            <div class="search">
				               	<input class="box setValue" type="text" name="client_name" placeholder="거래처를 선택하세요." readonly>
				               	<input class="box" type="hidden" id="client_id" name="client_id" value="${pageMaker.cri.client_id}">
				                <button type="button" id="clientBtn">찾기</button>
			                </div>
		                </td>
					</tr>
					<tr>
					    <th>수량</th>
					    <td><input type="text" id="expect_quantity" name="expect_quantity" class="box setValue" placeholder="수량을 입력하세요"></td>
					</tr>
					<tr>
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
	          	<input type="hidden" name="expect_id">
                </form>
            </div>
            <div class="modal-footer">
            <button type="button" id="upload_btn" class="btn btn-primary">등록</button>
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
	// 입고 예정 등록
	$("#upload_btn").on("click",function(){
		var expect_date = $("#expect_date").val();   
		var date = new Date();
		var receivingDate = new Date(expect_date);
		var expect_quantity = $("#expect_quantity").val();
		
		if(expect_date==''){
			alert("입고 예정 날짜를 선택해주세요.");
			return false;
		} else if(date.getFullYear() >= receivingDate.getFullYear() &&
			date.getMonth() >= receivingDate.getMonth() &&
			date.getDate() > receivingDate.getDate()){
			alert("입고 예정 날짜는 현재 날짜보다 빠를 수 없습니다.");
			return false;
		} else if($('#raw_id_input').val()==''){
	    	alert("품목코드를 선택해주세요.");
	    	return false;
	    } else if($('#client_id').val()==''){
	    	alert("거래처를 선택해주세요.");
	    	return false;
	    } else if(expect_quantity==''){
	    	alert("입고예정수량을 입력해주세요.")
	    	return false;
	    } else if(expect_quantity==0){
    		alert("0은 입력할 수 없습니다.");
    		return false;
    	} else if($('#storageBox').val()==''){
    		alert('창고를 선택해주세요.');
    		return false;
    	} else if($('#storageAreaBox').val()==''){
    		alert('구역을 선택해주세요.');
    		return false;
    	} 

		var frm = $('#target').serialize();

		// 입고 등록
	      $.ajax({
	            method : "post",
	            url : "receiving_regist",
	            data : frm,
	            async : false,
	            dataType : "json",
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            success : function(data){
	                self.close();
	                opener.parent.location.reload();
	                alert("등록되었습니다.");
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