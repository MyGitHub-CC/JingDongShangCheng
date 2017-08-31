package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Cart;
import entity.Order;
import entity.Product;

@Service
public interface OrderService {
	
	public List<Order> searchByUId(int uId);
	
	public boolean insert(int uId, List<Cart> carts, String orderNum,int payment,int send);
	
	public int modify(Order order);
	
	public int delete(int id);

	public int modifyById(Order order);

	public List<Product> searchById(int orderId);

}
