package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;

import service.UserService;
import entity.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;

	@Override
	public User searchById(int id) {
		return userDao.searchById(id);
	}

	@Override
	public User searchByCondition(User conditionUser) {
		return userDao.searchByCondition(conditionUser);
	}
}
