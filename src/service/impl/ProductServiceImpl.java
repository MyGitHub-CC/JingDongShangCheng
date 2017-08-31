package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProductDao;

import entity.Product;

import service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDao productDao;

	@Override
	public List<Product> search(int begin) {
		return productDao.search(begin);
	}

	@Override
	public List<Product> searchByUId(int uId) {
		return productDao.searchByUId(uId);
	}
	
	@Override
	public int searchCount(int cId) {
		return productDao.searchCount(cId);
	}
	
	@Override
	public List<Product> searchProsAndPubs(int cId, int begin) {
		return productDao.searchProsAndPubs(cId,begin);
	}

	@Override
	public Product searchById(int id) {
		return productDao.searchById(id);
	}

	@Override
	public int insert(Product product) {
		return productDao.insert(product);
	}

}
