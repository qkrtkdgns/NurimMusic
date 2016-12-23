<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>


<form  method="post"  action="${pageContext.request.contextPath}/admin/comment_delete_ok.do"  id="comment_delete_form">
<input type="hidden" name="comment_id"  id="commen_id" value="${comment.id}" />
		<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
		aria-label="Close"><span aria-hideen="true">&times;</span></button>
				<h4 class="modal-title">덧글삭제</h4>
				
		</div>
		<div class="modal-body" style="width:200px; margin:50px auto ">
	
				<p>정말 이 덧글을 삭제하시겠습니까?</p>
		
		
		<div class="form-group">
			<button type="submit" class='btn btn-danger btn-block' >삭제하기</button>
			<button type="button" class='btn btn-primary btn-block'  data-dismiss="modal">삭제취소</button>
		</div>
	
	</div>
</form>

