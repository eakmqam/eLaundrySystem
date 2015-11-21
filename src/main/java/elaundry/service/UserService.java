package elaundry.service;

import elaundry.domain.User;


public interface UserService {
	public User login(User user);
	public User checkUserName(String username);
}
