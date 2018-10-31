package com.bo.buycar.model.auth;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;



import com.bo.buycar.model.Advertisment;

import com.bo.buycar.model.card.Card;
import com.bo.buycar.model.cart.Cart;
import com.bo.buycar.model.cart.CartOrder;
import com.bo.buycar.model.product.Product;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	public User() {

	}

	@OneToOne(targetEntity=Cart.class, fetch=FetchType.EAGER, orphanRemoval=true, cascade=CascadeType.ALL)
	Cart cart;
	
	public User(int id, String username, String password) {

		this.id = id;
		this.username = username;
		this.password = password;
	}

	@Column(unique = true)
	@NotEmpty(message = "You must enter a username.")
	String username;
	
	@NotEmpty(message = "You must enter first name.")
	String firstName;
	
	@NotEmpty(message = "You must enter last name.")
	String lastName;

	@NotEmpty(message = "You must enter a password.")
	String password;

	@NotEmpty(message = "You must enter a email.")
	@Column(unique = true)
	String email;

	@NotEmpty(message = "You must enter a country.")
	String country;
	@NotEmpty(message = "You must enter a street.")
	String street;
	@NotEmpty(message = "You must enter a city.")
	String city;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@Fetch(value = FetchMode.SUBSELECT)
	@JoinTable(name = "UserAndRoles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	@JsonIgnore
	List<Role> roles;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "seller")
	@OrderBy("id ASC")
	Set<Advertisment> advertsSold;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "buyer")
	@OrderBy("id ASC")
	Set<Advertisment> advertsBought;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
	@Fetch(value = FetchMode.SUBSELECT)
	List<Card> cards;
	
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "user", targetEntity=CartOrder.class,orphanRemoval=true)
	@Fetch(value = FetchMode.SUBSELECT)
	List<CartOrder> cartOrders;
	
	
	@Enumerated(EnumType.STRING)
	private UserStatus status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public UserStatus getStatus() {
		return status;
	}

	public void setStatus(UserStatus status) {
		this.status = status;
	}



	public Set<Advertisment> getAdvertsSold() {
		return advertsSold;
	}

	public void setAdvertsSold(Set<Advertisment> advertsSold) {
		this.advertsSold = advertsSold;
	}

	public Set<Advertisment> getAdvertsBought() {
		return advertsBought;
	}

	public void setAdvertsBought(Set<Advertisment> advertsBought) {
		this.advertsBought = advertsBought;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public List<Card> getCards() {
		return cards;
	}

	public void setCards(List<Card> cards) {
		this.cards = cards;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", cart=" + cart + ", username=" + username + ", password=" + password + ", email="
				+ email + ", country=" + country + ", street=" + street + ", city=" + city + ", roles=" + roles
				+ "]";
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public List<CartOrder> getCartOrders() {
		return cartOrders;
	}

	public void setCartOrders(List<CartOrder> cartOrders) {
		this.cartOrders = cartOrders;
	}


}
