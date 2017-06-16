package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.OrderService;
import dao.OrderDao;
import dao.ProductDao;
import entity.Cart;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDao orderDao;
	@Autowired
	ProductDao productDao;

	@Override
	public List<Cart> searchByUId(int uId) {
		return null;
	}

	@Override
	public boolean insert(int uId, List<Cart> carts, String uuId) {
		boolean flag = true;
		for (int i = 0; i < carts.size(); i++) {
			Cart cart = carts.get(i);
			int result = orderDao.insert(uId,cart.getProduct(),cart.getNum(), uuId);
			if (result <=0) {
				flag = false;
				break;
			}
		}
		return flag;
	}

	@Override
	public int delete(int uId) {
		return 0;
	}

}
