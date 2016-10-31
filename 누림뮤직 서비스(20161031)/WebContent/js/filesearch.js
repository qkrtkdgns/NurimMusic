$(function(){
	//전송버튼이 눌러졌을 경우의 이벤트
	$(".top_search > form").submit(function(){
		if(!$(".top_search > form>input").val()){
			alert("검색할 단어를 입력해주세요.");
			$(".top_search > form>input").focus();
			return false;
		}
	});
});
