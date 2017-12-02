
package com.grocersbasket.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.grocersbasket.dao.ProductDao;
import com.grocersbasket.domain.Product;

@Repository(value="productDao")
@Transactional
public class ProductDaoImpl implements ProductDao {

	
	@Autowired
	SessionFactory sessionFactory;
	
	public void InsertProduct(Product p) {
	System.out.println("inside insert");
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
	    ssn.save(p);
		t.commit();
		ssn.close();
		
		
	}

	@SuppressWarnings("unchecked")
	public List<Product> ProductList() {
		System.out.println("inside product list impl");
		Session ssn=sessionFactory.openSession();
		ssn.beginTransaction();
		List<Product> list=ssn.createQuery("from Product").getResultList();
		
		ssn.getTransaction().commit();
		System.out.println("end  of impl");
		return list;
	}

	public void DeleteProduct(int pid) {
		System.out.println("inside impl delte");
		Session ssn=sessionFactory.openSession();
		ssn.beginTransaction();
		Product p=(Product)ssn.load(Product.class, pid);
		ssn.delete(p);
	     ssn.getTransaction().commit();
		System.out.println("end of impl delete");
		ssn.close();
		
	}

	public Product GetProductById(int pid) {
		 Session ssn = sessionFactory.openSession(); 
	Transaction t=ssn.getTransaction();
		t.begin();
//		  Product p = ssn.get(Product.class,productID);
//		  ssn.getTransaction().commit();
		Product p= ssn.get(Product.class,pid);
		t.commit();
		ssn.close();
		return p;
		
	}

	public void UpdateProduct(Product product) {
		Session session= sessionFactory.openSession();
		session.beginTransaction();
		session.update(product);
		session.getTransaction().commit();
		session.close();
	   
	    
	}

	@SuppressWarnings("unchecked")
	public List<Product> Productbyid(int cid) {
		 Session ssn=sessionFactory.openSession();
		 ssn.beginTransaction();
		 List<Product> list=ssn.createQuery("from Product where cid="+cid).getResultList();
		return list;
	}
	

}
