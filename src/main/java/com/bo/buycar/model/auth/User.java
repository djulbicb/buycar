package com.bo.buycar.model.auth;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.bo.buycar.model.Advertisment;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	public User() {
		
	}

	public User(int id, String username, String password) {
		
		this.id = id;
		this.username = username;
		this.password = password;
	}

	String username;
	String password;

	@ManyToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@Fetch(value = FetchMode.SUBSELECT)
	@JoinTable(name = "UserAndRoles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	@JsonIgnore
	List<Role> roles;

	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, mappedBy="buyer", orphanRemoval=true)
	@Fetch(value = FetchMode.SUBSELECT)
	List<Advertisment> advertsSold;
	
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, mappedBy="seller", orphanRemoval=true)
	@Fetch(value = FetchMode.SUBSELECT)
	List<Advertisment> advertsBought;
	
	@Enumerated(EnumType.STRING)
	private UserStatus status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public UserStatus getStatus() {
		return status;
	}

	public void setStatus(UserStatus status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", roles=" + roles + ", status="
				+ status + "]";
	}

	public List<Advertisment> getAdvertsSold() {
		return advertsSold;
	}

	public void setAdvertsSold(List<Advertisment> advertsSold) {
		this.advertsSold = advertsSold;
	}

	public List<Advertisment> getAdvertsBought() {
		return advertsBought;
	}

	public void setAdvertsBought(List<Advertisment> advertsBought) {
		this.advertsBought = advertsBought;
	}
}
