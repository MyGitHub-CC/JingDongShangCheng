package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.CategoryService;
import dao.CategoryDao;
import dao.SpeciesDao;
import entity.Category;
import entity.Species;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SpeciesDao speciesDao;
	
	@Override
	public List<Category> search() {
		return categoryDao.search();
	}
	
	@Override
	public List<Category> searchGCAndGS() {
		List<Category> categories = categoryDao.search();
		List<Species> species = speciesDao.search();
		for (Category category : categories) {
			List<Species> slist = new ArrayList<Species>();
			for (Species species2 : species) {
				if (species2.getC_id() == category.getId()) {
					slist.add(species2);
				}
			}
			category.setSpecies(slist);
		}
		return categories;
	}

}
