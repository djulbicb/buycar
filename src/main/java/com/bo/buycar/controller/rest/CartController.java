package com.bo.buycar.controller.rest;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bo.buycar.model.product.ProductImage;
import com.bo.buycar.service.CartService;

// REST Client for adding items into cart from the index page
// CartItems are saved to MySQL database
@RestController
@RequestMapping("/rest/cart")
public class CartController {

	@Autowired
	CartService cartService;
	
	@RequestMapping("/add/{advertismentId}")
	@PostMapping
	@ResponseBody
	public String addCartItem(@PathVariable("advertismentId") int advertismentId, Principal principal) {
		// Returns if item is added or if it is already in cart
		String msg = cartService.addCartItem(principal.getName(), advertismentId);
		return msg;
	}
	
	@RequestMapping("/remove/{cartItemId}")
	@PostMapping
	public String removeCartItem(@PathVariable("cartItemId") int cartItemId, Principal principal) {
		cartService.removeCartItem(principal.getName(), cartItemId);
		return "Removed";
	}
	
}
