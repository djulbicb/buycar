package com.bo.buycar.dao;

import java.util.List;

import org.springframework.data.domain.PageRequest;

import com.bo.buycar.dto.PageList;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.product.Product;

public interface AdvertismentDao {

	Advertisment addAdvertisment(Advertisment advertisment);
	Advertisment updateAdvertisment(Advertisment advertisment);
	void deleteAdvertisment(int id);
	void deleteAdvertisment(Advertisment advertisment);
	List<Advertisment> getAdvertismentAll();
	Advertisment getAdvertismentById(int id);
	void updateAdvertismentDate(int advertismentId);
	PageList getAdvertismentAll(String productCategory, int page);
}
