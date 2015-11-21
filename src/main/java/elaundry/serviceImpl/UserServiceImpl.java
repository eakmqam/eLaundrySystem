package elaundry.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import elaundry.domain.User;
import elaundry.repository.UserRepository;
import elaundry.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;
	
	public User login(User user) {
		return (User)userRepository.getUserByUsername(user.getUsername());
	}
	
	public User checkUserName(String username) {
		return (User)userRepository.getUserByUsername(username);
	}

}
