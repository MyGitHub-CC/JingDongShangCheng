package service;

import org.springframework.stereotype.Service;

import entity.User;
@Service
public interface UserService {
	
	public User	searchById(int id);

	public User	searchByCondition(User conditionUser);
	
}
