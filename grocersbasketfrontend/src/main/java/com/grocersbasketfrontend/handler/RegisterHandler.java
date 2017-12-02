package com.grocersbasketfrontend.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.grocersbasket.dao.UserDao;
import com.grocersbasket.domain.Address;
import com.grocersbasket.domain.Cart;
import com.grocersbasket.domain.User;
import com.grocersbasketfrontend.model.RegisterModel;

@Component
public class RegisterHandler {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

public RegisterModel init() {
	return new RegisterModel();
	
}
public void addUser(RegisterModel registerModel,User user) 
{
	
registerModel.setUser(user);
}

public void addBilling(RegisterModel registerModel,Address billing) 
{
	
registerModel.setBilling(billing);
}

public String saveAll(RegisterModel model) {
	String transitionValue = "success";
	
	User user=model.getUser();
	Cart cart = new Cart();
	cart.setUser(user);
	user.setCart(cart);
	
	user.setUpassword(passwordEncoder.encode(user.getUpassword()));
	
	userDao.InsertUser(user);
	
	//get address
	Address billing = model.getBilling();
	billing.setUemail(user.getUemail());
	billing.setBilling(true);
	
	//save address
	userDao.addAddress(billing);
	
	return transitionValue;
	
}

public String validateUser(User user,MessageContext error)
{
String transitionValue="success";
if(!(user.getUpassword().equals(user.getConfirmPassword())))
{
	error.addMessage(new MessageBuilder().error().source("confirmPassword").defaultText("Passwords does not match!").build());
transitionValue="failure";
}


if(userDao.getUserByEmail(user.getUemail())!=null) {
	
	error.addMessage(new MessageBuilder().error().source("uemail").defaultText("Email is already taken!").build());
	transitionValue="failure";
}
if(userDao.getUserByName(user.getFirstName())!=null) {
	
	error.addMessage(new MessageBuilder().error().source("firstName").defaultText("Name is already taken!").build());
	transitionValue="failure";
}
return transitionValue;
}

}
