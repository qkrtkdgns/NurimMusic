$(function(){
	//전송버튼이 눌러졌을 경우의 이벤트
	$("#search_form").submit(function(){
		if(!$("#search").val()){
			alert("검색할 단어를 입력해주세요.");
			$("#search").focus();
			return false;
		}
	});
});

$(function(){
	//서브메뉴 숨기기
	$(".row > .sub").hide();
	
	$("ul > li > a > span").click(function(){
		$(".row > .sub").slideToggle(300);
	});
});