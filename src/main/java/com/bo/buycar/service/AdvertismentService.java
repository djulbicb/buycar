package com.bo.buycar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;


public interface AdvertismentService {
	List<Advertisment> getAdvertismentByUser(User u);
}
