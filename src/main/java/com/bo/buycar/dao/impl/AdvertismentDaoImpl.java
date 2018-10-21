package com.bo.buycar.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.product.Product;

@Repository
@Transactional
public class AdvertismentDaoImpl implements AdvertismentDao{

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public Advertisment addAdvertisment(Advertisment advertisment) {
		Session session = sessionFactory.getCurrentSession();
		session.save(advertisment);
		session.flush();
		return advertisment;
	}

	@Override
	public Advertisment updateAdvertisment(Advertisment advertisment) {
		Session session = sessionFactory.getCurrentSession();
		session.update(advertisment);
		session.flush();
		return advertisment;
	}

	@Override
	public void deleteAdvertisment(int id) {
		Session session = sessionFactory.getCurrentSession();
		Advertisment advertisment = session.get(Advertisment.class, id);
		session.delete(advertisment);
		session.flush();
	}

	@Override
	public void deleteAdvertisment(Advertisment advertisment) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(advertisment);
		session.flush();
		
	}

	@Override
	public List<Advertisment> getAdvertismentAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Advertisment> list = session.createQuery("from Advertisment").list();
		session.flush();
		return list;
	}

	@Override
	public Advertisment getAdvertismentById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Advertisment advertisment = session.get(Advertisment.class, id);
		session.flush();
		return advertisment;
	}
	
}
