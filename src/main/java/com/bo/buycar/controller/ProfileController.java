package com.bo.buycar.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.validation.*;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.card.Card;
import com.bo.buycar.model.cart.CartItem;
import com.bo.buycar.model.cart.CartOrder;
import com.bo.buycar.service.CardService;
import com.bo.buycar.service.CartOrderService;
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

	@Autowired
	CartOrderService cartOrderService;
	
	
	
	@GetMapping("/showProfile")
	public String getShowProfile(Principal principal, Model model) {
		User user = userService.findUserByUsername(principal.getName());
		System.out.println(user);
		model.addAttribute("user", user);
		user.getCart().getCartItems();
		return "profile/showProfile";
	}


	
	@GetMapping("/showCart")
	public String getShowCart(
			Model model,Principal principal, 
			@RequestParam(name="sucessOrder", required=false) String sucessOrder,
			@RequestParam(name="errorOrder", required=false) String errorOrder
			) {
		User user = userService.findUserByUsername(principal.getName());		
		List<CartItem> cartItems = user.getCart().getCartItems();
		
		double total = calcTltCartValue(cartItems);
		
		CartOrder order = new CartOrder();
		
		if (sucessOrder!=null) {
			model.addAttribute("msg", "Order was succesfull");	
		} else if(errorOrder!=null) {
			model.addAttribute("msg", errorOrder);
		}
		
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
	
	@GetMapping("/addCard")
	public String getAddCard(Model model) {
		Card card = new Card();
		card.setYearExpire(Calendar.getInstance().get(Calendar.YEAR) + 4);
		card.setMonthExpire(1);
		card.setCardType("VISA");
		card.setBalance(0);
		model.addAttribute("card", card);
		return "profile/addCard";
	}
	
	@PostMapping("/addCard")
	public String postAddCard(@Valid @ModelAttribute("card") Card card, Principal principal, BindingResult result) {
		if (result.hasErrors()) {
			return "profile/addCard";
		}
		Random rnd = new Random();
		System.out.println("POST ADD CARD");
		String username = principal.getName();
		card.setBalance(rnd.nextDouble()*100000+200000);
		cardService.addCard(username, card);
		return "redirect:/profile/showProfile";
	}

	@PostMapping("/deleteCard/{cardId}")
	public String postDeleteCard(@PathVariable("cardId") int cardId, Principal principal) {
		System.out.println("POST DELETE CARD");
		cardService.deleteCard(cardId,principal.getName());
		return "redirect:/profile/showProfile";
	}
	
	@PostMapping("/placeOrder")
	public String postPlaceOrder(@RequestParam(name="cardType", required=true) int cardId, Model model, Principal principal) {
		
		Card card = cardService.findByCardId(cardId);
		if (card != null && card.getUser().getUsername().equals(principal.getName())) {
			cartOrderService.addOrder(cardId, principal.getName());
			return "redirect:/profile/showCart?sucessOrder";
		}
		return "redirect:/profile/showCart?errorOrder";
	}
	
	@GetMapping("/showOrders")
	public String getShowOrders(Model model) {
		List<CartOrder> listCartOrders = cartOrderService.getAllOrders();
		model.addAttribute("orders", listCartOrders );
		return "profile/showOrders";
	}
	
}
