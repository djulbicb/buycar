package com.bo.buycar.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bo.buycar.dao.RoleDao;
import com.bo.buycar.model.auth.Role;

@Repository
public class RoleDaoImpl implements RoleDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Role getRoleByName(String roleName) {
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Role where roleName =: roleName");
		query.setString("roleName", roleName);
		Role role = (Role) query.uniqueResult();
		
		session.flush();
		return role;
	}

}
