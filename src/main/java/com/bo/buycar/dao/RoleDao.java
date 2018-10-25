package com.bo.buycar.dao;

import com.bo.buycar.model.auth.Role;

public interface RoleDao {

	public Role getRoleByName(String roleName);
	
}
