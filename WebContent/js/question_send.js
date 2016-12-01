$(function(){
  //id 속성이 question_send인 <form> 태그 안의 submit 버튼을 누른 경우
  $("#question_send").submit(function(){
    /**상담유형 선택 검사 */
    if($("select[name='qna_type'] > option:selected").index() < 1){
      alert("상담유형을 선택해 주세요.");
      $("select[name='qna_type']").focus();
      return false;
    }

    /**이름 검사 */
    if(!$("input[name='name']").val()){
      alert("이름을 입력해 주세요.");
      $("input[name='name']").focus();
      return false;
    }

    /**연락처 검사 */
    if(!$("input[name='tel']").val()){
      alert("연락처를 입력해 주세요.");
      $("input[name='tel']").focus();
      return false;
    }

    /** 이메일 검사 */
    if(!$("input[name='email']").val()){
      alert("email을 입력해 주세요.");
      $("input[name='email']").focus();
      return false;
    }

    /** 제목 검사 */
    if(!$("input[name='title']").val()){
      alert("제목을 입력해 주세요.");
      $("input[name='title']").focus();
      return false;
    }

    /** 내용 검사 */
    if(!$("input[name='information']").val()){
      alert("문의 내용을 입력해 주세요.");
      $("input[name='information']").focus();
      return false;
    }

    alert("문의 내용이 정상적으로 등록되었습니다.");
  });
});
