package com.bo.buycar.model;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class User{

	int id;
	String firstName;
	String lastName;
	String username;
	String password;
	String role;
	
}
