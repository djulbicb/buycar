package com.bo.buycar.controller.rest;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bo.buycar.dao.ProductImageDao;
import com.bo.buycar.model.product.ProductImage;
import com.bo.buycar.service.ProductImageService;

@RequestMapping("/rest/productImage")
@RestController
public class ProductImageController {

	@Autowired
	ProductImageService productImageService;

	// Deletes product Image. Service authenticates user by checking it username or role.
	// Only owner of image or ADMIN user can delete an image
	@DeleteMapping("/delete/{productImageId}")
	public String deleteImage(@PathVariable("productImageId") int productImageId, Principal principal) {
		String msg = productImageService.deleteProductImage(principal.getName(),productImageId);
		
		return msg;
	}

	// Retrives product image based on the id
	@RequestMapping("/get/{productImageId}")
	@GetMapping
	public ProductImage getImage(@PathVariable("productImageId") int productImageId) {
		ProductImage productImage = productImageService.getProductImageById(productImageId);
		if (productImage != null) {
			return productImage;
		} else {
			return new ProductImage();
		}
	}

}
