

package elaundry.repository;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import elaundry.domain.Address;

@Repository
public interface AddressRepository extends CrudRepository<Address, String>
{
    @Query("SELECT a FROM ADDRESS a")
    List<Address> getAllAddresses();
}
