package com.grocersbasketfrontend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.grocersbasket.dao.UserDao;
import com.grocersbasket.domain.User;
import com.grocersbasketfrontend.model.UserModel;

@ControllerAdvice
public class GlobalController {

	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserDao userDao;
	
	private UserModel userModel = null;
	
	
	@ModelAttribute("userModel")
	public UserModel getUserModel() {
		
		if(session.getAttribute("userModel")==null) {
			
			// add the user model
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			User user = userDao.getUserByEmail(authentication.getName());
			
			if(user!=null) {
				 
				// create a new UserModel object to pass the user details
				userModel = new UserModel();
				
				userModel.setUemail(user.getUemail());
				userModel.setRole(user.getRole());
				userModel.setFullName(user.getFirstName());
				
				if(userModel.getRole().equals("user")) {
					// set the cart only if user is a buyer
					userModel.setCart(user.getCart());					
				}
				
				//set the userModel in the session
				session.setAttribute("userModel", userModel);
				
				return userModel;
				
				
			}
			
			
			
			
		}
		
		
		return (UserModel) session.getAttribute("userModel");
		
	}
	
	
	
}