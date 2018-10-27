package com.bo.buycar.controller.rest;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bo.buycar.model.product.ProductImage;
import com.bo.buycar.service.CardService;
import com.bo.buycar.service.CartService;

@RestController
@RequestMapping("/rest/card")
public class CardController {

	@Autowired
	CardService cardService;
	
	@RequestMapping("/getBalance/{cartId}")
	@GetMapping
	public String getCurrentBalance(@PathVariable("cartId") int cartId, Principal principal) {
		System.out.println("POST");
		
		return "gotovo";
	}
	
}
