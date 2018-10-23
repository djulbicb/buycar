package com.bo.buycar.controller;

import javax.persistence.Convert;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {

	@GetMapping("/")
	public String getIndex() {
		return "index";
	}
	
	@GetMapping("/register")
	public String getRegister() {
		return "general/register";
	}
	
	@GetMapping("/login")
	public String getLogin(@RequestParam(name="logout", required=false) String logout, @RequestParam(name="error", required=false) String error, Model model) {
		if (error != null) {
			model.addAttribute("msg", "Invalid username and password");
		}

		if (logout!= null) {
			model.addAttribute("msg", "You logged out sucesfully");
		}
		return "general/login";
	}
}
