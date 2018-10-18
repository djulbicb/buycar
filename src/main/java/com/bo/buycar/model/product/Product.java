package com.bo.buycar.model.product;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {

	public Product() {
		productImages = new ArrayList<>();
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int productId;

	String productName;

	String productDescription;

	double productPrice;
	int productYear;
	
	@Transient
	private List<MultipartFile> productImageFile;

	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, mappedBy="product")
	List<ProductImage> productImages;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public List<MultipartFile> getProductImageFile() {
		return productImageFile;
	}

	public void setProductImageFile(List<MultipartFile> productImageFile) {
		this.productImageFile = productImageFile;
	}

	public List<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<ProductImage> productImages) {
		this.productImages = productImages;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductYear() {
		return productYear;
	}

	public void setProductYear(int productYear) {
		this.productYear = productYear;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPrice=" + productPrice + ", productYear=" + productYear
				+ ", productImageFile=" + productImageFile + ", productImages=" + productImages + "]";
	}
}
