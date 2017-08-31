package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Order;
import entity.Product;

public interface OrderDao {
	
	public List<Order> searchByUId(@Param(value="uId")int uId);
	
	public Integer searchByorderNum(@Param(value="orderNum")String orderNum);
	
	public int insert(@Param(value="uId")int uId, @Param(value="orderNum") String orderNum
			,@Param(value="payment")int payment,@Param(value="send")int send);
	
	public int insertMProAndOrder(@Param(value="product")Product product,@Param(value="num")int num,
			@Param(value="orderId")int orderId);
	
	public int update(Order order);
	
	public int updateById(Order order);
	
	public int delete(@Param(value="uId")int uId);

	public List<Product> searchById(int orderId);

}
