package com.bo.buycar.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bo.buycar.dao.ProductImageDao;
import com.bo.buycar.model.product.ProductImage;

@RequestMapping("/rest/productImage")
@RestController
public class ProductImageController {
	
	@Autowired
	ProductImageDao productImageDao;

	@DeleteMapping("/delete/{productImageId}")
	public String deleteImage(@PathVariable("productImageId") int productImageId) {
		productImageDao.deleteProductImage(productImageId);
		return "Deleted product image with id:" + productImageId;
	}
	
	
	@RequestMapping("/get/{productImageId}")
	@GetMapping
	public ProductImage getImage(@PathVariable("productImageId") int productImageId) {
		System.out.println(productImageId);
		ProductImage productImage = productImageDao.getProductImageById(productImageId);
		return productImage;
	}
	
}