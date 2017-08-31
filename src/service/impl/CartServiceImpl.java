package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.CartService;
import dao.CartDao;
import dao.ProductDao;
import dao.UserDao;
import entity.Cart;
import entity.Product;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDao cartDao;
	@Autowired
	UserDao userDao;
	@Autowired
	ProductDao productDao;

	@Override
	public List<Cart> searchByUId(int uId) {
		List<Cart> carts = cartDao.searchByUId(uId);
		for (int i = 0; i < carts.size(); i++) {
			Product product = carts.get(i).getProduct();
			if (product != null) {
				int proId = product.getId();
				product = productDao.searchById(proId);
				carts.get(i).setProduct(product);
			}
		}
		return carts;
	}

	@Override
	public int insert(int uId, int proId, int num) {
		int result = 0;
		Cart cart = cartDao.searchByUIdAndProId(uId, proId);
		if (cart == null) {
			result = cartDao.insert(uId, proId, num);
		} else {
			int oldNum = cart.getNum();
			num += oldNum;
			result = cartDao.update(uId, proId, num);
		}
		return result;
	}
	
	@Override
	public int update(int uId, int proId, int num) {
		return cartDao.update(uId, proId, num);
	}

	@Override
	public int delete(int uId, Integer[] proIds) {
		String proIdsString = "(";
		for (int i = 0; i < proIds.length; i++) {
			if (i != proIds.length - 1) {
				proIdsString += proIds[i] + ", ";
			} else {
				proIdsString += proIds[i] ;
			}
		}
		proIdsString += ")";
		return cartDao.delete(uId, proIdsString);
	}

	@Override
	public List<Cart> searchByUIdAndProIds(int uId, String[] proIds) {
		String proIdString = "(";
		for (int i = 0; i < proIds.length; i++) {
			if (i != proIds.length - 1) {
				proIdString += proIds[i] + ", ";
			} else {
				proIdString += proIds[i] ;
			}
		}
		proIdString += ")";
		List<Cart> carts = cartDao.searchByUIdAndProIds(uId, proIdString);
		for (int i = 0; i < carts.size(); i++) {
			Product product = carts.get(i).getProduct();
			if (product != null) {
				int proId = product.getId();
				product = productDao.searchById(proId);
				carts.get(i).setProduct(product);
			}
		}
		return carts;
	}

	@Override
	public int deleteByUIdAndProIds(int uId, List<Product> products) {
		String proIdString = "(";
		for (int i = 0; i < products.size(); i++) {
			if (i != products.size() - 1) {
				proIdString += products.get(i).getId() + ", ";
			} else {
				proIdString +=  products.get(i).getId() ;
			}
		}
		proIdString += ")";
		int result = cartDao.deleteByUIdAndProIds(uId, proIdString);
		return result;
	}

}
