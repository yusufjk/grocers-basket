package com.grocersbasket.dao;

import java.util.List;

import com.grocersbasket.domain.Cart;
import com.grocersbasket.domain.CartLine;
import com.grocersbasket.domain.OrderDetail;

public interface CartLineDao {
		// the common methods from previously coded one
		public CartLine get(int id);	
		public boolean add(CartLine cartLine);
		public boolean update(CartLine cartLine);
		public boolean delete(CartLine cartLine);
		public List<CartLine> list(int cartId);
		
		// other business method related to the cart lines
		public List<CartLine> listAvailable(int cartId);
		public CartLine getByCartAndProduct(int cartId, int pid);
		
		
		// update a cart
		boolean updateCart(Cart cart);	

		// adding order details
		boolean addOrderDetail(OrderDetail orderDetail);
	


}
