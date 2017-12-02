package com.grocersbasketfrontend.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.grocersbasket.dao.CategoryDao;
import com.grocersbasket.dao.ProductDao;
import com.grocersbasket.dao.UserDao;
import com.grocersbasket.domain.User;

@Controller
public class HomeController {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@RequestMapping(value= {"/","/index","/show/all/products"},method=RequestMethod.GET)
	public ModelAndView index(){
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_list",categoryDao.CategoryList());
		mav.addObject("productList",productDao.ProductList());
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping(value="/admin",method=RequestMethod.GET)

	public String adminDashboard() {
	return "admin";	
	}
	
	@RequestMapping(value="/error")
	public String error() {
		return "redirect:/";
	}
	
	@RequestMapping(value="/userlogged")
	public String userLogged() {
		return "redirect:/";
	}
	

	
	
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(name="error", required=false)String error,@RequestParam(name="logout" ,required=false)String logout) {		
		ModelAndView mv = new ModelAndView("login");
		if(error!=null) {
			mv.addObject("message","Invalid username or password!");
			if(logout!=null) {
				mv.addObject("logout", "User has successfully logged out!");
			}
		}
		
		return mv;				
	}	
	
	
	
	 //access denied page
	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {		
		ModelAndView mv = new ModelAndView("access_denied");		
	
		return mv;				
	}
	

	
	@RequestMapping(value = "/perform-logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		// first we are going to fetch the authentication
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth!=null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
				
		return "redirect:/login?logout";
	}
	  
	  @RequestMapping(value="/signup", method= RequestMethod.GET)
		public ModelAndView Register()
		{
			ModelAndView mav= new ModelAndView();
		    mav.addObject("user", new User());
			mav.setViewName("signup");
			return mav;
		}
		
		
	@RequestMapping(value="/saveUser", method= RequestMethod.POST)
		public ModelAndView saveUser(@ModelAttribute("user") User user, BindingResult result)
		{
			System.out.println("save user");
			ModelAndView mav= new ModelAndView();
			if(result.hasErrors())
			{
				mav.setViewName("signup");
				return mav;
			}
			else
			{
				user.setRole("User");
			    userDao.InsertUser(user);
			    mav.setViewName("redirect:/login");
			    return mav;
			}
		}
			
			@RequestMapping("/404")
			public String globalErro() {
		return "/404";	
		}
			
		
}
