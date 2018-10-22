package com.bo.buycar.controller;

import javax.persistence.Convert;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@GetMapping("/")
	public String getIndex() {
		return "index";
	}
	
	@GetMapping("/login")
	public String getLogin() {
		return "general/login";
	}
}
