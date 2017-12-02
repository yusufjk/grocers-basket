package com.grocersbasket.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.grocersbasket.dao.UserDao;
import com.grocersbasket.domain.Address;
import com.grocersbasket.domain.User;


@Repository(value = "userDao")
@Transactional
public class UserDaoImpl implements UserDao {

	
	@Autowired
	SessionFactory sessionFactory;

	public void InsertUser(User u) {
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		ssn.save(u);
		t.commit();
		ssn.close();
	}

	public void updateUser(User u) {
		
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		ssn.update(u);
		t.commit();
		ssn.close();
	}
	
public void deleteUser(User u) {
		
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		
		ssn.delete(u);
		t.commit();
		ssn.close();
	}
	
	public User getUserByName(String firstName) {
		String selectQuery = "FROM User WHERE firstName = :firstName";		
		try {
			
			return sessionFactory.getCurrentSession()
						.createQuery(selectQuery,User.class)
							.setParameter("firstName", firstName)
								.getSingleResult();
			
		}
		catch(Exception ex) {
			//ex.printStackTrace();
			return null;
		}
	}

	public User getUserByEmail(String uemail) {
		String selectQuery = "FROM User WHERE uemail = :uemail";		
		try {
			
			return sessionFactory.getCurrentSession()
						.createQuery(selectQuery,User.class)
							.setParameter("uemail", uemail)
								.getSingleResult();
			
		}
		catch(Exception ex) {
			//ex.printStackTrace();
			return null;
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public List<User> UserList() {
		System.out.println("inside user list impl");
		Session ssn=sessionFactory.openSession();
		ssn.beginTransaction();
		List<User> list=ssn.createQuery("from User").getResultList();
		ssn.getTransaction().commit();
		System.out.println("end  of impl");
		return list;
	}

	public boolean addAddress(Address address) {
try {
			
			sessionFactory.getCurrentSession().persist(address);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;	
		}
	}

	public Address getBillingAddress(String uemail) {
String selectQuery = "FROM Address WHERE uemail = :uemail AND billing = :billing";
		
		try {
			return sessionFactory.getCurrentSession()
						.createQuery(selectQuery, Address.class)
							.setParameter("uemail", uemail)
							.setParameter("billing", true)
							.getSingleResult();
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public List<Address> listShippingAddresses(String uemail) {
String selectQuery = "FROM Address WHERE uemail = :uemail AND shipping = :shipping";
		
		try {
			
			return sessionFactory.getCurrentSession()
						.createQuery(selectQuery, Address.class)
							.setParameter("uemail", uemail)
							.setParameter("shipping", true)
							.getResultList();
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public Address getAddress(int addressId) {
		try {			
			return sessionFactory.getCurrentSession().get(Address.class, addressId);			
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

	@Override
	public boolean updateAddress(Address address) {
		try {			
			sessionFactory.getCurrentSession().update(address);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

}
