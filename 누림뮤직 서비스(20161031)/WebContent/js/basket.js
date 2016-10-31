$("#all_check").change(function(){
  var is_check=$(this).is(":checked");

  $(".item_checked").prop("checked", is_check);
});
$(".delete").click(function(){
  if(confirm("삭제하시겠습니까?")){
    alert("삭제되었습니다.");
  }
});
$(".update").click(function(){
  if(confirm("수정하시겠습니까?")){
    alert("수정되었습니다.");
  }
});