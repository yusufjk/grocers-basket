package com.grocersbasket.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.grocersbasket.dao.SupplierDao;

import com.grocersbasket.domain.Supplier;



@Repository
@Transactional
public class SupplierDaoImpl implements SupplierDao {

	@Autowired
	SessionFactory sessionFactory;

	public void insertSupplier(Supplier s) {
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		ssn.save(s);
		t.commit();
		ssn.close();

	}
	
	
public void updateSupplier(Supplier s) {
		
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		ssn.update(s);
		t.commit();
		ssn.close();
	}

	
public void deleteSupplier(Supplier s) {
		
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		ssn.delete(s);
		t.commit();
		ssn.close();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Supplier> SupplierList() {
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		List<Supplier> list = ssn.createQuery("from Supplier").getResultList();
		t.commit();
		ssn.close();
		return list;
	}

	public Supplier GetsupplierById(int sid) {
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		Supplier s = ssn.get(Supplier.class, sid);
		t.commit();
		ssn.close();
		return s;
	}

}
