package com.bo.buycar.dao;

import org.springframework.stereotype.Repository;

public interface ProductImageDao{

	void deleteImage(int productImageId);

	void addImageToProduct(int productId, String productImageName);
	

}
