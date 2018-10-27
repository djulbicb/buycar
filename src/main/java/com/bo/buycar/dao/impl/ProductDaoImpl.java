package com.bo.buycar.dao.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.sound.midi.Soundbank;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bo.buycar.dao.ProductDao;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.product.Product;
import com.bo.buycar.model.product.ProductCategory;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Product addProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.save(product);
		session.flush();
		return product;
		
	}

	@Override
	public Product updateProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("----");
		System.out.println(product);
		
		session.update(product);
		session.flush();
		System.out.println("----flush");
		System.out.println(product);
		
		
		return product;
	}

	@Override
	public void deleteProduct(int id) {
		Session session = sessionFactory.getCurrentSession();
		Product product = session.get(Product.class, id);
		Advertisment advertisment = product.getAdvertisment();
		session.delete(advertisment);
		session.delete(product);
	}

	@Override
	public void deleteProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		
		Advertisment advertisment = product.getAdvertisment();
		session.delete(advertisment);
		session.flush();
	}


	@Override
	public Product getProductById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Product product = session.get(Product.class, id);
		return product;
	}

	@Override
	public List<Product> getProductAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Product> products = session.createQuery("from Product").list();
		session.flush();
		return products;
		
	}

	@Override
	public List<Product> getProductByCategory(String productCategory) {
		Session session = sessionFactory.getCurrentSession();
		ProductCategory category = ProductCategory.valueOf(productCategory);
		List<Product> products = null;
		if ( category != null) {
			Query query = session.createQuery("from Product p WHERE p.productCategory = :productCategory");
			query.setParameter("productCategory", category);
			products  = query.list();
		} else {
			products = session.createQuery("from Product").list();
		}
		
		
		session.flush();
		return products;
	}

}
