package elaundry.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import elaundry.domain.SOrder;
import elaundry.repository.SOrderRepository;
import elaundry.service.SOrderService;

@Service
@Transactional
public class SOrderServiceImpl implements SOrderService {
	
	@Autowired
	private SOrderRepository orderRepository;
	
	public SOrder addOrder(SOrder order) {
		return orderRepository.save(order);
	}

	public SOrder getOrderById(int id) {
		return orderRepository.findOne(id);
	}

	public List<SOrder> getOrders() {
		return (List<SOrder>)orderRepository.findAll();
	}
	
	public void updateOrderStatus(String status, int orderId) {
		orderRepository.updateOrderStatus(status, orderId);
	}
}
