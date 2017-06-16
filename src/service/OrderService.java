package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Cart;

@Service
public interface OrderService {
	
	public List<Cart> searchByUId(int uId);
	
	public boolean insert(int uId, List<Cart> carts, String uuId);
	
	public int delete(int uId);
	
}
