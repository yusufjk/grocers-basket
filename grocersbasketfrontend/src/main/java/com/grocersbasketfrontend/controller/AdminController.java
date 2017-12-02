package com.grocersbasketfrontend.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.grocersbasket.dao.CategoryDao;
import com.grocersbasket.dao.ProductDao;
import com.grocersbasket.dao.SupplierDao;
import com.grocersbasket.dao.UserDao;

import com.grocersbasket.domain.Category;
import com.grocersbasket.domain.Product;
import com.grocersbasket.domain.Supplier;
import com.grocersbasket.domain.User;
import com.grocersbasketfrontend.utils.FileUploadUtility;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProductDao productDao;
	
	
	@Autowired
	private SupplierDao supplierDao;
	
		
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	
//start of user crud
	
	@RequestMapping(value="/users",method=RequestMethod.GET)
	public ModelAndView userDashboard() {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("user", new User());
        
		mav.setViewName("users");
		List<User> userList=userDao.UserList();
		mav.addObject("ulist",userList);
		
		return mav;
	}
	

	
	@RequestMapping(value="/users/editUser",method=RequestMethod.GET)
	public ModelAndView getUser(User user,BindingResult result,@RequestParam("uemail")String uemail,Map<String,Object>map) {
		ModelAndView mav=new ModelAndView();
		user=userDao.getUserByEmail(uemail);
		mav.addObject("user", user);
		
		map.put("firstName", user.getFirstName());
		map.put("lastName", user.getLastName());
		map.put("phoneNumber", user.getPhoneNumber());
		map.put("uemail", user.getUemail());
		map.put("role", user.getRole());
		map.put("upassword", user.getUpassword());
		mav.setViewName("redirect:/admin/users");
		
		return mav;
		
	}
	
     @RequestMapping(value="/users/editUser",method=RequestMethod.POST)
	public ModelAndView editUser(@ModelAttribute("user")User user,BindingResult result) {
		ModelAndView mav=new ModelAndView();
		user.setUpassword(passwordEncoder.encode(user.getUpassword()));

		userDao.updateUser(user);
		
	
		
		mav.setViewName("redirect:/admin/users");
		return mav;
		
		
     }

	
	
	@RequestMapping(value="/users/insertUser",method=RequestMethod.POST)
	public ModelAndView insertUser(@ModelAttribute("user")User user) {
		ModelAndView mav=new ModelAndView();
		userDao.InsertUser(user);
		
		mav.setViewName("redirect:/admin/users");
		return mav;
		
	}
	
	
	
	@RequestMapping(value="/users/deleteUser",method=RequestMethod.GET)
	public ModelAndView deleteUser(@RequestParam("uemail") String uemail,User user,BindingResult result) {
		ModelAndView mav=new ModelAndView();
	    user=userDao.getUserByEmail(uemail);
		userDao.deleteUser(user);
		mav.setViewName("redirect:/admin/users");
		return mav;
		
	}
	
	//<---------end of user crud------->

	
	
	
	//start of category crud
	
	
	@RequestMapping(value="/category",method=RequestMethod.GET)
	public ModelAndView categoryDashboard(){
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_list", categoryDao.CategoryList() );
		mav.addObject("category", new Category());
		mav.setViewName("category");
		return mav;
		
		
	}
	
	@RequestMapping(value="/category/insertCategory",method=RequestMethod.POST)
	public ModelAndView insertCategory(@ModelAttribute("category") Category category,BindingResult result) {
		ModelAndView mav=new ModelAndView();
		
		
		categoryDao.InsertCategory(category);	
			
		mav.setViewName("redirect:/admin/category");
		return mav;
		
	}
	
	
	@RequestMapping(value="/category/deleteCategory",method=RequestMethod.GET)
	public ModelAndView deleteCategory(@RequestParam("cid") int cid,Category category,BindingResult result) {
		ModelAndView mav=new ModelAndView();
	    category=categoryDao.GetCategoryById(cid);
		categoryDao.deleteCategory(category);
		mav.setViewName("redirect:/admin/category");
		return mav;
		
	}
	
	
	
	
	@RequestMapping(value="/category/editCategory",method=RequestMethod.GET)
	public ModelAndView getCategory(Category category,BindingResult result,@RequestParam("cid") int cid ,Map<String,Object>map) {
		ModelAndView mav=new ModelAndView();
		category=categoryDao.GetCategoryById(cid);
		mav.addObject("category", category);
		
		map.put("cid", category.getCid());
		map.put("cname", category.getCname());
		mav.setViewName("redirect:/admin/category");
		
		return mav;
		
	}
	
     @RequestMapping(value="/category/editCategory",method=RequestMethod.POST)
	public ModelAndView editCategory(@ModelAttribute("category")Category category,BindingResult result) {
		ModelAndView mav=new ModelAndView();

		categoryDao.updateCategory(category);
		
	
		
		mav.setViewName("redirect:/admin/category");
		return mav;
		
		
     }
	
	
	
	
	
	//<-------end of category crud ------>
	
	
	
     //start of product crud
     
     @RequestMapping(value="/product",method=RequestMethod.GET)
	public ModelAndView productDashboard(){
		ModelAndView mav=new ModelAndView();
		mav.addObject("p_list", productDao.ProductList() );
		mav.addObject("product", new Product());
		mav.addObject("c_list", categoryDao.CategoryList());
		mav.addObject("s_list", supplierDao.SupplierList());
		mav.setViewName("product");
		return mav;
		
		
	}
	
	@RequestMapping(value="/product/insertProduct",method=RequestMethod.POST)
	public ModelAndView productCrud(@RequestParam("cid")int cid,@RequestParam("sid")int sid,@ModelAttribute("product") Product product,BindingResult result,HttpServletRequest request)
	{
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_list", categoryDao.CategoryList());
		mav.addObject("s_list", supplierDao.SupplierList());
		product.setCategory(categoryDao.GetCategoryById(cid));
		product.setSupplier(supplierDao.GetsupplierById(sid));
			productDao.InsertProduct(product);
			if(!product.getImage().getOriginalFilename().equals("")) {
				
				FileUploadUtility.uploadFile(request,product.getImage());
			}
		
		
		mav.setViewName("redirect:/admin/product");
		
	return mav;
	}
	
	
	
	@RequestMapping(value="/product/deleteProduct",method=RequestMethod.GET)
	public ModelAndView deleteProduct(@RequestParam("pid") int pid,Product product,BindingResult result) {
		ModelAndView mav=new ModelAndView();
	    product=productDao.GetProductById(pid);
		productDao.DeleteProduct(pid);
		mav.setViewName("redirect:/admin/product");
		return mav;
		
	}
	
	
	@RequestMapping(value="/product/editProduct",method=RequestMethod.GET)
	public ModelAndView getProduct(Product product,BindingResult result,@RequestParam("pid")int pid,Map<String,Object>map) {
		ModelAndView mav=new ModelAndView();
		
		
		product=productDao.GetProductById(pid);
		mav.addObject("product", product);
		
		map.put("productName", product.getProductName());
		map.put("description", product.getDescription());
		map.put("cname", product.getCategory().getCname());
		map.put("sname", product.getSupplier().getSname());
		map.put("price", product.getPrice());
		map.put("stock", product.getStock());
		mav.setViewName("redirect:/admin/product");
		
		return mav;
		
	}
	
	 @RequestMapping(value="/product/editProduct",method=RequestMethod.POST)
		public ModelAndView editProduct(@RequestParam("cid")int cid,@RequestParam("sid")int sid,@RequestParam("pid")int pid,@ModelAttribute("product")Product product,BindingResult result,HttpServletRequest request) {
			ModelAndView mav=new ModelAndView();
			

			product.setCategory(categoryDao.GetCategoryById(cid));
product.setSupplier(supplierDao.GetsupplierById(sid));

if(!product.getImage().getOriginalFilename().equals("")) {
	
	FileUploadUtility.uploadFile(request,product.getImage());
}
			productDao.UpdateProduct(product);
			
		
			
			mav.setViewName("redirect:/admin/product");
			return mav;
			
			
	     }
	
	
	//<--------end of product crud------------->
	
	
	//start of supplier crud
	
	
	@RequestMapping(value="/supplier",method=RequestMethod.GET)
	public ModelAndView supplierDashboard(){
		ModelAndView mav=new ModelAndView();
		mav.addObject("s_list", supplierDao.SupplierList() );
		mav.addObject("supplier", new Supplier());
		mav.setViewName("supplier");
		return mav;
		
		
	}
	
	@RequestMapping(value="/supplier/insertSupplier",method=RequestMethod.POST)
	public ModelAndView insertSupplier(@ModelAttribute("supplier") Supplier supplier,BindingResult result) {
		ModelAndView mav=new ModelAndView();
		
		supplierDao.insertSupplier(supplier);	
			
		mav.setViewName("redirect:/admin/supplier");
		return mav;
		
	}
	
	
	@RequestMapping(value="/supplier/deleteSupplier",method=RequestMethod.GET)
	public ModelAndView deleteSupplier(@RequestParam("sid") int sid,Supplier supplier,BindingResult result) {
		ModelAndView mav=new ModelAndView();
	    
	    supplier=supplierDao.GetsupplierById(sid);
		supplierDao.deleteSupplier(supplier);
		mav.setViewName("redirect:/admin/supplier");
		return mav;
		
	}
	
	
	
	
	@RequestMapping(value="/supplier/editSupplier",method=RequestMethod.GET)
	public ModelAndView getSupplier(Supplier supplier,BindingResult result,@RequestParam("sid") int sid ,Map<String,Object>map) {
		ModelAndView mav=new ModelAndView();
		
		supplier=supplierDao.GetsupplierById(sid);
		mav.addObject("supplier", supplier);
		
		map.put("sid", supplier.getSid());
		map.put("sname", supplier.getSname());
		mav.setViewName("redirect:/admin/supplier");
		
		return mav;
		
	}
	
     @RequestMapping(value="/supplier/editSupplier",method=RequestMethod.POST)
	public ModelAndView editSupplier(@ModelAttribute("supplier") Supplier supplier,BindingResult result) {
		ModelAndView mav=new ModelAndView();

		
		supplierDao.updateSupplier(supplier);
	
		
		mav.setViewName("redirect:/admin/supplier");
		return mav;
		
		
     }
	
	
	
	
	//<-----------end of supplier crud ------------>
	
}
