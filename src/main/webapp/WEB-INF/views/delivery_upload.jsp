<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delivery upload</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/itemcode.css">
<style>
.setValue::placeholder{
	color: #444;
}
.setValue{
	background-color: #eaf3ff;
	height: 40px;
	color: #444;
	border: 2px solid transparent;
}
.list td, .list input, .list select{
	height: 40px;
}
.list select{
	box-sizing: border-box;
}
.list select.box{
	padding: 0 10px;
}
.search{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.search input{
    width: 100%;
    height: 40px;
    padding: 10px;
    border: 0;
    box-sizing: border-box;
}
.search button{
    width: 70px;
    height: 40px;
    border: 0;
    margin-right: 0;
    background-color: #f5f5f5; 
}
</style>
</head>
<body>
	<div class="content">
      <h2 class="title">출고예정등록</h2>
      <form action="actionForm" method="post" id="target">
      <div class="upload_btn_area sc_btn_area">
	        <input id="delivery_regist" type="submit" class="btn sc_btn btn-primary delivery_upload" value="등록">
	  </div>
      <div class="list">
          <table>
              <tr>
                  <th>출고예정날짜</th>
                  <td><input type="date" id="d_expect_date" name="d_expect_date" class="box setValue"></td>
              </tr>
              <tr>
                  <th>품목코드</th>
                  <td>
                      <div class="search" style="background-color: #eaf3ff;">
                          <input class="setValue" id="raw_id_input" type="text" placeholder="입력하세요" name="raw_id">
                          <button type="button" onclick="location.href='javascript:joinMember()'">찾기</button>
                      </div>
                  </td>
              </tr>
              <tr>
                  <th>품목명</th>
                  <td><input id="raw_name_input" type="text" class="box" readonly></td>
              </tr>
              <tr>
                  <th>재고량</th>
                  <td><input type="text" id="inventory_quantity" class="box" readonly></td>
              </tr>
              <tr>
                  <th>출고예정수량(개)</th>
                  <td><input type="text" id="d_expect_quantity" name="d_expect_quantity" class="box setValue" placeholder="내용을 입력해주세요"></td>
              </tr>
              <tr>
                  <th>창고명</th>
                  <td><input type="text" id="storage" name="storage_name" class="box" readonly></td>
              </tr>
              <tr>
                  <th>구역명</th>
                  <td><input type="text" id="storage_area" name="storageArea_name" class="box" readonly></td>
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
          <input type="hidden" id="inventory_id" name="inventory_id" class="box" >
          <input type="hidden" id="inventory_new" name="inventory_quantity" class="box" >
      </div>
     </form>      

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="./resources/js/script.js"></script>
<script>
function joinMember(){
	window.open('inventory_itemcode', '_blank', "width=650px, height=560px, top=200px, left=620px, toolbar=no, menubar=no, scrollbars=yes, resizable=yes");
}

$(document).ready(function(){	
	
	// 출고 등록
	$("#delivery_regist").on("click",function(e){
		e.preventDefault();
		
		var d_expect_date = $("#d_expect_date").val();
		var inventory_quantity = parseInt($("#inventory_quantity").val());
		var d_expect_quantity = parseInt($("#d_expect_quantity").val());
		var inventory_new = inventory_quantity - d_expect_quantity;
		
		console.log("inventory_quantity" +inventory_quantity);
		console.log("inventory_quantity" +typeof inventory_quantity);
		console.log("d_expect_quantity" +d_expect_quantity);
		console.log("d_expect_quantity" +typeof d_expect_quantity);
		console.log("---" +inventory_new);
		console.log("---" +typeof inventory_new);
		
		var date = new Date();
		var deliveryDate = new Date(d_expect_date);
		
	
		if(d_expect_date==''){
	         alert("출고 예정 날짜를 입력해주세요.");
	         return false;
	      } else if(date.getFullYear() >= deliveryDate.getFullYear() &&
	            date.getMonth() >= deliveryDate.getMonth() &&
	            date.getDate() > deliveryDate.getDate()){
	          alert("출고 예정 날짜는 현재 날짜보다 빠를 수 없습니다.");
	          return false;
	       } else if($('#raw_id_input').val()==''){
	          alert("품목코드를 입력해주세요.");
	          return false;
	       } else if($('#d_expect_quantity').val()==''){
	          alert("출고예정수량을 입력해주세요.")
	          return false;
	       } else if(inventory_quantity<d_expect_quantity){
	          alert("창고수량보다 출고예정수량이 더 많습니다.");
	          return false;
	       } else if(d_expect_quantity==0){
	          alert("0은 입력할 수 없습니다.");
	          return false;
	       } else if($('#shipment').val()==''){
	          alert('출하지를 선택해주세요.');
	          return false;
	       } 
		
	  	// 재고수량에서 출고수량을 뺀 값을 다시 재고수량에 넣는다
	  	$("#inventory_new").val(inventory_new);
	  
	  	var frm = $('#target').serialize();
		console.log("frm"+ frm)
	
		//출고 등록
	      $.ajax({
	            method : "post",
	            url : "delivery_regist",
	            data : frm,
	            async : false,
	            dataType : "json",
	            contentType: "application/x-www-form-urlencoded; charset=utf-8",
	            success : function(data){
	            		self.close();
	                    opener.parent.location.reload();
	                    alert("등록되었습니다.");
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