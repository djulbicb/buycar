package com.bo.buycar.dao;

import org.springframework.stereotype.Repository;

import com.bo.buycar.model.product.Product;

public interface ProductDao {

	Product addProduct(Product product);
	Product updateProduct(Product product);
	void deleteProduct(int id);
	void deleteProduct(Product product);
	Product getProductAll();
	Product getProductById(int id);
}
