package com.bo.buycar.service;

public interface CartService {
	void addCartItem(String username, int advertismentId);

	void removeCartItem(String name, int advertismentId);
}
