package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.ProvinceService;
import dao.ProvinceDao;
import entity.Province;

@Service
public class ProvinceServiceImpl implements ProvinceService{

	@Autowired
	ProvinceDao provinceDao;
	
	@Override
	public List<Province> search() {
		return provinceDao.search();
	}

}
