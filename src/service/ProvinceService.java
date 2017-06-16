package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Province;

@Service
public interface ProvinceService {

	public List<Province> search() ;
}
