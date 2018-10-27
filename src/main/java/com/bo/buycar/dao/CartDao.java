package com.bo.buycar.dao;

import java.util.List;

import com.bo.buycar.model.cart.Cart;

public interface CartDao {
	Cart addCart(Cart Cart);
	Cart updateCart(Cart Cart);
	void deleteCart(int id);
	void deleteCart(Cart Cart);
	List<Cart> getCartAll();
	Cart getCartById(int cartId);
}
