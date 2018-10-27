package com.bo.buycar.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.CartOrderDao;
import com.bo.buycar.model.cart.Cart;
import com.bo.buycar.model.cart.CartOrder;

@Repository
public class CartOrderDaoImpl implements CartOrderDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public CartOrder addCartOrder(CartOrder cartOrder) {
		Session session = sessionFactory.getCurrentSession();
		session.save(cartOrder);
		session.flush();
		return cartOrder;
	}

	@Override
	public CartOrder updateCartOrder(CartOrder cartOrder) {
		Session session = sessionFactory.getCurrentSession();
		session.update(cartOrder);
		session.flush();
		return cartOrder;
	}

	@Override
	public void deleteCartOrder(int cartId) {
		Session session = sessionFactory.getCurrentSession();
		CartOrder cartOrder = session.get(CartOrder.class, cartId);
		session.delete(cartOrder);
		session.flush();		
		
	}

	@Override
	public void deleteCartOrder(CartOrder cartOrder) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(cartOrder);
		session.flush();
	}

	@Override
	public List<CartOrder> getCartOrderAll() {
		Session session = sessionFactory.getCurrentSession();
		List<CartOrder> carts = session.createQuery("from CartOrder").list();
		session.flush();
		return carts;
	}

	@Override
	public CartOrder getCartOrderById(int cartOrderId) {
		Session session = sessionFactory.getCurrentSession();
		CartOrder cart = session.get(CartOrder.class, cartOrderId);
		session.flush();	
		return cart;
	}

}
