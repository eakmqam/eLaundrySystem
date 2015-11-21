package elaundry.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import elaundry.domain.LaundryService;

@Repository
public interface LaundryServiceRepository extends CrudRepository<LaundryService, Integer> {
	
}
