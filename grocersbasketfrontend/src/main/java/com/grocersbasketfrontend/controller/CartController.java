package com.grocersbasketfrontend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.grocersbasketfrontend.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name="result",required=false)String result) {
		
		ModelAndView mav=new ModelAndView("cart");
		
		if(result!=null) {
			
			switch(result) {
			case "updated":
				mav.addObject("message","CartLine has been updated successfully!");
				break;
				
			case "error":
				mav.addObject("message","Something went wrong!");
				break;
				
				
			case "deleted":
				mav.addObject("message","Item has been removed successfully from the cart!");
				break;
			
			}
			
		}
		
		
		mav.addObject("cartLines", cartService.getCartLines());
		return mav;
	}


	
	@RequestMapping("/{cartLineId}/remove")
	public ModelAndView deleteCartLine(@PathVariable int cartLineId)
	{
		ModelAndView mav = new ModelAndView();
		String response=cartService.removeCartLine(cartLineId);
		mav.setViewName("redirect:/cart/show?"+response);
		return mav;
	}

	
	
	@RequestMapping("/{cartLineId}/update")
	public ModelAndView updateCart(@PathVariable int cartLineId,@RequestParam int count)
	{
		String response=cartService.manageCartLine(cartLineId, count);
		ModelAndView mav= new ModelAndView();
		mav.setViewName("redirect:/cart/show?"+ response);
		
		return mav; 
	}
	
	
	@RequestMapping("/add/{pid}/product")
	public String addCart(@PathVariable int pid)
	{
		
		String response=cartService.addCartLine(pid);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping("/validate")
	public String validateCart() {	
		String response = cartService.validateCartLine();
		if(!response.equals("result=success")) {
			return "redirect:/cart/show?"+response;
		}
		else {
			return "redirect:/cart/checkout";
		}
	}	
	
	
}
