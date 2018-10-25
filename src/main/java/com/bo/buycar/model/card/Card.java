package com.bo.buycar.model.card;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.bo.buycar.model.auth.User;

@Entity
public class Card {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cardId;
	
	String cardType;
	
	double balance;
	
	
	
	
}