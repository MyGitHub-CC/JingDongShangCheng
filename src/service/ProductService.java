package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Product;
@Service
public interface ProductService {
	
	public List<Product> search(int begin);
	
	public List<Product> searchByUId(int uId);
	
	public List<Product> searchProsAndPubs(int cId, int begin);
	
	public Product searchById(int id);

	public int searchCount(int cId);

	public int insert(Product product);
	
}
