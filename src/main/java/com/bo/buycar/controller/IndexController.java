package com.bo.buycar.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.persistence.Convert;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.dao.ProductDao;
import com.bo.buycar.dao.UserDao;
import com.bo.buycar.service.AdvertismentService;
import com.bo.buycar.service.ProductService;
import com.bo.buycar.service.UserService;
import com.bo.buycar.dto.PageList;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.Role;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.auth.UserStatus;
import com.bo.buycar.model.product.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

@Controller
public class IndexController {

	@Autowired
	ProductService productService;
	
	@Autowired
	AdvertismentService advertismentService;
		
	@Autowired
	UserService userService;	
	
	
	@GetMapping("/")
	public String getIndex(@RequestParam(required=false, name="productCategory", defaultValue="")String productCategory, @RequestParam(defaultValue="0", name="page") int page, Model model) {
		//List<Advertisment> advertisments = advertismentService.getAdvertismentAll();
		
		
		PageList pageList = advertismentService.getAdvertismentAll(productCategory,page);
		model.addAttribute("currentPage",page);
		
		System.out.println(pageList);
		model.addAttribute("advertisments", pageList.getListAdvertisments());
		model.addAttribute("pageList", pageList);
		
		if (!productCategory.equals("")) {
			productCategory = "productCategory=" + productCategory ;
		}
		model.addAttribute("productCategory", productCategory);
		
		
		return "index";
	}
	
	@GetMapping("/register")
	public String getRegister(Model model) {
		model.addAttribute("user", new User());
		return "general/register";
	}
	
	
	@PostMapping("/register")
	public String postRegister(Model model, @Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			return "general/register";
		}
		
		if (userService.findIfEmailExists(user.getEmail())) {
			model.addAttribute("emailError", "Email already exists, enter new user");
			return "general/register";
		}
		
		if (userService.findIfUsernameExists(user.getUsername())) {
			model.addAttribute("usernameError", "Username already exists, enter new user");
			return "general/register";
		}
		
		userService.addUser(user);
		return "redirect:/login?register";
	}
	
	@GetMapping("/login")
	public String getLogin(
			@RequestParam(name="logout", required=false) String logout, 
			@RequestParam(name="error", required=false) String error, 
			@RequestParam(name="register", required=false) String register,
			Model model) {
		if (error != null) {
			model.addAttribute("msg", "Invalid username and password");
		}

		if (logout!= null) {
			model.addAttribute("msg", "You logged out sucesfully");
		}
		
		if (register!= null) {
			model.addAttribute("msg", "You registered sucesfully. Enter info to login.");
		}
		return "general/login";
	}
}
