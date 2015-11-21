package elaundry.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import elaundry.domain.Customer;
import elaundry.repository.CustomerRepository;
import elaundry.service.CustomerService;


@Service
@Transactional
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerRepository customerRepository;


	public List<Customer> getAllCustomers() {
		// TODO Auto-generated method stub
		return (List<Customer>)customerRepository.findAll();
	}
	
	public void addCustomer(Customer customer) {
		//DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		//Date myDate = formatter.parse(customer.getDateOfBirth());
		//java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());.
		//customer.setDateOfBirth(new java.sql.Date((new Date()).getTime()));
		customerRepository.save(customer);
	}
	
	public Customer getCustomerById(int id) {
		return (Customer)customerRepository.findOne(id);
	}
	
	public Customer getCustomerByUserId(int id) {
		return (Customer)customerRepository.getCustomerByUsersId(id);
	}

}
