package elaundry.service;

import java.util.List;

import elaundry.domain.SOrder;

public interface SOrderService {
	SOrder addOrder(SOrder order);
	SOrder getOrderById(int id);
	List<SOrder> getOrders();
	void updateOrderStatus(String status, int orderId);
}