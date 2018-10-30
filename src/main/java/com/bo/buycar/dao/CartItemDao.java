package com.bo.buycar.dao;

import java.util.List;

import com.bo.buycar.model.cart.CartItem;

public interface CartItemDao {
	CartItem addCartItem(CartItem CartItem);

	CartItem updateCartItem(CartItem CartItem);

	void deleteCartItem(int cartItemId);

	void deleteCartItem(CartItem cartItem);

	List<CartItem> getCartItemAll();

	CartItem getCartItemById(int cartItemId);
}
