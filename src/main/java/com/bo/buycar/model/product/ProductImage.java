package com.bo.buycar.model.product;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ProductImage implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int productImgId;
	
	String productImgName;
	public ProductImage() {
		productImgDateAdded = new Date();
	}
	Date productImgDateAdded;
	
	@ManyToOne(fetch=FetchType.EAGER,   cascade = CascadeType.REFRESH, targetEntity=Product.class)
	@JoinColumn(name="fk_product_image")
	@JsonIgnore
	Product product;

	public int getProductImgId() {
		return productImgId;
	}

	public void setProductImgId(int productImgId) {
		this.productImgId = productImgId;
	}

	public String getProductImgName() {
		return productImgName;
	}

	public void setProductImgName(String productImgName) {
		this.productImgName = productImgName;
	}

	public Date getProductImgDateAdded() {
		return productImgDateAdded;
	}

	public void setProductImgDateAdded(Date productImgDateAdded) {
		this.productImgDateAdded = productImgDateAdded;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
