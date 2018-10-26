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
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Sort;
import org.hibernate.annotations.SortComparator;
import org.hibernate.annotations.SortNatural;

import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.card.Card;
import com.bo.buycar.model.product.Product;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	public User() {

	}

	public User(int id, String username, String password) {

		this.id = id;
		this.username = username;
		this.password = password;
	}

	@Column(unique = true)
	@NotEmpty(message = "You must enter a username.")
	String username;

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
	@SortNatural
	Set<Advertisment> advertsSold;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "buyer")
	@SortNatural
	Set<Advertisment> advertsBought;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
	@Fetch(value = FetchMode.SUBSELECT)
	List<Card> cards;
	
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

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", roles=" + roles + ", status="
				+ status + "]";
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
}
