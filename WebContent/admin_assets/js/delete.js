$(function(){
  $("#delete").click(function(){
    if($("input[type='checkbox']").is(":checked")){
      var result = confirm("정말 삭제하시겠습니까?");
      if(result){
        alert("삭제완료");
      }
    }else{
      alert("삭제할 데이터를 선택해주세요.");
    }
  });
});
