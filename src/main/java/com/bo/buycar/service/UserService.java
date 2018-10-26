package com.bo.buycar.service;

import com.bo.buycar.model.auth.User;

public interface UserService {

	boolean findIfUsernameExists(String username);
	boolean findIfEmailExists(String username);
	void addUser(User user);
	User findUserByUsername(String name);
	
}
