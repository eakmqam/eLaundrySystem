package elaundry.service;

import java.util.List;
import elaundry.domain.OrderItem;

public interface OrderItemService {
	OrderItem addOrderItem(OrderItem item);
	OrderItem getOrderItemById(int id);
	List<OrderItem> getOrderItems();
	List<OrderItem> getOrderItemsByOrderId(int orderId);
}
