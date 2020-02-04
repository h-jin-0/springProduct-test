package com.cos.springProduct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cos.springProduct.dto.ResponseProductDto;
import com.cos.springProduct.repository.ProductRepository;

@Controller
@RequestMapping("/list")
public class ListController {

	@Autowired
	private ProductRepository productRepository;

	@GetMapping({ "", "/" })
	public String List(Model model) {
		List<ResponseProductDto> products = productRepository.findAll();

		model.addAttribute("products", products);

		return "/list/list";
	}

	@GetMapping("/api/listAll")
	public ResponseEntity<?> listApiAll() {

		List<ResponseProductDto> products = productRepository.findAll();
		
		return new ResponseEntity<List<ResponseProductDto>>(products, HttpStatus.CREATED);

	}

	@GetMapping("/api/listKitchen")
	public ResponseEntity<?> listApiKitchen() {

		List<ResponseProductDto> products = productRepository.findAllType("주방용품");
		
		return new ResponseEntity<List<ResponseProductDto>>(products, HttpStatus.CREATED);

	}
	
	@GetMapping("/api/listFood")
	public ResponseEntity<?> listApiFood() {

		List<ResponseProductDto> products = productRepository.findAllType("음식");
		
		return new ResponseEntity<List<ResponseProductDto>>(products, HttpStatus.CREATED);

	}
	
	@GetMapping("/api/orderbyPrice/{btnstatus}")
	public ResponseEntity<?> orderbyfood(@PathVariable int btnstatus) {
		System.out.println(btnstatus);
		List<ResponseProductDto> products=null;
		if(btnstatus==1) {
			 products = productRepository.OrderByAllByPrice();
		}else if(btnstatus==2){
			System.out.println("dddd");
			products = productRepository.OrderByPrice("주방용품");
		}else if(btnstatus==3){
			 products = productRepository.OrderByPrice("음식");
		}

		return new ResponseEntity<List<ResponseProductDto>>(products, HttpStatus.CREATED);
	}
	@GetMapping("/api/orderbyOrderCount/{btnstatus}")
	public ResponseEntity<?> orderbyOrderCount(@PathVariable int btnstatus) {
		System.out.println(btnstatus);
		List<ResponseProductDto> products=null;
		if(btnstatus==1) {
			 products = productRepository.OrderByAllByOrderCount();
		}else if(btnstatus==2){
			products = productRepository.OrderByOrderCount("주방용품");
		}else if(btnstatus==3){
			 products = productRepository.OrderByOrderCount("음식");
		}

		return new ResponseEntity<List<ResponseProductDto>>(products, HttpStatus.CREATED);
	}
}
