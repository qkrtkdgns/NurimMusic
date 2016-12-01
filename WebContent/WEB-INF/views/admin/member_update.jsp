<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
 
		<form method="post" id="update_form" action="${pageContext.request.contextPath }/admin/member_update_ok.do">
		<input type="hidden" name="id" id="id" value="${member.id }" />
		<div class="control_box2 form-group">
			<div class="input_box">
			<label>아이디</label>			
			<input type="text" name="user_id" id="user_id" value="${member.userId }"/>
			</div>
			<div class="input_box">
			<label>비밀번호</label>
			<input type="password" name="user_pw" id="user_pw" />
			</div>
			<div class="input_box">
			<label>이름</label>
			<input type="text" name="user_name" id="user_name" value="${member.userName }"/>
			</div>
			<div class="input_box">
			<label>성별</label>
			<select name="user_gender" id="user_gender">
				<option value="">---성별을 선택해 주세요---</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select>
			</div>
			<div class="input_box" style="height:120px;">
			<label>주소</label>
			<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" style="width:100px;" value="${member.postcode }"/> 
			<input type="button" id="sample6_execDaumPostcode" value="우편번호 찾기" style="width:100px;"/>
			<input type="text" name="address" id="sample6_address" placeholder="주소" style="margin-left:100px; margin-top:8px;" value="${member.addr1 }"/>
			<input type="text" name="address_sub" id="sample6_address2"	placeholder="상세주소" style="margin-left:100px; margin-top:8px;" value="${member.addr2 }"/>
			</div>
			<div class="input_box">
			<label>생년월일</label>
			<input type="text" name="user_birthdate" id="user_birthdate" value="${member.birthdate }" />
			</div>
			<div class="input_box">
			<label>전화번호</label>
			<input type="tel" name="user_tel" id="user_tel" value="${member.tel }" />
			</div>
			<div class="input_box">
			<label>이메일</label>
			<input type="email" name="user_email" id="user_email" value="${member.email }"/>
			</div>
			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			<button type="submit" id="update_commit">등록</button>
			</div>
			</form>