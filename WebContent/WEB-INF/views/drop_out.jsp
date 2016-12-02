<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/drop_out.css">
		
	<script type="text/javascript">
	$(function(){
		$("#drop_out").click(function(){
		    if(confirm("정말로 탈퇴하시겠습니까?")==true){
		    	$(location).attr("href","${pageContext.request.contextPath}/drop_out_ok.do");
		    }else{
		      alert("취소되었습니다.");
		    }
		  });	
	});
    
		</script>
	</head>
	<body>
 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
			<div id="content">
        <!-- 제목 -->
        <div class="cont_sub">
				<h2>마이페이지 |&nbsp;</h2><h3>회원탈퇴</h3>
        <hr/>
        </div>

        <!-- 본문 내용 start -->
        <div class="drop_cont">
        <p>
          <h3 style="padding-top:0px;">제 1 장 총 칙</h3>
            <span class="tit">제1조 목적</span>
            <p>
                본 약관은 서비스 이용자가 주식회사 누림뮤직(이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한 유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하 같습니다)에 회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스 이용자를 말합니다. 이하 “회원”이라고 합니다)의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.
            </p>
      
            <span class="tit">제 2 조 (약관의 명시, 효력 및 개정)</span>
            <ol class="list_terms">
                <li>
                    <span class="txt_num">①</span>
                    <p class="txt_clause">회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.</p>
                </li>
                <li>
                    <span class="txt_num">②</span>
                    <p class="txt_clause">회사는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p>
                </li>
                <li>
                    <span class="txt_num">③</span>
                    <p class="txt_clause">회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간 동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로 개정약관을 발송하여 고지합니다.</p>
                </li>
                <li>
                    <span class="txt_num">④</span>
                    <p class="txt_clause">회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 제17조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.</p>
                </li>
            </ol>
            </span>

            <h3>제2장 회원의 가입 및 관리</h3>
            <span class="tit">제 3 조 (회원가입절차)</span>
            <ol class="list_terms">
                <li>
                    <span class="txt_num">①</span>
                    <p class="txt_clause">서비스 이용자가 본 약관을 읽고 “동의” 버튼을 누르거나 “확인” 등에 체크하는 방법을 취한 경우 본 약관에 동의한 것으로 간주합니다.</p>
                </li>
                <li>
                    <span class="txt_num">②</span>
                    <p class="txt_clause">회사의 서비스 이용을 위한 회원가입은 서비스 이용자가 제1항과 같이 동의한 후, 회사가 정한 온라인 회원가입 신청서에 회원 ID를 포함한 필수사항을 입력하고, “등록하기” 내지 “확인” 단추를 누르는 방법으로 합니다. 다만, 회사가 필요하다고 인정하는 경우 회원에게 별도의 서류를 제출하도록 할 수 있습니다.</p>
                </li>
                <li>
                    <span class="txt_num">③</span>
                    <p class="txt_clause">법인고객 회원가입의 경우 회원가입 신청서의 제출, 서비스 이용대금의 납부 이외에 회사가 정하는 추가 서류의 제출이 추가적으로 필요합니다.</p>
                </li>
                <li>
                    <span class="txt_num">④</span>
                    <p class="txt_clause">법인고객 회원가입의 경우 서비스 이용자와 이용요금 납입자가 다를 경우 회사는 이를 확인하기 위하여 제 증명을 요구할 수 있습니다.</p>
                </li>
            </ol>
            <span class="tit">제 4 조 (회원등록의 성립과 유보 및 거절)</span>
            <ol class="list_terms">
                <li>
                    <span class="txt_num">①</span>
                    <p class="txt_clause">회원등록은 제3조에 정한 절차에 의한 서비스 이용자의 회원가입 신청과 회사의 회원등록 승낙에 의하여 성립합니다. 회사는 회원가입 신청자가 필수사항 등을 성실히 입력하여 가입신청을 완료하였을 때에는 필요한 사항을 확인한 후 지체 없이 이를 승낙을 하여야 합니다. 단 회원가입 신청서 제출 이외에 별도의 자료 제출이 요구되는 경우에는 예외로 합니다.</p>
                </li>
                <li>
                    <span class="txt_num">②</span>
                    <p class="txt_clause">회사는 아래 각 호의 1에 해당하는 경우에는 회원등록의 승낙을 유보할 수 있습니다.</p>
                    <ol class="list_2depth">
                        <li>1. 제공서비스 설비용량에 현실적인 여유가 없는 경우</li>
                        <li>2. 서비스를 제공하기에는 기술적으로 문제가 있다고 판단되는 경우</li>
                        <li>3. 법인 고객으로 가입신청을 하고 제3조 제3항 내지 제4항의 의무를 이행하지 않은 경우</li>
                        <li>4. 기타 회사가 재정적, 기술적으로 필요하다고 인정하는 경우</li>
                    </ol>
                </li>
                <li>
                    <span class="txt_num">③</span>
                    <p class="txt_clause">회사는 아래 각 호의 1에 해당하는 경우에는 회원등록을 거절할 수 있습니다.</p>
                    <ol class="list_2depth">
                        <li>1. 가입신청서의 내용을 허위로 기재하였거나 허위서류를 첨부하여 가입신청을 하는 경우</li>
                        <li>2. 법인 고객으로 가입신청을 하고 회사가 별도로 규정하는 일정한 기간 이내에 제3조 제3항 내지 제4항의 의무를 이행하지 않은 경우</li>
                        <li>3. 14세 미만의 아동이 개인정보제공에 대한 동의를 부모 등 법정대리인으로부터 받지 않은 경우</li>
                        <li>4. 기타 회사가 관련법령 등을 기준으로 하여 명백하게 사회질서 및 미풍양속에 반할 우려가 있음을 인정하는 경우</li>
                        <li>5. 제17조 제2항에 의하여 회사가 계약을 해지했던 회원이 다시 회원 신청을 하는 경우</li>
                    </ol>
                </li>
            </ol>
            <span class="tit">제 5 조 (회원 ID 등의 관리책임)</span>
            <ol class="list_terms">
                <li>
                    <span class="txt_num">①</span>
                    <p class="txt_clause">회원은 서비스 이용을 위한 회원 ID, 비밀번호의 관리에 대한 책임, 본인 ID의 제3자에 의한 부정사용 등 회원의 고의∙과실로 인해 발생하는 모든 불이익에 대한 책임을 부담합니다. 단, 이것이 회사의 고의∙과실로 인하여 야기된 경우는 회사가 책임을 부담합니다.</p>
                </li>
                <li>
                    <span class="txt_num">②</span>
                    <p class="txt_clause">회원은 회원 ID, 비밀번호 및 추가정보 등을 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 본인의 비밀번호를 수정하는 등의 조치를 취하여야 하며 즉시 이를 회사에 통보하여 회사의 안내를 따라야 합니다.</p>
                </li>
            </ol>
            <span class="tit">제 6 조 (개인정보의 수집 등)</span>
            <p>회사는 서비스를 제공하기 위하여 관련 법령의 규정에 따라 회원으로부터 필요한 개인정보를 수집합니다.</p>
            <span class="tit">제 7 조 (회원정보의 변경)</span>
            <p>회원은 아래 각 호의 1에 해당하는 사항이 변경되었을 경우 즉시 회원정보 관리페이지에서 이를 변경하여야 합니다. 이 경우 회사는 회원이 회원정보를 변경하지 아니하여 발생한 손해에 대하여 책임을 부담하지 아니하며, 법인 회원의 경우에는 회사가 별도로 정하는 방법으로 변경할 수 있습니다.</p>
            <ol class="list_2depth">
                <li>1. 생년월일, 거주지역 및 연락처 등</li>
                <li>2. 우편/경품 수신 주소, 취미•관심사 등</li>
                <li>3. 서비스별 뉴스레터 수신 여부 등</li>
                <li>4. 기타 회사가 인정하는 사항</li>
            </ol>
            <h3>제3장 서비스의 이용</h3>
            <span class="tit">제 8 조 (서비스 이용)</span>
            <ol class="list_terms">
                <li>
                    <span class="txt_num">①</span>
                    <p class="txt_clause">서비스 이용은 회사의 서비스 사용승낙 직후부터 가능합니다. 다만, 유료 서비스의 경우 회사가 요금납입을 확인한 직후부터 가능하게 할 수 있습니다.</p>
                </li>
                <li>
                    <span class="txt_num">②</span>
                    <p class="txt_clause">민법상 미성년자인 회원이 유료 서비스를 이용할 경우 미성년자인 회원은 결제 전 법정대리인의 동의를 얻어야 합니다.</p>
                </li>
                <li>
                    <span class="txt_num">③</span>
                    <p class="txt_clause">서비스 이용시간은 회사의 업무상 또는 기술상 불가능한 경우를 제외하고는 연중무휴 1일 24시간(00:00-24:00)으로 함을 원칙으로 합니다. 다만, 서비스설비의 정기점검 등의 사유로 회사가 서비스를 특정범위로 분할하여 별도로 날짜와 시간을 정할 수 있습니다.</p>
                </li>
            </ol>
            <span class="tit">제 9 조 (서비스내용변경 통지 등)</span>
            <ol class="list_terms">
                <li>
                    <span class="txt_num">①</span>
                    <p class="txt_clause">회사가 서비스 제공을 위해 계약한 CP(Contents Provider)와의 계약종료, CP의 변경, 신규서비스의 개시 등의 사유로 서비스 내용이 변경되거나 서비스가 종료되는 경우 회사는 회원의 등록된 전자우편 주소로 이메일을 통하여 서비스 내용의 변경 사항 또는 종료를 통지할 수 있습니다.</p>
                </li>
                <li>
                    <span class="txt_num">②</span>
                    <p class="txt_clause">전항의 경우 불특정 다수인을 상대로 통지를 함에 있어서는 웹사이트 기타 회사의 공지사항 페이지를 통하여 회원들에게 통지할 수 있습니다. 단, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항은 상당한 기간 동안 게시판을 통해 이를 공지하고 회사가 부여한 이메일 주소로 개별통지 합니다.</p>
                </li>
                <li>
                    <span class="txt_num">③</span>
                    <p class="txt_clause">유료 서비스가 종료되는 경우에는 서비스를 이용하는 회원에게 반드시 제1항의 규정에 따라 이메일을 통하여 이를 고지하며 제16조 제4항의 규정에 따라 환불 처리합니다.</p>
                </li>
            </ol>
            <span class="tit">제 10 조 (권리의 귀속 및 저작물의 이용)</span>
            <ol class="list_terms">
                <li>
                    <span class="txt_num">①</span>
                    <p class="txt_clause">회원이 서비스 내에 게시한 게시물 등(이하 "게시물 등"이라 합니다)의 저작권은 해당 게시물의 저작자에게 귀속됩니다.</p>
                </li>
                <li>
                    <span class="txt_num">②</span>
                    <p class="txt_clause">게시물 등은 회사가 운영하는 인터넷 사이트 및 모바일 어플리케이션을 통해 노출될 수 있으며, 검색결과 내지 관련 프로모션 등에도 노출될 수 있습니다. 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법 규정을 준수하며, 회원은 언제든지 고객센터 또는 각 서비스 내 관리기능을 통해 해당 게시물 등에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.</p>
                </li>
                <li>
                    <span class="txt_num">③</span>
                    <p class="txt_clause">회사는 제2항 이외의 방법으로 회원의 게시물 등을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 회원의 동의를 얻습니다. </p>
                </li>
            </ol>

        </p>
        </div>
        <!--본문 내용 end-->

        <!--탈퇴 버튼 start -->
        <input type="button" id="drop_out" value="회원탈퇴" />
        <!--탈퇴 버튼 end -->


	</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>




	</body>
</html>
