package com.bo.buycar.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RestController;

import com.bo.buycar.dao.ProductImageDao;
import com.bo.buycar.model.product.Product;
import com.bo.buycar.model.product.ProductImage;

@Repository
@Transactional
public class ProductImageDaoImpl implements ProductImageDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void deleteProductImage(int productImageId) {
		Session session = sessionFactory.getCurrentSession();
		ProductImage productImage = session.get(ProductImage.class, productImageId);
		
		if (productImage != null) {
			Product product = productImage.getProduct();
			System.out.println(product.getProductImages().size());
			product.getProductImages().remove(productImage);
			System.out.println(product.getProductImages().size());
			
			session.saveOrUpdate(product);
		}
		
		session.flush();
	}

	@Override
	public ProductImage getProductImageById(int productImageId) {
		Session session = sessionFactory.getCurrentSession();
		ProductImage productImage = session.get(ProductImage.class, productImageId);
		
		return productImage;
	}

}
