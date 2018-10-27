package com.bo.buycar.service;

import java.util.List;

import com.bo.buycar.model.cart.CartOrder;

public interface CartOrderService {

	void addOrder(int cardId, String name);

	List<CartOrder> getAllOrders();

}
