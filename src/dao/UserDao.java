package dao;

import entity.User;

public interface UserDao {
	
	public User	searchById(int id);
	
	public User	searchByCondition(User conditionUser);
	
}
