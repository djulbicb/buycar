package com.bo.buycar.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.CartDao;
import com.bo.buycar.model.cart.Cart;

@Repository
public class CartDaoImpl implements CartDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Cart addCart(Cart cart) {
		Session session = sessionFactory.getCurrentSession();
		session.save(cart);
		session.flush();
		return cart;
	}

	@Override
	public Cart updateCart(Cart cart) {
		Session session = sessionFactory.getCurrentSession();
		session.update(cart);
		session.flush();
		return cart;
	}

	@Override
	public void deleteCart(int cartId) {
		Session session = sessionFactory.getCurrentSession();
		Cart cart = session.get(Cart.class, cartId);
		session.delete(cart);
		session.flush();		
	}

	@Override
	public void deleteCart(Cart cart) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(cart);
		session.flush();
		
	}

	@Override
	public List<Cart> getCartAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Cart> carts = session.createQuery("from Cart").list();
		session.flush();
		return carts;
	}

	@Override
	public Cart getCartById(int cartId) {
		Session session = sessionFactory.getCurrentSession();
		Cart cart = session.get(Cart.class, cartId);
		session.flush();	
		return cart;
	}

}
