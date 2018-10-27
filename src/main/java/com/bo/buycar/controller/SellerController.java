package com.bo.buycar.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bo.buycar.dao.AdvertismentDao;
import com.bo.buycar.dao.ProductDao;
import com.bo.buycar.dao.UserDao;
import com.bo.buycar.model.Advertisment;
import com.bo.buycar.model.auth.User;
import com.bo.buycar.model.product.Product;
import com.bo.buycar.model.product.ProductCategory;
import com.bo.buycar.model.product.ProductImage;
import com.bo.buycar.service.impl.UserDetailsServiceImpl;


@Controller
@RequestMapping("/seller")
public class SellerController {

	/*
	@ExceptionHandler(Exception.class)
	public String showError(Exception e)
	{
		return e.getMessage();
	}*/
	
	@Autowired
	AdvertismentDao advertismentDao; 
	
	@Autowired
	UserDao userDao;
	
	@GetMapping("/addProduct")
	public String showAddProduct(Model model) {	
		Product product = new Product();
		
		ProductCategory[] productCategories = ProductCategory.values();
		
		Calendar cal= Calendar.getInstance();
		DateFormat sdf = new SimpleDateFormat("yyyy");
		int year = Integer.parseInt(sdf.format(cal.getTime()));
		
		product.setProductYear(year);
		model.addAttribute("product", product);
		model.addAttribute("productCategories", productCategories);
		return "seller/addProduct";
	}
	
	@Autowired
	ProductDao productDao;
	
	@PostMapping("/addProduct")
	public String getAddProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, HttpServletRequest request, @AuthenticationPrincipal Principal principal) {
		if (result.hasErrors()) {
			return "seller/addProduct";
		}
		
		System.out.println("POST");
		
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path path = Paths.get(rootDirectory + "/resources/img/" + product.getProductId() + ".png");
		

		String username = principal.getName();
		System.out.println(username);
		User user = userDao.getUserByUsername(username);
		
		
		
		System.out.println(product);
		
		
		
		if (product.getProductImageFile() != null && product.getProductImageFile().size() > 0) {
			List<MultipartFile> productImageFile = product.getProductImageFile();
			
			for (MultipartFile file : productImageFile) {
				path = Paths.get(rootDirectory + "/resources/img/" + file.getOriginalFilename());
				try {
					file.transferTo(new File(path.toString()));
					ProductImage img = new ProductImage();
					img.setProductImgName(file.getOriginalFilename());
					img.setProduct(product);
					product.getProductImages().add(img );
				} catch (Exception e) {
					throw new RuntimeException("Product image serving failed", e);
				}
			}
		}
		
		Advertisment advertisment = new Advertisment();
		advertisment.setProduct(product);
		product.setAdvertisment(advertisment);
		advertisment.setSeller(user);
		advertisment.setActive(true);
		advertisment.setLastModifiedDate(new Date());
		advertisment.setPublishDate(new Date());
		product.setAdvertisment(advertisment);
		user.getAdvertsSold().add(advertisment);
		
		//advertismentDao.addAdvertisment(advertisment);			
			userDao.updateUser(user);	
		return "redirect:/seller/view/showAll";
	}

	
	@GetMapping("/view/showAll")
	public String showAllProducts(Model model, @AuthenticationPrincipal Principal principal) {
		// List<Product> products = productDao.getProductAll();
		
		String username = principal.getName();
		System.out.println(username);
		User user = userDao.getUserByUsername(username);
		System.out.println(user);

		Set<Advertisment> advertsBought = user.getAdvertsBought();
		if (advertsBought!=null) {
			System.out.println(advertsBought);
		}
		Set<Advertisment> advertsSold = user.getAdvertsSold();
		if (advertsSold!=null) {
			System.out.println(advertsSold);
		}
		
		model.addAttribute("adverts", advertsSold);
		
		return "seller/allProducts";
	}
	
	@GetMapping("/view/{productId}")
	public String showProduct(@PathVariable("productId") int productId, Model model) {
		Product product = productDao.getProductById(productId);
		model.addAttribute("product", product);
		return "seller/viewProduct";
	}
	
	@GetMapping("/updateProduct/{advertismentId}")
	public String showUpdateProduct(@PathVariable("advertismentId") int advertismentId, Model model) {
		//Product product = productDao.getProductById(productId);
		Advertisment advertisment = advertismentDao.getAdvertismentById(advertismentId);
		model.addAttribute("product", advertisment.getProduct());
		model.addAttribute("ad", advertisment);
		return "seller/updateProduct";
	}
	
	@PostMapping("/updateProduct/{advertismentId}")
	public String updateProduct(@PathVariable("advertismentId") int advertismentId, @Valid @ModelAttribute("product") Product product, BindingResult result, HttpServletRequest request, Model model) {
		System.out.println("POST UPDATE");
		System.out.println(product);

		
		if (result.hasErrors()) {
			//return "redirect:/seller/updateProduct/" + product.getProductId();
			Product productById = productDao.getProductById(product.getProductId());
			product.setProductImages(productById.getProductImages());
			return "seller/updateProduct";
		}
		
		System.out.println(product);

		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path path = Paths.get(rootDirectory + "/resources/img/" + product.getProductId() + ".png");
		
		System.out.println(product);
		if (product.getProductImageFile() != null && product.getProductImageFile().size() > 0) {
			List<MultipartFile> productImageFile = product.getProductImageFile();
			
			for (MultipartFile file : productImageFile) {
				try {
					path = Paths.get(rootDirectory + "/resources/img/" + file.getOriginalFilename());
					file.transferTo(new File(path.toString()));
					ProductImage img = new ProductImage();
					img.setProductImgName(file.getOriginalFilename());
					img.setProduct(product);
					product.getProductImages().add(img );
				} catch (Exception e) {
					//throw new RuntimeException("Product image serving failed", e);
				}
			}
		}
		System.out.println(product);
		productDao.updateProduct(product);
		advertismentDao.updateAdvertismentDate(advertismentId);
		return "redirect:/seller/view/showAll";
	}
	
	@GetMapping("/deleteProduct/{advertismentId}")
	public String showDeleteProduct(@PathVariable("advertismentId") int advertismentId, Model model) {
		Advertisment advertismentById = advertismentDao.getAdvertismentById(advertismentId);
		model.addAttribute("ad", advertismentById);
		return "seller/deleteProductCheck"; 
	}
	
	@PostMapping("/deleteProduct/{productId}")
	public String deleteProduct(@PathVariable("advertismentId") int advertismentId, Model model) {
		Advertisment advertisment = advertismentDao.getAdvertismentById(advertismentId);
		advertismentDao.deleteAdvertisment(advertisment);
		return "redirect:/seller/view/showAll"; 
	}
	
}
