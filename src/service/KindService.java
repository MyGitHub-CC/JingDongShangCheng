package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Kind;
@Service
public interface KindService {

	public List<Kind> search() ;
	
	public List<Kind> searchByCId(int cId) ;
	
	public List<Kind> searchKindAndClazz(int cId) ;
}
