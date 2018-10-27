package com.bo.buycar.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/product")
public class ProductController {

@GetMapping("/all")
public String showAllProducts() {
	return "product/showAll";
}
	
	
	
}
