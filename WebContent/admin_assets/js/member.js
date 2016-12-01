$(function(){
$("#insert_commit").click(function(){
    if($("#insert_user_id").val() == ''){
      alert("아이디를 입력하세요.");
      return false;
    }
    if($("#insert_user_pw").val() == ''){
      alert("비밀번호를 입력하세요.");
      return false;
    }
    if($("#insert_user_name").val() == ''){
      alert("이름을 입력하세요.");
      return false;
    }
    if($("#insert_user_gender").val() == ''){
      alert("성별을 입력하세요.");
      return false;
    }
    if($("#insert_user_home").val() == ''){
      alert("주소를 입력하세요.");
      return false;
    }
    if($("#insert_user_tel").val() == ''){
      alert("전화번호를 입력하세요.");
      return false;
    }
    if($("#insert_user_email").val() == ''){
      alert("이메일을 입력하세요.");
      return false;
    }
    });
$("#update_commit").click(function(){
        if($("#update_user_id").val() == ''){
          alert("아이디를 입력하세요.");
          return false;
        }
        if($("#update_user_pw").val() == ''){
          alert("비밀번호를 입력하세요.");
          return false;
        }
        if($("#update_user_name").val() == ''){
          alert("이름을 입력하세요.");
          return false;
        }
        if($("#update_user_gender").val() == ''){
          alert("성별을 입력하세요.");
          return false;
        }
        if($("#update_user_home").val() == ''){
          alert("주소를 입력하세요.");
          return false;
        }
        if($("#update_user_tel").val() == ''){
          alert("전화번호를 입력하세요.");
          return false;
        }
        if($("#update_user_email").val() == ''){
          alert("이메일을 입력하세요.");
          return false;
        }
        });
});
