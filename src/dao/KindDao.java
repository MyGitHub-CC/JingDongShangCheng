package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Kind;

public interface KindDao {

	public List<Kind> search();

	public List<Kind> searchByCId(@Param(value="cId")int cId);

}
