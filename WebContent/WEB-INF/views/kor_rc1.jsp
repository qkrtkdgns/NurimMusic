<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/kor_sub.css"/>

	</head>
	<body>

 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
         <div id="content">
         <h2>국내음반</h2><hr>
         <!--사이드 메뉴-->
         <%@include file="inc/category.jsp" %>
         <!-- end 사이드 메뉴-->
		<div class="goods_list">
				<div class="list-topbar">
					<div class="check_list">
						체크한 음반
						<a href="#" class="btn btn-default btn-sm">장바구니 담기</a>
						<a href="#" class="btn btn-default btn-sm">관심상품</a>
					</div>
					<div class="search_list">
						<a href="#">발매일</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">높은가격</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">낮은가격</a>
					</div>
				</div>

				<div class="list_lineup">
					<ul>
						<li>
							<table >
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image01.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">2PM - 6집 [GENTLEMEN'S GAME] (LP VER.)
								</span></a>
								<span class="substance">JYP ENTERTAINMENT | 2016.12.30 | LP</span>
								</td>
								<th width="183"><p class="price1">42,500원</p>
								<p class="price2">34,300원</p>
								</th>
								
								<th class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</th>
								
								</tr>
								
							</table>
						</li>
						<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image02.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">크루셜스타 (CRUCIAL STAR) - FALL 2 (4TH 미니앨범)
								</span></a>
								<span class="substance">(주)로엔엔터테인먼트 | 2016.11.01 | CD</span>
								</td>
								<td width="183"><p class="price1">14,000원</p>
								<p class="price2">11,900원</p></td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>
						<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image03.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">지민 안 (JIMIN AN) - 스물아홉 (JIMIN AN - 29)
								</span></a>
								<span class="substance">(주)윈드밀이엔티 | 2016.10.28 | CD</span>
								</td>
								<td width="183"><p class="price1">9,500원</p>
								<p class="price2">7,400원</p></td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>
							<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image04.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">심연 - 1집 [두 개의 달이 떠오른 도시]
								</span></a>
								<span class="substance">(주)윈드밀이엔티 | 2016.10.28 | CD</span>
								</td>
								<td width="183"><p class="price1">14,500원</p>
								<p class="price2">12,500원</p>
								</td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>
						<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image05.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">후니아 (HOONIA) - EXHIBITION (1ST 미니앨범)
								</span></a>
								<span class="substance">케이티뮤직 | 2016.10.28 | CD<</span>
								</td>
								<td width="183"><p class="price1">12,500원</p>
								<p class="price2">10,400원</p></td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>
							<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image06.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">아스트로너츠 (ASTRONUTS) - PALE BLUE DOT
								</span></a>
								<span class="substance">(주)미러볼뮤직 | 2016.10.28 | CD</span>
								</td>
								<td width="183"><p class="price1">11,000원</p>
								<p class="price2">8,900원</p></td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>
							<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image07.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">따로 또 같이 - 2집 (LP) (TAROTOGATCHI - VOL.2 (LP))
								</span></a>
								<span class="substance">비트볼뮤직 | 2016.10.27 | LP</span>
								</td >
								<td width="183"><p class="price1">43,000원</p>
								<p class="price2">35,800원</p></td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>
							<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image08.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">해진 & 와우털 (HAEJIN & WOUTER) - WRONG DISTANCE (LP)
								</span></a>
								<span class="substance">비트볼뮤직 | 2016.10.27 | LP</span>
								</td>
								<td width="183"><p class="price1">37,800원</p>
								<p class="price2">31,400원</p></td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>
							<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image09.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">카운터 리셋 (COUNTER RESET) - 4집 [COUNTER RESET]
								</span></a>
								<span class="substance">케이티뮤직 | 2016.10.27 | CD</span>
								</td>
								<td width="183"><p class="price1">14,000원</p>
								<p class="price2">11,900원</p></td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>

							<li>
							<table>
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/list_image10.jpg"></a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">클라프 (KLAFF) - THE DREAMER
								</span></a>
								<span class="substance">(주)드림비트 | 2016.10.27 | CD</span>
								</td>
								<td width="183"><p class="price1">8,000원</p>
								<p class="price2">5,900원</p></td>
								
								<td class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</td>
								
								</tr>
								
							</table>
						</li>
								


					</ul>
					</div>
			<div class="page_num">
			<ul class="pagination pagination-mg">
			<li class="disabled"><a href="#">&laquo;</a></li>
			<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
			</ul>
				
			</div>
			</div>
	
</div>

<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
		 <script type="text/javascript">
    	
	$(function(){
    			var sell= false;

    			if(sell==false){
    			$(".list_lineup > ul > li > table #A1").hide();
    			$(".list_lineup > ul > li > table #B1").hide();
    			}else{
    			$(".list_lineup > ul > li > table #A").hide();
    			$(".list_lineup > ul > li > table #B").hide();
    			}

    		});

    	
		</script>

	</body>
</html>
