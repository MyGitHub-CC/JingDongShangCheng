package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Cart;
import entity.Product;

@Service
public interface CartService {
	
	public List<Cart> searchByUId(int uId);
	
	public int insert(int uId, int proId, int num);
	
	public int update(int uId, int proId, int num);

	public int delete(int uId, Integer[] proIds);

	public List<Cart> searchByUIdAndProIds(int uId, String[] proIds);

	public int deleteByUIdAndProIds(int uId, List<Product> products);
	
}
