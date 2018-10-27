package com.bo.buycar.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.CardDao;
import com.bo.buycar.dao.CartDao;
import com.bo.buycar.dao.CartOrderDao;

import com.bo.buycar.dao.UserDao;

import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.card.Card;
import com.bo.buycar.model.cart.Cart;
import com.bo.buycar.model.cart.CartItem;
import com.bo.buycar.model.cart.CartOrder;
import com.bo.buycar.service.CartOrderService;

@Service
@Transactional
public class CartOrderServiceImpl implements CartOrderService{

	@Autowired
	CardDao cardDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	CartDao cartDao;

	@Autowired
	CartOrderDao cartOrderDao;
	
	@Override
	public void addOrder(int cardId, String username) {
		
		User user = userDao.getUserByUsername(username);
		Card card = cardDao.getCardById(cardId);
		
		if (card.getUser() == user) {
			CartOrder cartOrder = new CartOrder();
			
			cartOrder.setUser(user);
			cartOrder.setCard(card);
			
			cartOrder.setCartItems(new ArrayList<CartItem>());
			
			List<CartItem> cartItems = user.getCart().getCartItems();
			System.out.println("----------");
			System.out.println(cartItems);
			double total = 0;
			for (CartItem cartItem : cartItems) {
				cartItem.setCartOrder(cartOrder);
				cartOrder.getCartItems().add(cartItem);
				
				//cartItems.remove(cartItem);
				total = cartItem.getQuontity() * cartItem.getAdvertisment().getProduct().getProductPrice();
				cartItem.setCart(null);
			}
			
			
					
			CartOrder order = cartOrderDao.addCartOrder(cartOrder);
			order.setTotalValue(total); 
			user.getCart().setCartItems(new ArrayList<CartItem>());
			
			user.getCartOrders().add(order);
			userDao.updateUser(user);
			
		}
		
		
		
	}

	@Override
	public List<CartOrder> getAllOrders() {
		List<CartOrder> cartOrderAll = cartOrderDao.getCartOrderAll();
		return cartOrderAll;
	}

}
