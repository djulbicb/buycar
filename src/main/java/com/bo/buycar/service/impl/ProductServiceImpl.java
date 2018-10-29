package com.bo.buycar.service.impl;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.ProductDao;
import com.bo.buycar.model.product.Product;
import com.bo.buycar.model.product.ProductImage;
import com.bo.buycar.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	ProductDao productDao;
	
	@Override
	public Product getProductById(int productId) {
		Product productById = productDao.getProductById(productId);
		return productById;
	}

	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);		
	}
	
}
