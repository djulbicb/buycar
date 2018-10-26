package com.bo.buycar.controller.rest;

import java.security.Principal;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bo.buycar.model.product.ProductImage;

@RestController
@RequestMapping("/rest/cart")
public class CartController {

	@RequestMapping("/add/{advertismentId}")
	@PostMapping
	public String getImage(@PathVariable("advertismentId") int advertismentId, Principal principal) {
		System.out.println("POST");
		
		
		return "gotovo";
	}
	
}
