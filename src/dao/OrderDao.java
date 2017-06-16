package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Cart;
import entity.Product;

public interface OrderDao {
	
	public List<Cart> searchByUId(@Param(value="uId")int uId);
	
	public int insert(@Param(value="uId")int uId, @Param(value="product")Product product, @Param(value="num") int num,@Param(value="uuId") String uuId);
	
	public int delete(@Param(value="uId")int uId);

}
