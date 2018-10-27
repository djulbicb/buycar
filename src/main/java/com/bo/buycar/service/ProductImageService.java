package com.bo.buycar.service;

import com.bo.buycar.model.product.ProductImage;

public interface ProductImageService {

	void deleteProductImage(int productImageId);

	ProductImage getProductImageById(int productImageId);

}
