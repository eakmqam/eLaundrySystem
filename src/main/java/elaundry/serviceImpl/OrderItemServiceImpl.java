package elaundry.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import elaundry.domain.OrderItem;
import elaundry.repository.OrderItemRepository;
import elaundry.service.OrderItemService;

@Service
@Transactional
public class OrderItemServiceImpl implements OrderItemService {

	@Autowired
	private OrderItemRepository orderItemRepository;
	
	public OrderItem addOrderItem(OrderItem item) {
		return orderItemRepository.save(item);
	}

	public OrderItem getOrderItemById(int id) {
		return orderItemRepository.findOne(id);
	}

	public List<OrderItem> getOrderItems() {
		return (List<OrderItem>)orderItemRepository.findAll();
	}
	
	public List<OrderItem> getOrderItemsByOrderId(int orderId) {
		return (List<OrderItem>)orderItemRepository.getOrderItemsByOrderId(orderId);
	}
}
