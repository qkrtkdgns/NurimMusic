package nurim.jsp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Order;
import nurim.jsp.service.OrderService;

public class OrderServiceImpl implements OrderService {
	SqlSession sqlSession;
	Logger logger;

	public OrderServiceImpl(SqlSession sqlSession, Logger logger) {
		super();
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public List<Order> selectOrderList(Order member) throws Exception {
		List<Order> result = null;

		try {
			result = sqlSession.selectList("OrderMapper.selectOrderList", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderPrevPay(Order member) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderPrevPay", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderNextPay(Order member) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderNextPay", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderPrevDelivery(Order member) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderPrevDelivery", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderNextDelivery(Order member) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderNextDelivery", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderCount(Order member) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderCount", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderCancel(Order member) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderCancel", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderChange(Order member) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderChange", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderReaper(Order member) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderReaper", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<Order> selectOrderList2(Order member) throws Exception {
		List<Order> result = null;

		try {
			result = sqlSession.selectList("OrderMapper.selectOrderList2", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderCount2(Order member) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderCount2", member);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectOrderCountAll(Order order) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderCountAll", order);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<Order> selectOrderListAll(Order order) throws Exception {
		List<Order> result = null;

		try {
			result = sqlSession.selectList("OrderMapper.selectOrderListAll", order);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void deleteOrder(Order order) throws Exception {
		try{
			int result = sqlSession.delete("OrderMapper.deleteOrder",order);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void insertOrder(Order order) throws Exception {
		try{
			int result = sqlSession.insert("OrderMapper.insertOrder",order);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문을 저장할 수 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문저장에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void updateProduct(Order order) throws Exception {
		try{
			int result = sqlSession.update("OrderMapper.updateProduct",order);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("상품의 수량 감소를 할 수 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("상품의 수량감소에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void updateOrder(Order order) throws Exception {
		try{
			int result = sqlSession.update("OrderMapper.updateOrder",order);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문상태를 변경할 수 없습니다..");
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문상태 변경에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void updateOrderByMember(Order order) throws Exception {
		try{
			sqlSession.update("OrderMapper.updateOrderByMember",order);
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("주문목록 변경에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

}
