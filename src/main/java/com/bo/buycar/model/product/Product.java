package com.bo.buycar.model.product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.UserStatus;
import com.sun.istack.internal.NotNull;

@Entity
public class Product implements Serializable {

	public Product() {
		productImages = new ArrayList<>();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int productId;

	@NotEmpty(message = "You must enter a product name.")
	String productName;

	@NotEmpty(message = "You must enter a product description.")
	@Length(max=2048, message="Description cant be longer than 2048 characters")
	@Column(length=2048)
	String productDescription;

	@NotNull
	double productPrice;

	@NotNull
	@Min(1900)
	int productYear;

	@Transient
	private List<MultipartFile> productImageFile;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "product", orphanRemoval = true)
	List<ProductImage> productImages;

	@OneToOne(targetEntity=Advertisment.class, fetch=FetchType.EAGER, orphanRemoval=true, cascade=CascadeType.ALL)
	Advertisment advertisment;

	@NotEmpty(message = "You must enter a product category.")
	@Pattern(regexp = "^(CAR|TRUCK|MOTORCYCLE|RV|BOAT)$", message = "Invalid category")
	private String productCategory;

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
		/*
		if (productImages.size() == 0) {
			ProductImage pic = new ProductImage();
			pic.setProductImgName("noimage.jpg");
			pic.setProductImgId(0);
			List<ProductImage> list = new ArrayList<>();
			list.add(pic);
			return list;
		}*/
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

	public Advertisment getAdvertisment() {
		return advertisment;
	}

	public void setAdvertisment(Advertisment advertisment) {
		this.advertisment = advertisment;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPrice=" + productPrice + ", productYear=" + productYear
				+ ", productImageFile=" + productImageFile + ", productImages=" + productImages + ", advertisment="
				+ advertisment + ", productCategory=" + productCategory + "]";
	}
}
