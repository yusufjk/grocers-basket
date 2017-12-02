package com.grocersbasket.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.grocersbasket.dao.CartLineDao;
import com.grocersbasket.domain.Cart;
import com.grocersbasket.domain.CartLine;
import com.grocersbasket.domain.OrderDetail;

@Repository("cartLineDao")
@Transactional
public class CartLineDaoImpl implements CartLineDao {
	


	@Autowired
	private SessionFactory sessionFactory;

	
	public CartLine get(int id) {		
		return sessionFactory.getCurrentSession().get(CartLine.class, id);
	}
	

	public boolean add(CartLine cartLine) {
		try {
			sessionFactory.getCurrentSession().persist(cartLine);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	
	public boolean update(CartLine cartLine) {
		try {
			sessionFactory.getCurrentSession().update(cartLine);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	
	public boolean delete(CartLine cartLine) {	
		try {			
			sessionFactory.getCurrentSession().delete(cartLine);
			return true;
		}catch(Exception ex) {
			return false;
		}		
	}


	public List<CartLine> list(int cartId) {
		String query = "FROM CartLine WHERE cartId = :cartId";
		return sessionFactory.getCurrentSession()
								.createQuery(query, CartLine.class)
									.setParameter("cartId", cartId)
										.getResultList();		
	}

	
	public List<CartLine> listAvailable(int cartId) {
		String query = "FROM CartLine WHERE cartId = :cartId AND available = :available";
		return sessionFactory.getCurrentSession()
								.createQuery(query, CartLine.class)
									.setParameter("cartId", cartId)
									.setParameter("available", true)
										.getResultList();	
	}

	
	public CartLine getByCartAndProduct(int cartId, int pid) {
		String query = "FROM CartLine WHERE cartId = :cartId AND  product.pid = :pid";
		try {
		return sessionFactory.getCurrentSession()
								.createQuery(query, CartLine.class)
									.setParameter("cartId", cartId)
									.setParameter("pid", pid)
										.getSingleResult();		
			}
		catch(Exception ex) {
			return null;
		}
	}

	// related to the cart
	
	public boolean updateCart(Cart cart) {
		try {
			
			sessionFactory.getCurrentSession().update(cart);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;	
		}
	}


	
	public boolean addOrderDetail(OrderDetail orderDetail) 
	{
	try {			
		sessionFactory.getCurrentSession().persist(orderDetail);			
		return true;
	}
	catch(Exception ex) {
		return false;
	}
}
		


}
