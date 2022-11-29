<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>expect modify</title>
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
		    <h5 class="modal-title" id="exampleModalLabel">입고예정수정</h5>
		    </div>
		    <div class="modal-body">
		    	<form id="target" method="post" >
		        <table>
		            <tr>
		                <th style="display:none;">입고예정번호</th>
		                <td style="display:none;"><input class="box" type="text" value="${modify.expect_id}" name="expect_id" readonly></td>
		            </tr>
		            <tr>
		                <th>입고예정날짜</th>
		                <td><input type="date" class="box setValue" id="expect_date" value="${modify.expect_date}" name="expect_date"></td>
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
		                <th>수량(개)</th>
		                <td><input class="box setValue" id="expect_quantity" type="text" value="${modify.expect_quantity}" name="expect_quantity"></td>
		            </tr>
		            <tr>
		                <th>창고명</th>
		                <td>
		                    <select name="storage_name" class="box setValue">
		                        <option value='' selected>선택</option>
		                        <option value="A">A</option>
		                        <option value="B">B</option>
		                        <option value="C">C</option>
		                        <option value="D">D</option>
		                        <option value="E">E</option>
		                    </select>
		                </td>
		            </tr>
		            <tr>
		                <th>구역명</th>
		                <td>
		                    <select name="storageArea_name" class="box setValue">
		                        <option value='' selected>선택</option>
		                        <option value="1">1</option>
		                        <option value="2">2</option>
		                        <option value="3">3</option>
		                        <option value="4">4</option>
		                        <option value="5">5</option>
		                    </select>
		                </td>
		            </tr>
		            <tr>
		                <th>거래처</th>
		                <td><input type="text" class="box" value="${modify.client_name}" readonly></td>
		            </tr>
		        </table>
		        <input class="storage" type="hidden" value="${modify.storage_name}" >  
		        <input class="storage_area" type="hidden" value="${modify.storageArea_name}">  
		    </div>
		    <div class="modal-footer">
		    	<button type="submit" class="btn btn-primary" id="receiving_modify">변경</button>
		    </div>
		    </form>
		</div>
		</div>
	</div>   

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){	
	var storage = $(".storage").val();
	var storage_area = $(".storage_area").val();
	
	$("select[name='storage_name']").val(storage);
	$("select[name='storageArea_name']").val(storage_area);

	var actionForm=$("#target1");
	
	//변경을 클릭하면
	$("#receiving_modify").on("click",function(e){
		e.preventDefault();
		
		var expect_date = $("#expect_date").val();   
		var date = new Date();
		var receivingDate = new Date(expect_date);
		var expect_quantity = $("#expect_quantity").val();
		
		if (date.getFullYear() >= receivingDate.getFullYear() &&
			date.getMonth() >= receivingDate.getMonth() &&
			date.getDate() > receivingDate.getDate()){
			alert("입고 예정 날짜는 현재 날짜보다 빠를 수 없습니다.");
			return false;
		 } else if(expect_quantity==0){
			 alert("0은 입력할 수 없습니다.");
			 return false;
		 }
		
		var frm = $('#target').serialize();
		
		console.log(frm);

		// 입고 예정 수정
	      $.ajax({
	            method : "post",
	            url : "expect_modify",
	            data : frm,
	            async : false,
	            dataType : "json",
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            success : function(data){
	                self.close();
	                opener.parent.location.reload();
	                alert("변경되었습니다.");
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