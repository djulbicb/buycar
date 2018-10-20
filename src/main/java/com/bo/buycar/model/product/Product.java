package com.bo.buycar.model.product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

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
