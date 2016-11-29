<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="inc/head.jsp"%>
<%@include file="inc/picker.jsp"%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user_information.css" />

</head>
<body>
	<%@include file="inc/top_nav.jsp"%>
	<div class="ddd"></div>
	<!-- 본문내용 작성 start -->
	<div id="content">
		<h2>마이페이지&nbsp;|&nbsp;</h2>
		<h3 style="color: gray;">회원 정보 수정</h3>
		<hr />
		<div class="user_change">
			<form method="post" action="${pageContext.request.contextPath }/user_information_ok.do">
				<table>
					<tbody>
						<tr>
							<th><p>아이디</p></th>
							<td><input type="text" name="user_id" id="user_id" value="${loginInfo.userId }"/></td>
						</tr>
						<tr>
							<th><p>이름</p></th>
							<td><input type="text" name="user_name" id="user_name" value="${loginInfo.userName }"/></td>
						</tr>
						<tr>
							<th><p>현재비밀번호</p></th>
							<td><input type="password" name="user_pw" id="user_pw"
								placeholder="기존 정보 수정 시 입력해주세요." /></td>
						</tr>
						<tr>
							<th><p>새 비밀번호</p></th>
							<td><input type="password" name="user_pw_re" id="user_pw_re"
								placeholder="기존 정보 수정 시 입력해주세요." /></td>
						</tr>
						<tr>
							<th><p>새 비밀번호 확인</p></th>
							<td><input type="password" name="user_pw_re_check" id="user_pw_re_check"
								placeholder="기존 정보 수정 시 입력해주세요." /></td>
						</tr>
						<tr>
							<th><p>생년월일</p></th>
							<td><input type="text" name="birthdate" id="birthdate"
							placeholder="생년월일을 선택해 주세요." value="${loginInfo.birthdate }">
							</td>
						</tr>
						<tr>
							<th><p>성별</p></th>
							<td>
								<c:choose>
								<c:when test="${loginInfo.gender =='M' }">
								<input type="radio" name="gender" id="gender" value="M"
								alt="남자" checked/>남자 <input type="radio" name="gender" id="gender"
								value="F" alt="여자" />여자
								</c:when>
								<c:otherwise>
								<input type="radio" name="gender" id="gender" value="M"
								alt="남자" />남자 <input type="radio" name="gender" id="gender"
								value="F" alt="여자" checked/>여자
								</c:otherwise>
								</c:choose>
								</td>
						</tr>
						<tr>
							<th><p>이메일 주소</p></th>
							<td><input type="text" name="email" id="email" value="${loginInfo.email }"/></td>
						</tr>
						<tr>
							<th><p>휴대폰 번호</p></th>
							<td><input type="tel" name="tel" id="tel" value="${loginInfo.tel }" /></td>
						</tr>
						<tr>
							<th rowspan="3"><p>주소</p></th>
							<td><input type="text" name="postcode" id="sample6_postcode"
								placeholder="우편번호" value="${loginInfo.postcode }"> <input type="button"
								id="sample6_execDaumPostcode" value="우편번호 찾기"></td>
						</tr>
						<tr>
							<td><input type="text" name="address" id="sample6_address" placeholder="주소" value="${loginInfo.addr1 }"></td>
						</tr>
						<tr>
							<td><input type="text" name="address_sub" id="sample6_address2"
								placeholder="상세주소" value="${loginInfo.addr2 }"></td>
						</tr>
					</tbody>
				</table>
				<div class="ext_bt">
					<button type="submit" class="btn btn-primary">수정하기</button>
					<a href="mypage.do"><button type="button"
							class="btn btn-default">취소</button></a>
				</div>
			</form>
		</div>
	</div>
	<!--본문내용 작성 end -->

	<%@include file="inc/footer.jsp"%>
	<script
		src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js?autoload=false"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	$(function(){
		$('#birthdate').pickadate({
			  formatSubmit: 'yyyy/mm/dd',
			  hiddenName: true,
			  selectMonths:true,
			  selectYears:200,
			});
		
		$("#sample6_execDaumPostcode").click(function(){
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