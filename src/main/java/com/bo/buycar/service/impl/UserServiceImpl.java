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
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion.UserAdapter;
import com.bo.buycar.model.auth.Role;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.auth.UserStatus;
import com.bo.buycar.model.cart.Cart;
import com.bo.buycar.model.cart.CartOrder;

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
		
		List<User> users = new ArrayList<>();
		users.add(user);
		
		roleByName.setUsers(users);
		
		List<Role> roles = new ArrayList<>();
		roles.add(roleByName);
		user.setRoles(roles);
			
		Cart cart = new Cart();
		
		user.setCart(cart);
		cart.setUser(user);
		
		user.setRoles(roles);
		
		List<CartOrder> cartOrders = new ArrayList<>();
		user.setCartOrders(cartOrders);
		
		userDao.addUser(user);
		
	}

	@Override
	public User findUserByUsername(String username) {
		User user = userDao.getUserByUsername(username);
		return user;
	}



	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
		
		
	}

}
