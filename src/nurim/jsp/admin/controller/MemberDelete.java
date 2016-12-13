package nurim.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.MemberService;
import nurim.jsp.admin.service.impl.MemberServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Basket;
import nurim.jsp.model.Comment;
import nurim.jsp.model.Document;
import nurim.jsp.model.Member;
import nurim.jsp.model.Order;
import nurim.jsp.service.BasketService;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.DocumentService;
import nurim.jsp.service.OrderService;
import nurim.jsp.service.impl.BasketServiceImpl;
import nurim.jsp.service.impl.CommentServiceImpl;
import nurim.jsp.service.impl.DocumentServiceImpl;
import nurim.jsp.service.impl.OrderServiceImpl;

@WebServlet("/admin/member_delete.do")
public class MemberDelete extends BaseController {
	private static final long serialVersionUID = -119449740030506798L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	// -->import org.apache.logging.log4j.Logger;
	Logger logger;
	// -->import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.mysite.service.MemberService;
	MemberService memberService;
	BasketService basketService;
	OrderService orderService;
	DocumentService documentService;
	CommentService commentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(sqlSession, logger);
		basketService = new BasketServiceImpl(sqlSession, logger);
		orderService = new OrderServiceImpl(sqlSession, logger);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		String[] temp = web.getStringArray("checkbox");
		int[] id = new int[temp.length];
		for (int i = 0; i < temp.length; i++) {
			// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
			id[i] = Integer.parseInt(temp[i]);
			logger.debug("id >> " + id[i]);
		}

		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		// 삭제할 멤버의 아이디 셋팅해주기
		Basket basket = new Basket();
		Order order = new Order();
		Document document = new Document();
		Comment comment = new Comment();

		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			// 체크한 아이디 갯수만큼 반복
			for (int i = 0; i < id.length; i++) {
				member.setId(id[i]);
				basket.setMemberId(member.getId());
				order.setMemberId(member.getId());
				document.setMemberId(member.getId());
				comment.setMemberId(member.getId());
				// 장바구니 삭제
				basketService.deleteBasket(basket);

				// 주문정보의 member_id를 null로 수정
				orderService.updateOrderByMember(order);

				// 게시글의 member_id를 null로 수정
				documentService.updateDocumentByMember(document);

				// 댓글의 member_id를 null로 수정
				commentService.updateCommentByMember(comment);

				memberService.deleteMemberByAdmin(member);
			}
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}

		// INSERT,UPDATE, DELETE 처리를 수행하는 action 페이지들은
		// 자체적으로 View를 갖지 않고 결과를 확인할 수 있는
		// 다른페이지로 강제 이동시켜야 한다. (중복실행 방지)
		// 그러므로 View의 경로를 리턴하지 않는다.
		web.redirect(web.getRootPath() + "/admin/member.do", null);
		return null;
	}

}
