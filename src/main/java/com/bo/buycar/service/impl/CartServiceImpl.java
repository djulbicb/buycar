package com.bo.buycar.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.dao.CartDao;
import com.bo.buycar.dao.CartItemDao;
import com.bo.buycar.dao.UserDao;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.cart.Cart;
import com.bo.buycar.model.cart.CartItem;
import com.bo.buycar.service.CartService;

@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Autowired
	UserDao userDao;

	@Autowired
	AdvertismentDao advertismentDao;

	@Autowired
	CartItemDao cartItemDao;

	@Autowired
	CartDao cartDao;
	
	@Override
	public String addCartItem(String username, int advertismentId) {
		String msg = "";

		System.out.println(username);
		System.out.println(advertismentId);

		User user = userDao.getUserByUsername(username);
		Advertisment advertisment = advertismentDao.getAdvertismentById(advertismentId);

		System.out.println(user);
		System.out.println(advertisment);

		Cart cart = user.getCart();

		List<CartItem> cartItems = cart.getCartItems();

		boolean testIfAlreadyInCart = false;
		for (CartItem cartItem : cartItems) {
			if (cartItem.getAdvertisment() == advertisment) {
				testIfAlreadyInCart = true;
				
			}
		}

		if (!testIfAlreadyInCart) {
			CartItem cartItem = new CartItem();
			cartItem.setQuontity(1);
			cartItem.setAdvertisment(advertisment);
			cartItem.setCart(cart);

			cartItems.add(cartItem);
			userDao.updateUser(user);
			
			msg = "Added";
		} else {
			msg = "Already in cart";
		}
		return msg;
	}

	@Override
	public void removeCartItem(String name, int cartItemId) {
		CartItem cartItem = cartItemDao.getCartItemById(cartItemId);
		if (cartItem != null) {
			Cart cart = cartItem.getCart();
			cart.getCartItems().remove(cart);
			cartItem.setCart(null);
			cartDao.updateCart(cart);
		}
	}

}
