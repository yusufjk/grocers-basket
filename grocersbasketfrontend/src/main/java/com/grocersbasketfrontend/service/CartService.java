package com.grocersbasketfrontend.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grocersbasket.dao.CartLineDao;
import com.grocersbasket.dao.ProductDao;
import com.grocersbasket.domain.Cart;
import com.grocersbasket.domain.CartLine;
import com.grocersbasket.domain.Product;
import com.grocersbasketfrontend.model.UserModel;


@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDao cartLineDao;
	
	@Autowired
	private ProductDao productDao;
		
	@Autowired
	private HttpSession session;
	
	public List<CartLine> getCartLines() {

		return cartLineDao.list(getCart().getId());

	}
	
	/* to update the cart count */
	public String manageCartLine(int cartLineId, int count) {
		
		CartLine cartLine = cartLineDao.get(cartLineId);		

		double oldTotal = cartLine.getTotal();

		
		Product product = cartLine.getProduct();
		
		// check if that much quantity is available or not
		if(product.getStock() < count) {
			return "result=unavailable";		
		}	
		
		// update the cart line
		cartLine.setProductCount(count);
		cartLine.setBuyingPrice(product.getPrice());
		cartLine.setTotal(product.getPrice() * count);
		cartLineDao.update(cartLine);

	
		// update the cart
		Cart cart = this.getCart();
		cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartLine.getTotal());
		cartLineDao.updateCart(cart);
		
		return "result=updated";
	}



	public String addCartLine(int pid) {		
		Cart cart = this.getCart();
		String response = null;
		CartLine cartLine = cartLineDao.getByCartAndProduct(cart.getId(), pid);
		if(cartLine==null) {
			// add a new cartLine if a new product is getting added
			cartLine = new CartLine();
			Product product = productDao.GetProductById(pid);
			// transfer the product details to cartLine
			cartLine.setCartId(cart.getId());
			cartLine.setProduct(product);
			cartLine.setProductCount(1);
			cartLine.setBuyingPrice(product.getPrice());
			cartLine.setTotal(product.getPrice());
			
			// insert a new cartLine
			cartLineDao.add(cartLine);
			
			// update the cart
			cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
			cart.setCartLines(cart.getCartLines() + 1);
			cartLineDao.updateCart(cart);

			response = "result=added";						
		} 
		else {
			// check if the cartLine has been already reached to maximum count
			if(cartLine.getProductCount() < 3) {
				// call the manageCartLine method to increase the count
				response = this.manageCartLine(cartLine.getId(), cartLine.getProductCount() + 1);				
			}			
			else {				
				response = "result=maximum";				
			}						
		}		
		return response;
	}
	
	private Cart getCart() {
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}


	public String removeCartLine(int cartLineId) {
		
		CartLine cartLine = cartLineDao.get(cartLineId);
		// deduct the cart
		// update the cart
		Cart cart = this.getCart();	
		cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
		cart.setCartLines(cart.getCartLines() - 1);		
		cartLineDao.updateCart(cart);
		
		// remove the cartLine
		cartLineDao.delete(cartLine);
				
		return "result=deleted";
	}


	public String validateCartLine() {
		Cart cart = this.getCart();
		List<CartLine> cartLines = cartLineDao.list(cart.getId());
		double grandTotal = 0.0;
		int lineCount = 0;
		String response = "result=success";
		boolean changed = false;
		Product product = null;
		for(CartLine cartLine : cartLines) {					
			product = cartLine.getProduct();
			changed = false;
			
			// check if the cartLine is not available
			
			if((product.getStock() > 0) && !(cartLine.isAvailable())) {
					cartLine.setAvailable(true);
					changed = true;
			}
			
			// check if the buying price of product has been changed
			if(cartLine.getBuyingPrice() != product.getPrice()) {
				// set the buying price to the new price
				cartLine.setBuyingPrice(product.getPrice());
				// calculate and set the new total
				cartLine.setTotal(cartLine.getProductCount() * product.getPrice());
				changed = true;				
			}
			
			// check if that much quantity of product is available or not
			if(cartLine.getProductCount() > product.getStock()) {
				cartLine.setProductCount(product.getStock());										
				cartLine.setTotal(cartLine.getProductCount() * product.getPrice());
				changed = true;
				
			}
			
			// changes has happened
			if(changed) {				
				//update the cartLine
				cartLineDao.update(cartLine);
				// set the result as modified
				response = "result=modified";
			}
			
			grandTotal += cartLine.getTotal();
			lineCount++;
		}
		
		cart.setCartLines(lineCount++);
		cart.setGrandTotal(grandTotal);
		cartLineDao.updateCart(cart);

		return response;
	}	
}
