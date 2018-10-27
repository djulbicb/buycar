package com.bo.buycar.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.service.AdvertismentService;
import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.dto.PageList;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;

@Service
@Transactional
public class AdvertismentServiceImpl implements AdvertismentService{

	@Autowired
	AdvertismentDao advertismentDao;
	
	@Override
	public List<Advertisment> getAdvertismentByUser(User u) {
		return null;
	}

	@Override
	public Advertisment getAdvertismentById(int advertismentId) {
		return advertismentDao.getAdvertismentById(advertismentId);
	}

	@Override
	public void updateAdvertismentDate(int advertismentId) {
		advertismentDao.deleteAdvertisment(advertismentId);
		
	}

	@Override
	public void deleteAdvertisment(Advertisment advertisment) {
		advertismentDao.deleteAdvertisment(advertisment);
	}

	@Override
	public List<Advertisment> getAdvertismentAll() {
		return advertismentDao.getAdvertismentAll();
	}

	@Override
	public PageList getAdvertismentAll(String productCategory, int page) {
		PageList advertismentAll = advertismentDao.getAdvertismentAll(productCategory, page);
		return advertismentAll;
	}

	

}
