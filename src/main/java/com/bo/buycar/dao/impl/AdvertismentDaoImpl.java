package com.bo.buycar.dao.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.support.PageableExecutionUtils;
import org.springframework.stereotype.Repository;

import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.dto.PageList;
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

	@Override
	public void updateAdvertismentDate(int advertismentId) {
		Session session = sessionFactory.getCurrentSession();
		Advertisment advertisment = session.get(Advertisment.class, advertismentId);
		advertisment.setLastModifiedDate(new Date());
		session.flush();		
	}

	@Override
	public PageList getAdvertismentAll(String productCategory,int page) {
		
		Session session = sessionFactory.getCurrentSession();
		
		String queryStr = "";
		Query query = null;
		if (productCategory.equals("")) {
			queryStr = "from Advertisment";
			query = session.createQuery(queryStr );
		}else {
			queryStr = "from Advertisment ad where ad.product.productCategory =:productCategory";
			query = session.createQuery(queryStr );
			query.setParameter("productCategory",productCategory);
		}
		
		query.setFirstResult(page * PageList.COUNT);
		query.setMaxResults(PageList.COUNT);
		
		List<Advertisment> list = query.list();
		
		System.out.println("--------");
		System.out.println(list);
		System.out.println("--------");
		
		PageList pageList = new PageList(page, list);
		Long l = (Long)session.createQuery("select count(1) from  Advertisment").getSingleResult();
		
		pageList.setTotalCount(Math.toIntExact(l));
		
		session.flush();
		return pageList;	
	}

	
}
