package com.bo.buycar.service;

import com.bo.buycar.model.product.ProductImage;

public interface ProductImageService {

	String deleteProductImage(String username, int productImageId);

	ProductImage getProductImageById(int productImageId);

}
