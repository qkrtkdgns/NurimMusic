$(function(){
	$("#all_check").change(function(){

  var is_check=$(this).is(":checked");

  $(".item_checked").prop("checked", is_check);
});
});