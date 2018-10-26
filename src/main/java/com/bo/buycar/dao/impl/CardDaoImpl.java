package com.bo.buycar.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bo.buycar.dao.CardDao;
import com.bo.buycar.model.card.Card;

@Repository
public class CardDaoImpl implements CardDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public Card addCard(Card card) {
		Session session = sessionFactory.getCurrentSession();
		session.save(card);
		session.flush();
		return card;
	}

	@Override
	public Card updateCard(Card card) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCard(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCard(Card card) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(card);
		session.flush();

	}

	@Override
	public List<Card> getCardAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Card getCardById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Card card = session.get(Card.class, id);
		return card;

	}

}
