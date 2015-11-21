package elaundry.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import elaundry.domain.LaundryItem;

@Repository
public interface LaundryItemRepository extends CrudRepository<LaundryItem, Integer> {
	
	@Query("SELECT si FROM laundryitem si where service_id = :serviceId")
	List<LaundryItem> getLaundryItemsByServiceId(@Param("serviceId") int serviceId);
}
