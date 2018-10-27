package com.bo.buycar.service.impl;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.ProductDao;
import com.bo.buycar.model.product.ProductImage;
import com.bo.buycar.service.ProductImageService;

@Service
@Transactional
public class ProductImageServiceImpl implements ProductImageService{

	@Autowired
	ProductDao productDao;
	
	@Override
	public void deleteProductImage(int productImageId) {
		productDao.deleteProduct(productImageId);		
	}

	@Override
	public ProductImage getProductImageById(int productImageId) {
		return null;
	}

}
