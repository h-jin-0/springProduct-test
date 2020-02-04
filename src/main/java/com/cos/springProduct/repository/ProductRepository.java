package com.cos.springProduct.repository;

import java.util.List;

import com.cos.springProduct.dto.ResponseProductDto;

public interface ProductRepository {
	List<ResponseProductDto> findAll();
	
	List<ResponseProductDto> findAllType(String type);
	
	List<ResponseProductDto> OrderByAllByPrice();
	List<ResponseProductDto> OrderByAllByOrderCount();
	
	List<ResponseProductDto> OrderByPrice(String type);
	List<ResponseProductDto> OrderByOrderCount(String type);
	
	
}
