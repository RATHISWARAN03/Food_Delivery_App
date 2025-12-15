package com.app.dao;
import java.util.List;
import com.pojo.OrderItem;

public interface OrderItemdao {
	void addOrderItem(OrderItem orderItem);
	OrderItem getOrderItem(int orderItemId);
	void updateOrdetItem(OrderItem orderItem);
	void deleteOrderItem(int orderItemId);
	List<OrderItem> getAllOrderItem();
	public List<OrderItem> getOrderItemsByOrderId(int orderId);
}
