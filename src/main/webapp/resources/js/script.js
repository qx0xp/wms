$(document).ready(function(){
    // 카테고리 업다운
    $('.ctg>li a').click(function(){
        let display = $(this).siblings('.ctg_detail').css('display');

        if(display == 'block'){
            $(this).siblings('.ctg_detail').slideUp(300);
            $(this).removeClass('on');
        } else{
            $('.ctg>li a').siblings('.ctg_detail').slideUp(300);
            $('.ctg>li a').removeClass('on');
            $(this).siblings('.ctg_detail').slideDown(300);
            $(this).addClass('on');
        }
    })
    
    // 창고에 따른 구역 불러오기
	$('#storageBox').on("change",function(){
		var stg = $('#storageBox').val();
		console.log(stg);
		sub(stg);
	})
	
	function sub(stg){
		$.getJSON("/ovolo/sub/"+stg+".json", function(data){
			$('#storageAreaBox').children('option:not(:first)').remove();
			
	        var opt = "";
	        for(var i=0; i<data.length; i++){
	        	var obj = data[i].storageArea_name;   
		        opt = "<option value='" + obj + "'>" + obj + "구역" + "</option>";
		       	$("#storageAreaBox").append(opt);
	        }
		})
	}
    
    // 페이징
    var actionForm=$("#actionForm");
	// 현재 페이지 번호 클릭 시, form 태그 안에 있는 값 가져와라
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})
	
	// 검색 버튼 클릭 시, page 1로 변경
	$("input[type='submit']").on("click",function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val("1");
		
		// 날짜 유효성 검사
    	if(($('#datepicker1').val()==''&&$('#datepicker2').val()!='')||($('#datepicker1').val()!=''&&$('#datepicker2').val()=='')){
    		alert("날짜 입력을 다시 해주세요.");
    		return false;
    	}
    	
		actionForm.submit();
	})
	
	// 품목코드 팝업창 열기
	$('#rawBtn').on("click", function(){
		window.open("itemcode", "itemcodeWin", "top=250px, left=620px, width=650, height=580");
	})
	
	// 거래처코드 팝업창 열기
	$('#clientBtn').on("click", function(){
		window.open("clientcode", "clientWin", "top=250px, left=620px, width=500, height=620");
	})
})