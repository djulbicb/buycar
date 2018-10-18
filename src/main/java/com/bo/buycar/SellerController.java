package com.bo.buycar;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bo.buycar.dao.ProductDao;
import com.bo.buycar.model.product.Advertisment;
import com.bo.buycar.model.product.Product;
import com.bo.buycar.model.product.ProductImage;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@GetMapping("/addProduct")
	public String showAddProduct(Model model) {
		Product product = new Product();
		
		
		Calendar cal= Calendar.getInstance();
		DateFormat sdf = new SimpleDateFormat("yyyy");
		int year = Integer.parseInt(sdf.format(cal.getTime()));
		
		product.setProductYear(year);
		model.addAttribute("product", product);
		return "seller/addProduct";
	}
	
	@Autowired
	ProductDao productDao;
	
	@PostMapping("/addProduct")
	public String addProduct(Model model, @ModelAttribute("product") Product product, HttpServletRequest request) {
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path path = Paths.get(rootDirectory + "/resources/img/" + product.getProductId() + ".png");
		
		Advertisment advertisment = new Advertisment();
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
		
		productDao.addProduct(product);
		return "redirect:/seller/view/showAll";
	}
	
	@GetMapping("/view/showAll")
	public String showAllProducts(Model model) {
		List<Product> products = productDao.getProductAll();
		model.addAttribute("products", products);
		return "seller/allProducts";
	}
	
	@GetMapping("/view/{productId}")
	public String showProduct(@PathVariable("productId") int productId, Model model) {
		Product product = productDao.getProductById(productId);
		model.addAttribute("product", product);
		return "seller/viewProduct";
	}
	
	@GetMapping("/updateProduct/{productId}")
	public String showUpdateProduct(@PathVariable("productId") int productId, Model model) {
		Product product = productDao.getProductById(productId);
		model.addAttribute("product", product);
		return "seller/updateProduct";
	}
	
	@GetMapping("/deleteProduct/{productId}")
	public String showDeleteProduct(@PathVariable("productId") int productId, Model model) {
		Product product = productDao.getProductById(productId);
		model.addAttribute("product", product);
		return "seller/deleteProductCheck"; 
	}
	
	@PostMapping("/deleteProduct/{productId}")
	public String deleteProduct(@PathVariable("productId") int productId, Model model) {
		productDao.deleteProduct(productId);
		return "redirect:/seller/view/showAll"; 
	}
	
}
