package com.bo.buycar.model.product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.UserStatus;
import com.sun.istack.internal.NotNull;

@Entity
public class Product implements Serializable{

	public Product() {
		productImages = new ArrayList<>();
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int productId;

	@NotEmpty(message="You must enter a product name.")
	String productName;

	@NotEmpty(message="You must enter a product description.")
	String productDescription;

	@NotNull
	double productPrice;
	
	@NotNull
    @Min(1900)
	int productYear;
	
	@Transient
	private List<MultipartFile> productImageFile;

	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, mappedBy="product", orphanRemoval=true)
	List<ProductImage> productImages;

	@OneToOne(targetEntity=Advertisment.class, mappedBy="product")
	@JoinColumn(name="fk_product_advertisment")
	Advertisment advertisment;
	
	@Enumerated(EnumType.STRING)
	private ProductCategory productCategory;
	
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

	public Advertisment getAdvertisment() {
		return advertisment;
	}

	public void setAdvertisment(Advertisment advertisment) {
		this.advertisment = advertisment;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}
}
