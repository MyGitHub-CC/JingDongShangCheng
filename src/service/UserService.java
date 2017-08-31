package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.User;
@Service
public interface UserService {
	
	public User	searchById(int id);

	public User	searchByCondition(User conditionUser);

	public List<User> search(int begin);
	
	public int searchCount();

	public int add(User user);

	public int update(User user);

	public int delete(int uId);
}
