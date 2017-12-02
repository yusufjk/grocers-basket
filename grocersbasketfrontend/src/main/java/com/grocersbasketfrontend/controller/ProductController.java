package com.grocersbasketfrontend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.grocersbasket.dao.CategoryDao;
import com.grocersbasket.dao.ProductDao;
import com.grocersbasket.domain.Category;
import com.grocersbasket.domain.Product;

@Controller
public class ProductController {
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ProductDao productDao;
	
	
	
	
	@RequestMapping(value = "/show/category/{cid}/products")
	public ModelAndView showCategoryProducts(@PathVariable("cid") int cid,Product product,Category category) {		
		ModelAndView mav = new ModelAndView("index");
productDao.GetProductById(cid);
mav.addObject("category", categoryDao.GetCategoryById(cid));
mav.addObject("c_list",categoryDao.CategoryList());
mav.addObject("productList",productDao.Productbyid(cid));


		
		return mav;				
	}	
	
	
	/*
	 * Viewing a single products
	 * */
	
	@RequestMapping(value = "/show/{pid}/product") 
	public ModelAndView showSingleProduct(@PathVariable int pid){
		
		ModelAndView mv = new ModelAndView("singleProduct");
		
		Product product = productDao.GetProductById(pid) ;
		
		
	//---------------------------
	
		
		mv.addObject("product", product);
		
		
		return mv;
		
	}

}
