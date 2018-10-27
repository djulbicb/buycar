package com.bo.buycar.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.card.Card;
import com.bo.buycar.model.cart.CartItem;
import com.bo.buycar.model.cart.CartOrder;
import com.bo.buycar.service.CardService;
import com.bo.buycar.service.UserService;

/**
 * @author Bojan Shows profile page of users. Any authenticated user can see
 *         information about themself and edit them.
 */
@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	UserService userService;

	@Autowired
	CardService cardService;

	@GetMapping("/showProfile")
	public String getShowProfile(Principal principal, Model model) {
		User user = userService.findUserByUsername(principal.getName());
		System.out.println(user);
		model.addAttribute("user", user);
		System.out.println("---------------");
		System.out.println(user);
		System.out.println("---------------");
		user.getCart().getCartItems();
		return "profile/showProfile";
	}

	@GetMapping("/addCard")
	public String getAddCard(Model model) {
		Card card = new Card();
		card.setYearExpire(Calendar.getInstance().get(Calendar.YEAR) + 4);
		card.setMonthExpire(1);
		model.addAttribute("card", card);
		return "profile/addCard";
	}
	
	@GetMapping("/showCart")
	public String getShowCart(Model model,Principal principal) {
		User user = userService.findUserByUsername(principal.getName());		
		List<CartItem> cartItems = user.getCart().getCartItems();
		
		double total = calcTltCartValue(cartItems);
		
		CartOrder order = new CartOrder();
		
		model.addAttribute("user", user);
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("total", total);
		model.addAttribute("order", order);
		
		
		
		return "profile/showCart";
	}

	private double calcTltCartValue(List<CartItem> cartItems) {
		double total = 0;
		for (CartItem cartItem : cartItems) {
			total += cartItem.getQuontity() * cartItem.getAdvertisment().getProduct().getProductPrice();
		}
		return total;
	}

	@PostMapping("/addCard")
	public String postAddCard(@Valid @ModelAttribute("card") Card card, Model model, Principal principal) {
		String username = principal.getName();
		cardService.addCard(username, card);
		return "redirect:/profile/showProfile";
	}

	@PostMapping("/deleteCard/{cardId}")
	public String postDeleteCard(@PathVariable("cardId") int cardId, Principal principal) {
		System.out.println("POST DELETE CARD");
		cardService.deleteCard(cardId,principal.getName());
		return "redirect:/profile/showProfile";
	}
}
