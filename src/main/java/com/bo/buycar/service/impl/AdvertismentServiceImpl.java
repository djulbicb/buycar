package com.bo.buycar.service.impl;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.service.AdvertismentService;
import com.bo.buycar.service.ProductImageService;
import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.dto.PageList;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.product.ProductImage;

@Service
@Transactional
public class AdvertismentServiceImpl implements AdvertismentService{

	@Autowired
	AdvertismentDao advertismentDao;
	
	@Autowired
	ProductImageService productImageService;
	
	@Autowired
	private HttpServletRequest request;
	
	@Override
	public Advertisment getAdvertismentById(int advertismentId) {
		return advertismentDao.getAdvertismentById(advertismentId);
	}

	@Override
	public void updateAdvertismentDate(int advertismentId) {
		Advertisment advertisment = advertismentDao.getAdvertismentById(advertismentId);
		advertisment.setLastModifiedDate(new Date());
		advertismentDao.updateAdvertisment(advertisment);		
	}

	@Override
	public void deleteAdvertisment(Advertisment advertisment) {
		User seller = advertisment.getSeller();
		seller.getAdvertsSold().remove(advertisment);
		if (advertisment!=null) {
			advertisment.setSeller(null);
		}
		
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		List<ProductImage> productImages = advertisment.getProduct().getProductImages();
		for (ProductImage productImage : productImages) {
			try {
				Path path = Paths.get(rootDirectory + "/resources/img/" + productImage.getProductImgName());
				System.out.println("Path is " + path);
				File imgFile = new File(path.toUri());
				imgFile.delete();	
			} finally {
				// TODO: handle finally clause
			}
		}
		
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
