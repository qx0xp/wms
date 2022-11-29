<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>raw modify</title>
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
            <h5 class="modal-title" id="exampleModalLabel">원자재수정</h5>
            </div>
            <div class="modal-body">
            	<form id="updateForm" method="post">
                <table>
                	<tr>
                        <th>품번</th>
                        <td><input type="text" id="raw_id" class="box" name="raw_id" value="${rdetail.raw_id}" readonly></td>
                    </tr>
                    <tr>
                        <th>품목명</th>
                        <td><input type="text" id="raw_name" class="box setValue" name="raw_name" value="${rdetail.raw_name}" required></td>
                    </tr>
                    <tr> 
                        <th>규격</th>
                        <td><input type="text" id="raw_standard" class="box setValue" name="raw_standard" value="${rdetail.raw_standard}" required></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td><input type="text" id="raw_price" class="box setValue" name="raw_price" value="${rdetail.raw_price}" required></td>
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
	$('#modifyBtn').on("click", function(){
		var frm = $("#updateForm").serialize();

		$.ajax({
            type : "post",
            url : "raw_modify",
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