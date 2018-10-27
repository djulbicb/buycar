package com.bo.buycar.controller.rest;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bo.buycar.model.product.ProductImage;
import com.bo.buycar.service.CartService;

@RestController
@RequestMapping("/rest/cart")
public class CartController {

	@Autowired
	CartService cartService;
	
	@RequestMapping("/add/{advertismentId}")
	@PostMapping
	public String addCartItem(@PathVariable("advertismentId") int advertismentId, Principal principal) {
		System.out.println("POST");
		cartService.addCartItem(principal.getName(), advertismentId);
		
		return "gotovo";
	}
	
}
