package com.bo.buycar.model.cart;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.*;

import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.card.Card;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class CartOrder{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@Transient
	String cardType;

	double totalValue;
	
	@ManyToOne(fetch=FetchType.EAGER,  cascade = CascadeType.REFRESH, targetEntity=User.class)
	@JoinColumn(name="fk_order_user")
	@JsonIgnore
	User user;
	
	@ManyToOne(fetch=FetchType.EAGER,  cascade = CascadeType.REFRESH, targetEntity=Card.class)
	@JoinColumn(name="fk_order_card")
	@JsonIgnore
	Card card;
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "cartOrder", targetEntity=CartItem.class)
	@Fetch(value = FetchMode.SELECT)
	List<CartItem> cartItems;

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}


	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public double getTotalValue() {
		return totalValue;
	}

	public void setTotalValue(double totalValue) {
		this.totalValue = totalValue;
	}

	@Override
	public String toString() {
		return "CartOrder [id=" + id + ", cardType=" + cardType + ", totalValue=" + totalValue + ", user=" + user
				+ ", card=" + card + ", cartItems=" + cartItems + "]";
	}


	



}
