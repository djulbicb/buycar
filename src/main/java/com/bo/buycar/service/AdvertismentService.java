package com.bo.buycar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bo.buycar.dto.PageList;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;


public interface AdvertismentService {
	List<Advertisment> getAdvertismentByUser(User u);

	Advertisment getAdvertismentById(int advertismentId);

	void updateAdvertismentDate(int advertismentId);

	void deleteAdvertisment(Advertisment advertisment);

	List<Advertisment> getAdvertismentAll();

	PageList getAdvertismentAll(String productCategory, int page);
}
