$(function(){
  $("#insert_commit").click(function(){
      if($("#insert_id").val() == ''){
        alert("아이디를 입력하세요.");
        return false;
      }
      if($("#insert_title").val() == ''){
        alert("제목을 입력하세요.");
        return false;
      }
      if($("#insert_content").val() == ''){
        alert("내용을 입력하세요.");
        return false;
      }
    });
    $("#update_commit").click(function(){
        if($("#update_id").val() == ''){
          alert("아이디를 입력하세요.");
          return false;
        }
        if($("#update_title").val() == ''){
          alert("제목을 입력하세요.");
          return false;
        }
        if($("#update_content").val() == ''){
          alert("내용을 입력하세요.");
          return false;
        }
      });
});
