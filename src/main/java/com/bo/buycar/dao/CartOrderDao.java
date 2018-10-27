package com.bo.buycar.dao;

import java.util.List;

import com.bo.buycar.model.cart.CartOrder;

public interface CartOrderDao {
	CartOrder addCartOrder(CartOrder cartOrder);
	CartOrder updateCartOrder(CartOrder cartOrder);
	void deleteCartOrder(int id);
	void deleteCartOrder(CartOrder cartOrder);
	List<CartOrder> getCartOrderAll();
	CartOrder getCartOrderById(int cartOrderId);
}
