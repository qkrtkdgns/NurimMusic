<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div id="top">
	<a href="${pageContext.request.contextPath}/admin/main.do">Admin</a>
	</div>
	<!-- 왼쪽 카테고리 start -->
	<div id="category">
	<div class="category">
	<b>Category</b>
	<ul>
	<li class="glyphicon glyphicon-cog">&nbsp;<a href="${pageContext.request.contextPath}/admin/member.do"><span>회원관리</span></a>
	</li>
	<li class="glyphicon glyphicon-cog">&nbsp;<a href="#" class=" bt_on"><span>고객센터관리</span></a>
	<ul>
	<li><a href="${pageContext.request.contextPath}/admin/one_one.do">1:1답변관리</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/info.do">공지사항</a></li>
	</ul>
	</li>
	<li class="glyphicon glyphicon-cog">&nbsp;<a href="#" class=" bt_on"><span>커뮤니티관리</span></a>
	<ul>
	<li><a href="${pageContext.request.contextPath}/admin/user_review.do">회원리뷰</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/debate.do">토론광장</a></li>
	</ul>
	</li>
	<li class="glyphicon glyphicon-cog">&nbsp;<a href="#" class=" bt_on"><span>상품관리</span></a>
	<ul>
	<li><a href="${pageContext.request.contextPath}/admin/item_list.do">상품수정/삭제</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/insert_item.do">신규상품등록</a></li>
	</ul>
	</li>
	<li class="glyphicon glyphicon-cog">&nbsp;<a href="${pageContext.request.contextPath}/admin/order_management.do"><span>주문관리</span></a>
	</li>
	<li class="glyphicon glyphicon-cog">&nbsp;<a href="${pageContext.request.contextPath}/admin/comment.do"><span>댓글관리</span></a>	</li>
	</ul>
	</div>
	</div>
	<!-- 왼쪽 카테고리 end -->