package com.bo.buycar.dao.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.bo.buycar.dao.service.AdvertismentService;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;

@Service
@Transactional
public class AdvertismentServiceImpl implements AdvertismentService{

	
	
	@Override
	public List<Advertisment> getAdvertismentByUser(User user) {
		
		return null;
	}

}
