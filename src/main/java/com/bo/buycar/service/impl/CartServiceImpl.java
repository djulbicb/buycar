package com.bo.buycar.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.dao.UserDao;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.cart.Cart;
import com.bo.buycar.model.cart.CartItem;
import com.bo.buycar.service.CartService;

@Service
@Transactional
public class CartServiceImpl implements CartService{

	@Autowired
	UserDao userDao;
	
	@Autowired
	AdvertismentDao advertismentDao;
	
	@Override
	public void addCartItem(String username, int advertismentId) {
		System.out.println(username);
		System.out.println(advertismentId);
		
		User user = userDao.getUserByUsername(username);
		Advertisment advertisment = advertismentDao.getAdvertismentById(advertismentId);
		
		System.out.println(user);
		System.out.println(advertisment);
		
		Cart cart = user.getCart();
		
		if (cart == null) {
			cart = new Cart();
			user.setCart(cart);
			cart.setUser(user);
			
			List<CartItem> cartItems = new ArrayList<>();
			cart.setCartItems(cartItems);
			
			CartItem cartItem = new CartItem();
			cartItem.setQuontity(1);
			cartItem.setAdvertisment(advertisment);
			cartItem.setCart(cart);
			
			cartItems.add(cartItem);
			
		} else {
			List<CartItem> cartItems = cart.getCartItems();
			CartItem cartItem = new CartItem();
			cartItem.setQuontity(1);
			cartItem.setAdvertisment(advertisment);
			cartItem.setCart(cart);
			
			cartItems.add(cartItem);
		}
		
		userDao.updateUser(user);
		
		
	}

	@Override
	public void removeCartItem(String name, int advertismentId) {
		// TODO Auto-generated method stub
		
	}

}
