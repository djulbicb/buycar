package com.bo.buycar.service.impl;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	SessionFactory sessionFactory;
	
}
