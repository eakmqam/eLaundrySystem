package elaundry.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import elaundry.domain.OrderItem;

@Repository
public interface OrderItemRepository extends CrudRepository<OrderItem, Integer> {
	
	@Query("SELECT oi FROM orderitem oi WHERE orderId = :orderId")
	List<OrderItem> getOrderItemsByOrderId(@Param("orderId") int orderId);
}
