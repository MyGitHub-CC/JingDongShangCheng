package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Product;

public interface ProductDao {

	public List<Product> search(int begin);
	
	public List<Product> searchByUId(int uId);
	
	public int searchCount(@Param(value="cId")int cId);
	
	public List<Product> searchProsAndPubs(@Param(value="cId")int cId, @Param(value="begin")int begin);
	
	public Product searchById(@Param(value="proId")int proId);

	public int insert(Product product);

	
}
