package com.bo.buycar.service;

public interface CartService {
	String addCartItem(String username, int advertismentId);

	void removeCartItem(String name, int advertismentId);
}
