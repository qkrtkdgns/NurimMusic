<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form id="answer_form" method="post"
	action="${pageContext.request.contextPath }/admin/one_one_answer_ok.do">
	<input type="hidden" name="id" value=${document.id } />
	<div class="input_box">
		<label>제목</label> <input type="text" name="answer_title"
			id="answer_title" value=${document.subject } />
	
	<div class="input_box">
		<label>내용</label>
		<textarea name="answer_ans" id="answer_ans" style="max-height:300px;">${document.content } </textarea>
	
	<button id="commit" type="submit" style="">답변등록</button>
	<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-left:50px; margin-bottom:10px; margin-top:10px;">취소</button>
	</div>
	</div>
</form>
