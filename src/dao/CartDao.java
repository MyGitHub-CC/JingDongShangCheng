package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Cart;

public interface CartDao {
	
	public List<Cart> searchByUId(@Param(value="uId")int uId);
	
	public int insert(@Param(value="uId")int uId, @Param(value="proId")int proId,@Param(value="num") int num);
	
	public int update(@Param(value="uId")int uId, @Param(value="proId")int proId,@Param(value="num") int num);

	public Cart searchByUIdAndProId(@Param(value="uId")int uId, @Param(value="proId")int proId);

	public int delete(@Param(value="uId")int uId, @Param(value="proId")int proId);

	public List<Cart> searchByUIdAndProIds(@Param(value="uId")int uId, @Param(value="proIds")String proIds);

	public int deleteByUIdAndProIds(@Param(value="uId")int uId, @Param(value="proIds")String proIds);

}
