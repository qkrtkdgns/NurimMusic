package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Order;

public interface OrderService {

	List<Order> selectOrderList(Order member) throws Exception;
	
	List<Order> selectOrderList2(Order member) throws Exception;

	int selectOrderPrevPay(Order member) throws Exception;

	int selectOrderNextPay(Order member) throws Exception;

	int selectOrderPrevDelivery(Order member) throws Exception;

	int selectOrderNextDelivery(Order member) throws Exception;

	int selectOrderCount(Order member) throws Exception;

	int selectOrderCancel(Order member) throws Exception;

	int selectOrderChange(Order member) throws Exception;

	int selectOrderReaper(Order member) throws Exception;

}
