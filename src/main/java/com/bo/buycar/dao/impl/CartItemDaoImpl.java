package com.bo.buycar.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bo.buycar.dao.CartItemDao;
import com.bo.buycar.model.cart.CartItem;
import com.bo.buycar.model.cart.CartOrder;

@Repository
public class CartItemDaoImpl implements CartItemDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public CartItem addCartItem(CartItem CartItem) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartItem updateCartItem(CartItem CartItem) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCartItem(int cartItemId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCartItem(CartItem cartItem) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CartItem> getCartItemAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartItem getCartItemById(int cartItemId) {
		Session session = sessionFactory.getCurrentSession();
		CartItem cartItem = session.get(CartItem.class, cartItemId);
		session.flush();	
		return cartItem;
	}

}
