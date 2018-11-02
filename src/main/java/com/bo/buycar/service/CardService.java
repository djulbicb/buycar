package com.bo.buycar.service;

import com.bo.buycar.model.card.Card;

public interface CardService {

	void addCard(String username, Card card);

	void deleteCard(int cardId, String name);

	Card findByCardId(int cardId);

	double getBalance(int cardId);

	
}
