package com.bo.buycar.dao;

import org.springframework.stereotype.Repository;

import com.bo.buycar.model.product.ProductImage;

public interface ProductImageDao{

	void deleteProductImage(int productImageId);
	ProductImage getProductImageById(int productImageId);
}
