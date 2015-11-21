package elaundry.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import elaundry.domain.SOrder;

@Repository
public interface SOrderRepository extends CrudRepository<SOrder, Integer> {

	@Modifying
	@Transactional
	@Query("UPDATE serviceorder SET orderStatus=:orderStatus WHERE sorder_id=:orderId")
	public void updateOrderStatus(@Param("orderStatus") String orderStatus, @Param("orderId") int orderId);
}
