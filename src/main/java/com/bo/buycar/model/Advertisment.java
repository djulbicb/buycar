package com.bo.buycar.model;

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
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.criterion.Order;

import com.bo.buycar.dao.impl.AdvertismentDaoImpl;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.card.Card;
import com.bo.buycar.model.cart.CartItem;
import com.bo.buycar.model.cart.CartOrder;
import com.bo.buycar.model.product.Product;
import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
public class Advertisment{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int advertismentId;

	@OneToOne(targetEntity=Product.class, fetch=FetchType.EAGER, orphanRemoval=true, cascade=CascadeType.ALL)
	Product product;
	
	@ManyToOne(targetEntity=User.class, fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="fk_ad_buyer")
	@JsonIgnore
	User buyer;

	@ManyToOne(targetEntity=User.class, fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="fk_ad_seller")
	@JsonIgnore
	User seller;
	
	boolean isActive;
	
	Date publishDate;

	Date lastModifiedDate;

	@OneToMany(targetEntity=CartItem.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "advertisment", orphanRemoval = true)
	@Fetch(value = FetchMode.SUBSELECT)
	List<CartItem> cartItems;
	
	public int getAdvertismentId() {
		return advertismentId;
	}

	public void setAdvertismentId(int advertismentId) {
		this.advertismentId = advertismentId;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	@Override
	public String toString() {
		return "Advertisment [advertismentId=" + advertismentId + ", isActive=" + isActive + ", publishDate="
				+ publishDate + ", lastModifiedDate=" + lastModifiedDate + "]";
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getBuyer() {
		return buyer;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public User getSeller() {
		return seller;
	}

	public void setSeller(User seller) {
		this.seller = seller;
	}
/*
	@Override
	public int compareTo(Advertisment o) {
		
		return publishDate.compareTo(o.getPublishDate());
	}*/

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}







}
