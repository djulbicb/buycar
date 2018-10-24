package com.bo.buycar.controller;

import java.util.List;

import javax.persistence.Convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.dao.ProductDao;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.product.Product;

@Controller
public class IndexController {

	@Autowired
	ProductDao productDao;
	
	@Autowired
	AdvertismentDao advertismentDao;
	
	@GetMapping("/")
	public String getIndex(@RequestParam(required=false, name="productCategory")String productCategory, Model model) {
		List<Advertisment> advertisments = advertismentDao.getAdvertismentAll();
		
		
		model.addAttribute("advertisments", advertisments);
		System.out.println(advertisments);
		
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
