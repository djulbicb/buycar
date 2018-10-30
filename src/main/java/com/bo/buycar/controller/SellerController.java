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
import java.util.Random;
import java.util.Set;
import java.util.UUID;

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
import com.bo.buycar.service.AdvertismentService;
import com.bo.buycar.service.ProductService;
import com.bo.buycar.service.UserService;
import com.bo.buycar.service.impl.UserDetailsServiceImpl;

@Controller
@RequestMapping("/seller")
public class SellerController {

	/*
	 * @ExceptionHandler(Exception.class) public String showError(Exception e) {
	 * return e.getMessage(); }
	 */

	@Autowired
	AdvertismentService advertismentService;

	@Autowired
	UserService userService;

	@Autowired
	ProductService productService;

	@Autowired
	private HttpServletRequest request;

	// Shows form for adding products
	@GetMapping("/addProduct")
	public String getAddProduct(Model model) {

		// Create default Product model that is going to be used as model attribute in
		// the form
		Random random = new Random();
		Product product = new Product();
		product.setProductName("Item " + random.nextInt(100));
		product.setProductDescription("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic");
		product.setProductCategory("CAR");
		int price = (int)(random.nextDouble()*10000);
		System.out.println(price);
		product.setProductPrice(price / 100d);
		
		ProductCategory[] productCategories = ProductCategory.values();

		Calendar cal = Calendar.getInstance();
		DateFormat sdf = new SimpleDateFormat("yyyy");
		int year = Integer.parseInt(sdf.format(cal.getTime()));

		product.setProductYear(year);

		// Add data into model to be used in the form
		model.addAttribute("product", product);
		model.addAttribute("productCategories", productCategories);

		// return jsp page
		return "seller/addProduct";
	}

	// Show one single product
	// TODO - change it to be avaiable to all
	@GetMapping("/view/{productId}")
	public String showProduct(@PathVariable("productId") int productId, Model model) {
		Product product = productService.getProductById(productId);
		model.addAttribute("product", product);
		return "seller/viewProduct";
	}

	// Show all advertisments that user has created
	@GetMapping("/view/showAll")
	public String getAllProducts(Model model, @AuthenticationPrincipal Principal principal) {

		// Retrives user from the database
		String username = principal.getName();
		User user = userService.findUserByUsername(username);

		// Get All advertisments that user has bought
		Set<Advertisment> advertsBought = user.getAdvertsBought();
		if (advertsBought != null) {
			System.out.println(advertsBought);
		}

		// Get All advertisments that user has added to the shop
		Set<Advertisment> advertsSold = user.getAdvertsSold();
		if (advertsSold != null) {
			System.out.println(advertsSold);
		}

		// Add items user has added to store into model
		model.addAttribute("adverts", advertsSold);

		// return jsp view to show all items user has added to the store
		return "seller/allProducts";
	}

