package com.bo.buycar.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	@GetMapping("/showProfile")
	public String getShowProfile(Principal principal) {
		System.out.println("---------------------");
		System.out.println(principal);
		System.out.println("---------------------");
		return "profile/showProfile";
	}
	
}
