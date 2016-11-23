<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
      <%@include file="inc/head.jsp" %>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Community.css" />

      <style type="text/css">

      </style>

   </head>
   <body>

<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
         <div id="content">
            <!--youtube 플레이어 시작 -->
            <div id="youtube_box">
               <div class="youtube">
                 <iframe width="760" height="430" src="https://www.youtube.com/embed/l1hxg1rY17I" frameborder="0" allowfullscreen></iframe>
               </div>
               <div class="youtube_list">
                  <ul>
                     <li><a href="#"><img src="https://i.ytimg.com/vi/l1hxg1rY17I/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=mtgLbEshX0xOSSrh-xdXt7izdbQ" />
                     </a><span><b>아이오아이</b><br/>
                    <p>네임 <br/>조회수 ??</p></span></li>
                     <li>
                     <a href="#">
                     <img src="https://i.ytimg.com/vi/WJua7KEP_oE/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=iYhQ_e0K1httmeGiBO43kcsVcJg" /></a><span><b>샤이니</b><br/>
                     <p>네임 <br/>조회수 ??</p></span></li>
                     <li><a href="#"><img src="https://i.ytimg.com/vi/QslJYDX3o8s/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=4CwqSdyeZLBPoaY8KZu1OReJ9s0" />
                    </a><span><b>레드벨벳</b><br/>
                     <p>네임 <br/>조회수 ??</p></span></li>
                     <li><a href="#"><img src="https://i.ytimg.com/vi/tbe3pe2BtwA/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=kSDeHnaY-iJUKvQzrfG8cRTabF0" /></a><span><b>엑소</b><br/>
                     <p>네임 <br/>조회수 ??</p></span></li>
                  </ul>
               </div>
            </div>
            <!--youtube 플레이어 끝 -->

            <!--토론광장 & 회원리뷰 영역 시작 -->
            <div id="comm_main_foot">

              <div class="dis_comm">

              <!-- 자세히 보러가기 버튼 -->
            <div class="dis_btn">
            <a class="btn btn-default" href="${pageContext.request.contextPath }/discussion.do" role="button">자세히 보러가기 &raquo;</a>
            </div>
            <!-- //자세히 보러가기 버튼 끝 -->

                <h2>토론광장</h2>
                <table class="dis_table">
                  <colgroup>
                      <col width="320" />
                      <col width="110" />
                      <col width="90" />
                      <col width="80" />
                      <col width="80" />
                      <col width="80" />
                  </colgroup>

           <thead>
            <tr>
              <th scope="col" class="text-center">제목</th>
              <th scope="col" class="text-center">작성일</th>
              <th scope="col" class="text-center">토론 종료일</th>
              <th scope="col" class="text-center">조회수</th>
              <th scope="col" class="text-center">찬성</th>
              <th scope="col" class="text-center">반대</th>
            </tr>
    
          </thead>

          <tbody>
            <tr>
              <td class="cont_sub" >
                <a href="${pageContext.request.contextPath }/discussion_write_result.do">비투비짱</a>
              </td>
              <td class="cont_date">2016.10.10</td>
              <td class="cont_datec">2016.10.17</td>
              <td class="cont_view">0</td>
              <td class="cont_ag">0</td>
              <td class="cont_disag">0</td>
            </tr>

            <tr>
              <td class="cont_sub">
                <a href="${pageContext.request.contextPath }/discussion_write_result.do">샤이니짱</a>
              </td>
              <td class="cont_date">2016.10.03</td>
              <td class="cont_datec">2016.10.10</td>
              <td class="cont_view">0</td>
              <td class="cont_ag">0</td>
              <td class="cont_disag">0</td>
            </tr>

            <tr>
              <td class="cont_sub">
                <a href=${pageContext.request.contextPath }/discussion_write_result.do>ㅂㅂㅂ</a>
              </td>
              <td class="cont_date">2016.09.28</td>
              <td class="cont_datec">2016.10.05</td>
              <td class="cont_view">4</td>
              <td class="cont_ag">0</td>
              <td class="cont_disag">0</td>
            </tr>

            <tr>
              <td class="cont_sub">
                <a href=${pageContext.request.contextPath }/discussion_write_result.do>ㅇㅇㅇ</a>
              </td>
              <td class="cont_date">2016.09.28</td>
              <td class="cont_datec">2016.10.05</td>
              <td class="cont_view">10</td>
              <td class="cont_ag">0</td>
              <td class="cont_disag">0</td>
            </tr>

            <tr>
              <td class="cont_sub">
                <a href=${pageContext.request.contextPath }/discussion_write_result.do>ㅇㅇㅇ</a>
              </td>
              <td class="cont_date">2016.09.28</td>
              <td class="cont_datec">2016.10.05</td>
              <td class="cont_view">10</td>
              <td class="cont_ag">0</td>
              <td class="cont_disag">0</td>
            </tr>

            <tr>
              <td class="cont_sub">
                <a href=${pageContext.request.contextPath }/discussion_write_result.do>ㅇㅇㅇ</a>
              </td>
              <td class="cont_date">2016.09.28</td>
              <td class="cont_datec">2016.10.05</td>
              <td class="cont_view">10</td>
              <td class="cont_ag">0</td>
              <td class="cont_disag">0</td>
            </tr>

          </tbody>
            </table>

             </div>

              <div class="review_comm">
                <h2>회원리뷰</h2>
                <div class="rv_list1">

                  <span class="thumb">
                  <a href="${pageContext.request.contextPath }/Review_write_result.do">
                  <img src="${pageContext.request.contextPath }/img/rv_11.png">
                  </a>
                  </span>
                  <div class="rev_text">
                  <a href="${pageContext.request.contextPath }/Review_write_result.do">
                  <span class="rev_sub">방탄소년단 정규2집 WINGS</span><br></a>
                  <span class="user_id">
                  회원ID - 바구주 <br>
                  </span>
                  <span class="rev_desc">인트로 홉이 랩이 나날이 늘어가고 있는 것 같아 뿌듯하고 대단하다 앞으로 얼마나 더 발전할지
                  피땀눈물 평소하던 스타일과 다른 섹시미 뿜뿜 뭐든 잘 소화해내서v
                  대단해 그리고 항상 느끼는건데 가장 트렌디한걸 먼저
                  시도하는것같아 결과는 항상 성공적 대단해
                  </span>
                </div>
                </div>

                 <div class="rv_list2">

                 <span class="thumb">
                 <a href="${pageContext.request.contextPath }/Review_write_result.do">
                 <img src="${pageContext.request.contextPath }/img/rv_22.png">
                 </a>
                 </span>
                 <div class="rev_text">
                 <a href="${pageContext.request.contextPath }/Review_write_result.do">
                 <span class="rev_sub">믿고 들어보는 대장나무 노래</span><br>
                 </a>
                 <span class="user_id">
                  회원ID - gzgzg <br>
                  </span>
                 <span class="rev_desc">금방 주문했고요.....미리 공개된 숨...은 들어봤습니다.
                 들을수록 빨려드는 잔잔하게들리는 음색이 여전히 매력적인 효신님 노래...
                 앨범 도착하면 평 다시 올릴께요....
                 중간에 창법도 조금 바뀌고 좀더 성숙한 이미지로 돌아온 대장나무님...
                 이번 앨범도 많이 사랑해주세요~^^ 15일 콘서트도 기대됩니다 @.@
                 개인적으로 음반보다 라이브가 강한 갓효신~!!!!!!!  기대해도 좋습니다~
                 </span>
                </div>
                </div>
              </div>
         </div>
      <!-- //토론광장 & 회원리뷰 영역 끝 -->
      </div>

<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>


     <script type="text/javascript">
       $(function(){
          $(".youtube_list >ul> li:nth-child(1) img").click(function(){
            $(".youtube > iframe").attr("src","https://www.youtube.com/embed/l1hxg1rY17I");
            return false;
          });
          $(".youtube_list >ul> li:nth-child(2) img").click(function(){
            $(".youtube > iframe").attr("src","https://www.youtube.com/embed/WJua7KEP_oE");
   return false;
          });
          $(".youtube_list >ul> li:nth-child(3) img").click(function(){
            $(".youtube > iframe").attr("src","https://www.youtube.com/embed/QslJYDX3o8s");
   return false;
          });
          $(".youtube_list >ul> li:nth-child(4) img").click(function(){
            $(".youtube > iframe").attr("src","https://www.youtube.com/embed/tbe3pe2BtwA");
   return false;
          });
       });
      </script>

   </body>
</html>