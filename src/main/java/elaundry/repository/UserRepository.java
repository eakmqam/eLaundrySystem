package elaundry.repository;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



import elaundry.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>
{
	User getUserByUsername(String username);
    
}
