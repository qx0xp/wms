<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/upload.css">
</head>
<body>
<%@ include file="header.jsp" %>

		<div class="content">
		    <h2 class="title"><div class="triangle"></div>계정등록</h2>
		    <div class="upload_area">
		        <form action="join" id="insertForm" method="post">
		            <div class="upload_box">
		                <label for="id">아이디</label><input type="text" id="id" name="id" placeholder="내용을 입력해주세요.">
		                <button type="button" id="id_btn" class="btn">아이디 중복 검사</button>
		            </div>
		            <div class="upload_box">
		                <label for="pw1">비밀번호</label><input type="password" id="pw1" name="password" placeholder="내용을 입력해주세요.">
		            </div>
		            <div class="upload_box">
		                <label for="pw2">비밀번호 확인</label><input type="password" id="pw2" placeholder="내용을 입력해주세요.">
		            </div>
		            <div class="upload_box">
		                <label for="name">이름</label><input type="text" id="name" name="name" placeholder="내용을 입력해주세요.">
		            </div>
		            <div class="upload_box">
		                <label for="dept">부서명</label>
		                <select id="dept" name="dept">
		                    <option value="" hidden>선택</option>
		                    <option value="자재관리부">자재관리부</option>
		                    <option value="물류1팀">물류1팀</option>
		                    <option value="물류2팀">물류2팀</option>
		                    <option value="운송관리팀">운송관리팀</option>
		                    <option value="물류개발팀">물류개발팀</option>
		                </select>
		            </div>
		            <div class="upload_box">
		                <label for="tel">연락처</label>
		                <input type="text" id="tel" name="tel" class="int" placeholder="-없이 입력해주세요." maxlength="15">
		            </div>
		            <input class="btn upload_btn" id="admin_regist" type="button" value="등록하기">
		        </form>
		    </div>
		</div>
	</div> <!--#container-->

<%@ include file="footer.jsp" %>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="./resources/js/script.js"></script>
<script>
$(document).ready(function(){
	var frm = $('#insertForm');
	var idCheck;
	var idReg=/^[a-z0-9]{5,20}$/;
	
	// 아이디 내용 변경될 때마다 중복 체크
	$('#id').on('change', function(){
		idCheck=false;
	})

	// 아이디 중복 조건 순서
	// 1. 아이디 조건 충족 여부 확인 -> 2. 아이디 중복 여부 확인
	
	// 1. 아이디 중복 여부 확인
	$('#id_btn').on('click', function(){	
		var id = $('#id').val();
		if(id==''){
			alert('아이디를 입력해주세요');
			return false;
		}
		
		$.ajax({
			type: "get",
			url: 'id_check/'+id,
			data: {id: id},
			dataType: "json",
			async: false, // 동기식 변경
			success: function(result){
				if(!idReg.test(id)){
					alert("아이디는 5~20자로 이뤄진 영어 소문자, 숫자로 입력해주세요.");
					$('#id').val('');
				} else{
					if(result==0){
						alert("가능한 아이디입니다.");
						idCheck=true;
					} else{
						alert("중복된 아이디입니다. 다시 설정해주세요.");
						$('#id').val('');
					}	
				}
				console.log("id체크 : "+idCheck); // true : 사용 가능한 아이디
			},
			error: function(){
				alert("error");
			}	
		})
	})
	
	$('#admin_regist').on('click', function(){
		// 유효성 검사 : 입력값 필수, 입력값 문자 제한
		// 1. 아이디 검사
		if($('#id').val()==''){
			alert('아이디를 입력해주세요.');
			return false;
		} else if(!idReg.test($('#id').val())){
			alert("아이디는 5~20자로 이뤄진 영어 소문자, 숫자로 입력해주세요.");
			return false;
		}
		// 2. 아이디 중복 여부 체크
		if(!idCheck){
			alert("아이디 중복 여부를 체크해주세요.");
			return false;
		}
		// 3. 비밀번호 : 8~16자 영문 대소문자, 숫자, 특수문자
		var pwReg = /^[A-Za-z\d@$!%*#?&]{8,16}$/;
		if($('#pw1').val()==''){
			alert('비밀번호를 입력해주세요.');
			return false;
		} else if(!pwReg.test($('#pw1').val())){
			alert('비밀번호는 8~16자 영대소문자, 숫자, 특수문자로 이뤄질 수 있습니다.');
			return false;
		} else if($('#pw2').val()!=$('#pw1').val()){
			alert('입력한 비밀번호가 맞지 않습니다. 다시 입력해주세요.');
			return false;
		}
		
		// 4. 이름
		if($('#name').val()==''){
			alert('이름을 입력해주세요.');
			return false;
		}
		
		// 5. 부서
		if($('#dept').val()==''){
			alert('부서를 선택해주세요.');
			return false;
		}
		
		// 6. 연락처
		if($('#tel').val()==''){
			alert('연락처를 입력해주세요.');
			return false;
		}
		frm.submit();
	})
})
</script>
</body>
</html>