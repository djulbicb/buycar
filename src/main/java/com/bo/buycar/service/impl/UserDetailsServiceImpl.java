package com.bo.buycar.service.impl;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.UserDao;
import com.bo.buycar.model.auth.Role;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.auth.UserStatus;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserDao userDao;
	
	@Override
	@Transactional()
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDao.getUserByUsername(username);
		System.out.println("-------------------------------------");
		System.out.println(user);
		if (user != null) {
			String password = user.getPassword();
			boolean enabled = user.getStatus().equals(UserStatus.ACTIVE);
			boolean accountNonExpired = user.getStatus().equals(UserStatus.ACTIVE);
			boolean credentialsNonExpired = user.getStatus().equals(UserStatus.ACTIVE);
			boolean accountNonLocked = user.getStatus().equals(UserStatus.ACTIVE);
			
			
			Collection<SimpleGrantedAuthority > authorities = new ArrayList<>();
			for (Role role : user.getRoles()) {
				authorities.add(new SimpleGrantedAuthority (role.getRoleName()));
			}
			
			org.springframework.security.core.userdetails.User securityUser = 
					new org.springframework.security.core.userdetails.User(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
			return securityUser;
		} else {
			throw new UsernameNotFoundException("User Not Found");
		}

		
	}

}
