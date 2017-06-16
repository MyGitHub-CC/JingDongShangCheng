package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Cart;

@Service
public interface CartService {
	
	public List<Cart> searchByUId(int uId);
	
	public int insert(int uId, int proId, int num);
	
	public int update(int uId, int proId, int num);

	public int delete(int uId, int proId);

	public List<Cart> searchByUIdAndProIds(int uId, String[] proIds);

	public boolean deleteByUIdAndProIds(int uId, List<Cart> carts);
	
}
