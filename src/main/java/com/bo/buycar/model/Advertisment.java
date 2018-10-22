package com.bo.buycar.model;

import java.util.Date;


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

import com.bo.buycar.model.product.Product;



@Entity
public class Advertisment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int advertismentId;

	@OneToOne(targetEntity=Product.class, fetch=FetchType.EAGER, orphanRemoval=true, cascade=CascadeType.ALL)
	Product product;

	boolean isActive;

	Date publishDate;

	Date lastModifiedDate;

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


}