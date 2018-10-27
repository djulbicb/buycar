package com.bo.buycar.model.cart;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class CartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cartItemId;
	
	int quontity;
	
	@ManyToOne(fetch=FetchType.EAGER,   cascade = CascadeType.REFRESH, targetEntity=Cart.class)	
	@JoinColumn(name="fk_citem_cart")
	@JsonIgnore
	Cart cart;
	
	@ManyToOne(fetch=FetchType.EAGER,   cascade = CascadeType.REFRESH, targetEntity=Advertisment.class)	
	@JoinColumn(name="fk_citem_advert")
	@JsonIgnore
	Advertisment advertisment;
	
	@ManyToOne(fetch=FetchType.EAGER, cascade = CascadeType.REFRESH, targetEntity=CartOrder.class)
	@JoinColumn(name="fk_advert_order")
	@JsonIgnore
	CartOrder cartOrder;

	public int getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}

	public int getQuontity() {
		return quontity;
	}

	public void setQuontity(int quontity) {
		this.quontity = quontity;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Advertisment getAdvertisment() {
		return advertisment;
	}

	public void setAdvertisment(Advertisment advertisment) {
		this.advertisment = advertisment;
	}

	@Override
	public String toString() {
		return "CartItem [cartItemId=" + cartItemId + ", quontity=" + quontity +"]";
	}

	public CartOrder getCartOrder() {
		return cartOrder;
	}

	public void setCartOrder(CartOrder cartOrder) {
		this.cartOrder = cartOrder;
	}
}