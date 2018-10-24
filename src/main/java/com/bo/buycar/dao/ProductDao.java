package com.bo.buycar.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bo.buycar.model.product.Product;

public interface ProductDao {

	Product addProduct(Product product);
	Product updateProduct(Product product);
	void deleteProduct(int id);
	void deleteProduct(Product product);
	List<Product> getProductAll();
	List<Product> getProductByCategory(String productCategory);
	Product getProductById(int id);
}
