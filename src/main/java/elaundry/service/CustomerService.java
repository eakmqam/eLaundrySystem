package elaundry.service;

import java.util.List;

import elaundry.domain.Customer;


public interface CustomerService {
	public void addCustomer(Customer customer);
	public List<Customer> getAllCustomers();
	public Customer getCustomerById(int id);
	public Customer getCustomerByUserId(int id);
}
