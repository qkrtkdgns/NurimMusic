package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Order;

public interface OrderService {

	/**
	 * 주문정보를 조회한다(입금대기,결제완료,배송준비중,배송완료)
	 * @param member
	 * @return
	 * @throws Exception
	 */
	List<Order> selectOrderList(Order member) throws Exception;
	/**
	 * 주문정보를 조회한다.(주문취소,교환,반품)
	 * @param member
	 * @return
	 * @throws Exception
	 */
	List<Order> selectOrderList2(Order member) throws Exception;
	/**
	 * 입금대기 건수를 확인한다.(최소값)
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderPrevPay(Order member) throws Exception;
	/**
	 * 결제완료 건수를 확인한다.(최대값)
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderNextPay(Order member) throws Exception;
	/**
	 * 배송준비중 건수를 확인한다.(주문정보)
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderPrevDelivery(Order member) throws Exception;
	/**
	 * 배송완료 건수를 확인한다.(주문정보)
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderNextDelivery(Order member) throws Exception;
	/**
	 * 페이지의 총 게시물 수를 확인한다(주문정보)
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderCount(Order member) throws Exception;
	/**
	 * 주문취소 수를 확인한다.
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderCancel(Order member) throws Exception;
	/**
	 * 교환 수를 확인한다.
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderChange(Order member) throws Exception;
	/**
	 * 반품 수를 확인한다.
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderReaper(Order member) throws Exception;
	/**
	 * 페이지 수를 확인한다(주문취소)
	 * @param member
	 * @return
	 * @throws Exception
	 */
	int selectOrderCount2(Order member) throws Exception;
	/**
	 * 관리자페이지에서 확인할  전체 페이지 수를 확인한다.(memberId 참조 안함)
	 * @param order
	 * @return
	 * @throws Exception
	 */
	int selectOrderCountAll(Order order) throws Exception;
	/**
	 * 관리자페이지에서 확인할 전체 페이지 목록을 확인한다 (memberId 참조 안함)
	 * @param order
	 * @return
	 * @throws Exception
	 */
	List<Order> selectOrderListAll(Order order) throws Exception;
	/**
	 * 주문목록을 삭제한다.
	 * @param order
	 * @throws Exception
	 */
	void deleteOrder(Order order) throws Exception;
	/**
	 * 주문목록을 추가한다.
	 * @param order
	 * @throws Exception
	 */
	void insertOrder(Order order) throws Exception;
	/**
	 * 상품의 수량을 감소한다.
	 * @param order
	 * @throws Exception
	 */
	void updateProduct(Order order) throws Exception;
	/**
	 * 주문목록 상태를 수정한다.
	 * @param order
	 * @throws Exception
	 */
	void updateOrder(Order order) throws Exception;

}
