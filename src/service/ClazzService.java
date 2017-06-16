package service;

import java.util.List;

import org.springframework.stereotype.Service;

import entity.Clazz;

@Service
public interface ClazzService {

	public List<Clazz> search() ;
}
