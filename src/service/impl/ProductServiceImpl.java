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
	public List<Product> search() {
		return productDao.search();
	}

	@Override
	public List<Product> searchByUId(int uId) {
		return productDao.searchByUId(uId);
	}
	
	@Override
	public int searchCount() {
		return productDao.searchCount();
	}
	
	@Override
	public List<Product> searchProsAndPubs(int begin) {
		return productDao.searchProsAndPubs(begin);
	}

	@Override
	public Product searchById(int id) {
		return productDao.searchById(id);
	}

}
