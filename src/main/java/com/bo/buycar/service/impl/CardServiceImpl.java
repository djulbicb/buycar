package com.bo.buycar.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.CardDao;
import com.bo.buycar.dao.UserDao;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.card.Card;
import com.bo.buycar.service.CardService;
import com.bo.buycar.service.UserService;

@Service
@Transactional
public class CardServiceImpl implements CardService {

	@Autowired
	CardDao cardDao;

	@Autowired
	UserDao userDao;

	@Override
	public void addCard(String username, Card card) {
		User user = userDao.getUserByUsername(username);
		user.getCards().add(card);
		card.setUser(user);
		userDao.updateUser(user);

	}

	@Override
	public void deleteCard(int cardId, String username) {
		System.out.println("POST DELETE CARD");
		User user = userDao.getUserByUsername(username);
		Card card = cardDao.getCardById(cardId);
		System.out.println(user);
		System.out.println(card);
		user.getCards().remove(card);
		userDao.updateUser(user);

	}

	@Override
	public Card findByCardId(int cardId) {
		return cardDao.getCardById(cardId);
	}

	@Override
	public double getBalance(int cardId) {
		Card card = cardDao.getCardById(cardId);
		double balance = card.getBalance();
		return balance;
	}



}
