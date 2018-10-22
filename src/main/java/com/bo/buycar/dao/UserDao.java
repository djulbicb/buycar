package com.bo.buycar.dao;

import java.util.List;

import com.bo.buycar.model.auth.User;

public interface UserDao {
	User addUser(User User);
	User updateUser(User User);
	void deleteUser(int id);
	void deleteUser(User User);
	List<User> getUserAll();
	User getUserById(int id);
	User getUserByUsername(String username);
}
