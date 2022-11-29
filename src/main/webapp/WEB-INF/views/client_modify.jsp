<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>client modify</title>
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
            <h5 class="modal-title" id="exampleModalLabel">거래처수정</h5>
            </div>
            <div class="modal-body">
            	<form id="updateForm" method="post">
                <table>
                	<tr>
                        <th>거래처코드</th>
                        <td><input type="text" id="client_name" class="box" name="client_id" value="${cdetail.client_id}" readonly></td>
                    </tr>
                    <tr>
                        <th>거래처명</th>
                        <td><input type="text" id="client_name" class="box setValue" name="client_name" value="${cdetail.client_name}" required></td>
                    </tr>
                    <tr> 
                        <th>담당자명</th>
                        <td><input type="text" id="client_manager" class="box setValue" name="client_manager" value="${cdetail.client_manager}" required></td>
                    </tr>
                    <tr>
                        <th>거래처 연락처</th>
                        <td><input type="text" id="client_tel" class="box setValue" name="client_tel" value="${cdetail.client_tel}" required></td>
                    </tr>
                </table>
                </form>
            </div>
            <div class="modal-footer">
            <button type="button" id="modifyBtn" class="btn btn-primary">변경</button>
            </div>
        </div>
        </div>
	</div>
        
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){
	// 거래처 수정
	$('#modifyBtn').on("click", function(){
		var frm = $("#updateForm").serialize();
		
		$.ajax({
            type : "post",
            url : "client_modify",
            data : frm,
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