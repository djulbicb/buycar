package com.bo.buycar.model.card;

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
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.NumberFormat;

import com.bo.buycar.model.Advertisment;

import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.cart.CartOrder;
import com.bo.buycar.model.product.Product;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.istack.internal.NotNull;

@Entity
public class Card {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cardId;
	
	@NotEmpty(message = "You enter card number.")
	String cardNumber;
	
	@NotEmpty(message = "You must pick card type.")
	@Pattern(regexp = "^(VISA|MASTER|MAESTRO)$", message = "Must be a card type")
	String cardType;
	
	double balance;
	
	@Min(value=1)
	@Max(value=12)
	int monthExpire;
	
	@Min(value=2018)
	@Max(value=2030)
	int yearExpire;
	
	@ManyToOne(fetch=FetchType.EAGER,   cascade = CascadeType.REFRESH, targetEntity=User.class)
	@JoinColumn(name="fk_card_user")
	@JsonIgnore
	User user;
	
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "card", targetEntity=CartOrder.class)
	@Fetch(value = FetchMode.SUBSELECT)
	List<CartOrder> cartOrders;

	public int getCardId() {
		return cardId;
	}

	public void setCardId(int cardId) {
		this.cardId = cardId;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public int getMonthExpire() {
		return monthExpire;
	}

	public void setMonthExpire(int monthExpire) {
		this.monthExpire = monthExpire;
	}

	public int getYearExpire() {
		return yearExpire;
	}

	public void setYearExpire(int yearExpire) {
		this.yearExpire = yearExpire;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "Card [cardId=" + cardId + ", cardNumber=" + cardNumber + ", cardType=" + cardType + ", balance="
				+ balance + ", monthExpire=" + monthExpire + ", yearExpire=" + yearExpire + ", user=" + user + "]";
	}

	public List<CartOrder> getCartOrders() {
		return cartOrders;
	}

	public void setCartOrders(List<CartOrder> cartOrders) {
		this.cartOrders = cartOrders;
	}

	
	
}