package com.bo.buycar.service.impl;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.buycar.dao.ProductDao;
import com.bo.buycar.dao.ProductImageDao;
import com.bo.buycar.dao.RoleDao;
import com.bo.buycar.model.auth.Role;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.product.Product;
import com.bo.buycar.model.product.ProductImage;
import com.bo.buycar.service.ProductImageService;

@Service
@Transactional
public class ProductImageServiceImpl implements ProductImageService {

	@Autowired
	ProductImageDao productImageDao;

	@Autowired
	RoleDao roleDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	private HttpServletRequest request;

	@Override
	public ProductImage getProductImageById(int productImageId) {
		ProductImage productImage = productImageDao.getProductImageById(productImageId);

		return productImage;
	}

	@Override
	// Method authenticates user. Only owner of productImage or Admin user can
	// delete it.
	public String deleteProductImage(String username, int productImageId) {
		// Retrieves productImage based on the id of the entity
		ProductImage productImage = productImageDao.getProductImageById(productImageId);
		// Retrieves role of "ADMIN"
		Role adminRole = roleDao.getRoleByName("ADMIN");

		// Output message for rest controllor
		String msg = "";
		
		// Getting path of server
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");	

		if (productImage != null) {
			// Retrieves the owner of productImage
			User seller = productImage.getProduct().getAdvertisment().getSeller();

			// Checks if user is "ADMIN" or if it is the owner of the product image
			if (seller.getUsername().equals(username) || seller.getRoles().contains(adminRole)) {

				Product product = productImage.getProduct();
				System.out.println(product.getProductImages().size());
				product.getProductImages().remove(productImage);
				System.out.println(product.getProductImages().size());

				// Deletes the file from the system
				try {
					productDao.updateProduct(product);
					
					// Tries to delete image
					Path path = Paths.get(rootDirectory + "/resources/img/" + productImage.getProductImgName());
					System.out.println("Path is " + path);
					File imgFile = new File(path.toUri());
					imgFile.delete();
					
					msg = "Image" + productImage.getProductImgName() + " was deleted";
				} catch (Exception e) {
					msg = "Image" + productImage.getProductImgName() + " could not be deleated";
				}

			} else {
				msg = "Specified user is not allowed to delete image";
			}
		} else {
			msg = "No such image";
		}

		return msg;
	}

}
