package com.bo.buycar.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.RoleDao;
import com.bo.buycar.dao.UserDao;
import com.bo.buycar.service.UserService;
import com.bo.buycar.model.auth.Role;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.auth.UserStatus;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Autowired
	RoleDao roleDao;
	
	@Override
	public boolean findIfUsernameExists(String username) {
		User user = userDao.getUserByUsername(username);
		if (user != null) {
			return true;
		}
		return false;
	}

	@Override
	public boolean findIfEmailExists(String email) {
		User user = userDao.getUserByEmail(email);
		if (user != null) {
			return true;
		}
		return false;
	}

	@Override
	public void addUser(User user) {
		user.setStatus(UserStatus.ACTIVE);
		Role roleByName = roleDao.getRoleByName("USER");
		
		List<Role> roles = new ArrayList<>();
		roles.add(roleByName);
		
		user.setRoles(roles);
		userDao.addUser(user);
		
	}

	@Override
	public User findUserByUsername(String username) {
		User user = userDao.getUserByUsername(username);
		return user;
		
	}

}
