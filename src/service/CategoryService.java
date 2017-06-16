package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Category;
@Service
public interface CategoryService {

	public List<Category> search() ;
	
	public List<Category> searchGCAndGS() ;
}
