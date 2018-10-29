package com.bo.buycar.service;

import java.util.List;

import com.bo.buycar.model.product.Product;

public interface ProductService {

	Product getProductById(int productId);

	void updateProduct(Product product);
	
}
