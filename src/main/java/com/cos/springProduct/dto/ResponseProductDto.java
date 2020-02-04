package com.cos.springProduct.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponseProductDto {
	
	private ResponseDto responseDto;
	
	private int id;
	private String name;
	private int price;
	private int orderCount;
	private String type;
	

}
