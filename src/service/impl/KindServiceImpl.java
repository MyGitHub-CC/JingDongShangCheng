package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.KindService;
import dao.ClazzDao;
import dao.KindDao;
import entity.Clazz;
import entity.Kind;


@Service
public class KindServiceImpl implements KindService{

	@Autowired
	KindDao kindDao;
	@Autowired
	ClazzDao clazzDao;
	
	@Override
	public List<Kind> search() {
		return kindDao.search();
	}

	@Override
	public List<Kind> searchByCId(int cId) {
		return kindDao.searchByCId(cId);
	}

	@Override
	public List<Kind> searchKindAndClazz(int cId) {
		List<Kind> kinds = kindDao.searchByCId(cId);
		List<Clazz> clazzs = clazzDao.search();
		for (Kind kind : kinds) {
			List<Clazz> clist = new ArrayList<Clazz>();
			for (Clazz clazz2 : clazzs) {
				if (clazz2.getK_id() == kind.getId()) {
					clist.add(clazz2);
				}
			}
			kind.setClazzs(clist);
		}
		return kinds;
	}
	
}