	// Adding product and its advertisment into database
	@PostMapping("/addProduct")
	public String getAddProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
			@AuthenticationPrincipal Principal principal) {
		// Check if any validation error in the request. Returns to add product jsp page
		// if there are errors
		if (result.hasErrors()) {
			return "seller/addProduct";
		}

		// Retrives path of the server. Used for saving images
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path path = Paths.get(rootDirectory + "/resources/img/" + product.getProductId() + ".png");

		// Retrives username of the user who initiated the request and find user entity
		String username = principal.getName();
		User user = userService.findUserByUsername(username);

		// Check for image files that are uploaded. Save the images to server folder
		// if set to local path will look something like this
		// C:\Users\Bojan\eclipse-ee-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\buycar\resources\img

		if (product.getProductImageFile() != null && product.getProductImageFile().size() > 0) {
			List<MultipartFile> productImageFile = product.getProductImageFile();

			for (MultipartFile file : productImageFile) {
				String dbProductImageName = UUID.randomUUID().toString() + ".jpg";

				path = Paths.get(rootDirectory + "/resources/img/" + dbProductImageName); // file.getOriginalFilename()
				try {
					file.transferTo(new File(path.toString()));
					ProductImage img = new ProductImage();
					img.setProductImgName(dbProductImageName);
					img.setProduct(product);
					product.getProductImages().add(img);
				} catch (Exception e) {
					throw new RuntimeException("Product image serving failed", e);
				}
			}
		}

		// Create a advertisment with specified product
		Advertisment advertisment = new Advertisment();
		advertisment.setProduct(product);
		product.setAdvertisment(advertisment);
		advertisment.setSeller(user);
		advertisment.setActive(true);
		advertisment.setLastModifiedDate(new Date());
		advertisment.setPublishDate(new Date());
		product.setAdvertisment(advertisment);
		user.getAdvertsSold().add(advertisment);

		// Save advertisment by updating user
		userService.updateUser(user);

		// show all products that belong to logged in user after saving
		return "redirect:/seller/view/showAll";
	}

	@GetMapping("/updateProduct/{advertismentId}")
	public String getUpdateProduct(@PathVariable("advertismentId") int advertismentId, Model model) {
		// Product product = productDao.getProductById(productId);
		Advertisment advertisment = advertismentService.getAdvertismentById(advertismentId);
		model.addAttribute("product", advertisment.getProduct());
		model.addAttribute("ad", advertisment);
		return "seller/updateProduct";
	}

	// Shows form for adding products
	@PostMapping("/updateProduct/{advertismentId}")
	public String postUpdateProduct(@PathVariable("advertismentId") int advertismentId, @Valid @ModelAttribute("product") Product product, BindingResult result,
			@AuthenticationPrincipal Principal principal) {
		// Check if any validation error in the request. Returns to add product jsp page
		// if there are errors
		System.out.println(product);
		if (result.hasErrors()) {
			// return "redirect:/seller/updateProduct/" + product.getProductId();
			Product productById = productService.getProductById(product.getProductId());
			product.setProductImages(productById.getProductImages());
			return "seller/updateProduct";
		}
		System.out.println("Stigao ovde");
		// Retrives path of the server. Used for saving images
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		// Retrives username of the user who initiated the request and find user entity
		String username = principal.getName();
		User user = userService.findUserByUsername(username);
		System.out.println(user);
		
		
		Advertisment advertismentById = advertismentService.getAdvertismentById(advertismentId);
		Product productDb = advertismentById.getProduct();
		productDb.setProductCategory(product.getProductCategory());
		productDb.setProductDescription(product.getProductDescription());
		productDb.setProductName(product.getProductName());
		productDb.setProductPrice(product.getProductPrice());
		productDb.setProductYear(product.getProductYear());
		
		
		System.out.println("Stigao ovde pre cuvanja slika");
		// Check for image files that are uploaded. Save the images to server folder
		// if set to local path will look something like this
		// C:\Users\Bojan\eclipse-ee-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\buycar\resources\img

		if (product.getProductImageFile() != null && product.getProductImageFile().size() > 0) {
			List<MultipartFile> productImageFile = product.getProductImageFile();

			for (MultipartFile file : productImageFile) {
				if (file.getOriginalFilename().trim().length() > 0) {
					String dbProductImageName = UUID.randomUUID().toString() + ".jpg";
					System.out.println("------------- " + file.getOriginalFilename());
					Path path = Paths.get(rootDirectory + "/resources/img/" + dbProductImageName); // file.getOriginalFilename()
					try {
						file.transferTo(new File(path.toString()));
						ProductImage img = new ProductImage();
						img.setProductImgName(dbProductImageName);
						img.setProduct(product);
						productDb.getProductImages().add(img);
					} catch (Exception e) {
						throw new RuntimeException("Product image serving failed", e);
					}
				}
			}
		}
		System.out.println("Stigao ovde posle cuvanja slika");

		productService.updateProduct(productDb);
		
		return "redirect:/seller/view/showAll";
	}

	// Show page for checking deletion of the advertisment
	@GetMapping("/deleteProduct/{advertismentId}")
	public String getDeleteProduct(@PathVariable("advertismentId") int advertismentId, Model model) {
		Advertisment advertismentById = advertismentService.getAdvertismentById(advertismentId);
		model.addAttribute("ad", advertismentById);
		return "seller/deleteProductCheck";
	}

	@PostMapping("/deleteProduct/{advertismentId}")
	public String postDeleteProduct(@PathVariable("advertismentId") int advertismentId, Model model) {
		Advertisment advertisment = advertismentService.getAdvertismentById(advertismentId);
		advertismentService.deleteAdvertisment(advertisment);
		return "redirect:/seller/view/showAll";
	}

}
