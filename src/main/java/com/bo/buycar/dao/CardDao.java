package com.bo.buycar.dao;

import java.util.List;

import com.bo.buycar.model.card.Card;

public interface CardDao {
	Card addCard(Card card);

	Card updateCard(Card card);

	void deleteCard(int id);

	void deleteCard(Card card);

	List<Card> getCardAll();

	Card getCardById(int id);
}
