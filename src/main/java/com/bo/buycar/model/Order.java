package com.bo.buycar.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Transient;

import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.card.Card;
import com.bo.buycar.model.cart.CartItem;


public class Order {
	
	int orderId;

	User user;

	@Transient
	String cardType;

	Card card;

	List<CartItem> orderItems;

	Date orderDate;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public List<CartItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<CartItem> orderItems) {
		this.orderItems = orderItems;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", user=" + user + ", cardType=" + cardType + ", card=" + card
				+ ", orderItems=" + orderItems + ", orderDate=" + orderDate + "]";
	}

}
