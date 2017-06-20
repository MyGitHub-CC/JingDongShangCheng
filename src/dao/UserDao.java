package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserDao {
	
	public User	searchById(@Param(value="uId") int uId);
	
	public User	searchByCondition(User conditionUser);
	
	public List<User> search(int begin);
	
	public int searchCount();

	public int insert(User user);

	public int update(User user);

	public int delete(@Param(value="uId") int uId);
}
