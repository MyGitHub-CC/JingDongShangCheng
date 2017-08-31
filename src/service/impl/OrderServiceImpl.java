package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.OrderService;
import dao.OrderDao;
import dao.ProductDao;
import entity.Cart;
import entity.Order;
import entity.Product;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDao orderDao;
	@Autowired
	ProductDao productDao;

	@Override
	public List<Order> searchByUId(int uId) {
		return orderDao.searchByUId(uId);
	}

	@Override
	public boolean insert(int uId, List<Cart> carts, String orderNum,int payment, int send) {
		int result1 = orderDao.insert(uId, orderNum,payment,send);
		boolean flag = true;
		if (result1 > 0) {
			Integer orderId = orderDao.searchByorderNum(orderNum);
			for (Cart cart : carts) {
				Product product = cart.getProduct();
				int result2 = orderDao.insertMProAndOrder(product,cart.getNum(), orderId);
				if (result2 < 1) {
					flag = false;
					break;
				}
			}
		}
		return flag;
	}

	@Override
	public int modify(Order order) {
		return orderDao.update(order);
	}
	
	@Override
	public int delete(int id) {
		return orderDao.delete(id);
	}

	@Override
	public int modifyById(Order order) {
		return orderDao.updateById(order);
	}

	@Override
	public List<Product> searchById(int orderId){
		return orderDao.searchById(orderId);
	}

}
