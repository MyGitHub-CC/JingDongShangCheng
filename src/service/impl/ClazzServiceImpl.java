package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.ClazzService;
import dao.ClazzDao;
import entity.Clazz;

@Service
public class ClazzServiceImpl implements ClazzService{

	@Autowired
	ClazzDao clazzDao;
	
	@Override
	public List<Clazz> search() {
		
		return clazzDao.search();
	}

}
