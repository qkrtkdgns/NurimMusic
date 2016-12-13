package nurim.jsp.basecontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

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
import nurim.jsp.service.MemberService;
import nurim.jsp.service.OrderService;
import nurim.jsp.service.impl.BasketServiceImpl;
import nurim.jsp.service.impl.CommentServiceImpl;
import nurim.jsp.service.impl.DocumentServiceImpl;
import nurim.jsp.service.impl.MemberServiceImpl;
import nurim.jsp.service.impl.OrderServiceImpl;

@WebServlet("/drop_out_ok.do")
public class drop_out_ok extends BaseController {
	private static final long serialVersionUID = 6067632631266018752L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	BasketService basketService;
	OrderService orderService;
	DocumentService documentService;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		basketService = new BasketServiceImpl(sqlSession, logger);
		orderService = new OrderServiceImpl(sqlSession, logger);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		Member member = (Member) web.getSession("loginInfo");
		logger.debug("member >> " + member);
		//삭제할 멤버의 아이디 셋팅해주기
		Basket basket = new Basket();
		Order order = new Order();
		Document document = new Document();
		Comment comment = new Comment();
		
		basket.setMemberId(member.getId());
		order.setMemberId(member.getId());
		document.setMemberId(member.getId());
		comment.setMemberId(member.getId());
		
		try{
			//장바구니 삭제
			basketService.deleteBasket(basket);
			
			//주문정보의 member_id를  null로 수정
			orderService.updateOrderByMember(order);
			
			//게시글의 member_id를  null로 수정
			documentService.updateDocumentByMember(document);
			
			//댓글의 member_id를  null로 수정
			commentService.updateCommentByMember(comment);
			
			//회원 삭제			
			memberService.deleteMember(member);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}

		web.redirect(web.getRootPath()+"/index.do", "회원탈퇴를 성공했습니다.");
		
		return null;
	}
}
