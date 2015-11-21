package elaundry.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import elaundry.domain.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer>{
	@Query("SELECT c FROM customer c where users_id = :userId")
    Customer getCustomerByUsersId(@Param("userId") int id);
	
}
