<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<%@include file="inc/picker.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Join2.css" />
		<style type="text/css">
	
		


		</style>

	</head>
	<body>
<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
			<div id="content">
			<p> * => 필수 입력사항</p>
			
			<form name="myform" method="post" action="${pageContext.request.contextPath}/join_ok.do">
				<div class="join_substance">
					<div class="join_substance1">
					<br>
				
					<table class="Sub">
						<tr>
							<td class="title">아이디<font color="red">*</font></td>
							<td ><input  id="user_id" type="text" placeholder="아이디는 4~16자 내외입니다." name="user_id"  minlength="4" maxlength="16">
							<hr/>
							</td>
							
						</tr>
						
						<tr>
							<td class="title">비밀번호<font color="red">*</font></td>
							<td><input type="password" size="30" name="user_pw" id="user_pw" minlength="4" maxlength="16"
							placeholder="비밀번호는 4~16자 내외입니다."></td>
							
						</tr>
						<tr height="4"></tr>
						<tr>
							<td class="title">비밀번호 확인<font color="red">*</font></td>
							<td><input type="password" size="30" name="user_pw_re" id="user_pw_re" minlength="4" maxlength="16"
							placeholder="비밀번호는 4~16자 내외입니다."><hr/></td>
						</tr>
						<tr>
							<td class="title">이름</td>
							<td><input type="text" name="user_name" id="user_name">
						</tr>
						<tr height="4"></tr>
						<tr>
							<td class="title">성별</td>
							<td><input type="radio" name="gender" id="gender" value="M">&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="gender" id="gender" value="F">&nbsp;여자</td>
						</tr>
						<tr height="4"></tr>
						<tr>
							<td class="title">생년월일</td>
							<td><input type="text" name="birthdate" id="birthdate" maxlength="8" size="20" placeholder="생년월일을 선택하세요."><hr/></td>
						</tr>

						<tr>
							<td class="title">이메일<font color="red">*</font></td>
							<td><input type="email" size="30" name="email" id="email" minlength="8" placeholder="이메일을 입력해주세요."></td>
						</tr>
						<tr height="4"></tr>
						<tr>
							<td class="title">우편번호<font color="red">*</font></td>
							<td><input type="text" name="postcode" id="sample6_postcode">
							<input type="button" id="sample4_execDaumPostcode" name="chk_ad" value="주소찾기">
							</td>
						</tr>
						<tr height="4"></tr>
						<tr>
							<td class="title">주소<font color="red">*</font></td>
							<td><input type="text"  name="address" size="30" id="sample6_address"
							placeholder="주소"></td>
						</tr>
						<tr height="4"></tr>
						<tr>
							<td class="title">상세 주소<font color="red">*</font></td>
							<td><input type="text"  name="address_sub" size="63" id="sample6_address2" placeholder="상세주소를 입력해주세요."/><hr/></td>
						</tr>

						<tr>
							<td class="title">연락처<font color="red">*</font></td>
							<td><input type="tel" name="tel" id="tel" placeholder="'-'없이 작성해주세요."></td>
						</tr>
					</table>
					<br>
					</div>

				</div>
				<div class="join_button">
					<button type="submit" ><img src="${pageContext.request.contextPath }/img/btn_join.gif"></button>
					<button type="reset" ><img src="${pageContext.request.contextPath }/img/btn_back.gif"></button>
						
							<a href="#" id="NO"></a>	
					</div>
			</form>
</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

		
		<script type="text/javascript">

		$(function(){
			$('#birthdate').pickadate({
				  formatSubmit: 'yyyy/mm/dd',
				  hiddenName: true,
				  selectMonths:true,
				  selectYears:200,
				});
			$("#sample4_execDaumPostcode").click(function(){
       		 new daum.Postcode({
            oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    });

		
	
		});
		</script>
	</body>
</html>
