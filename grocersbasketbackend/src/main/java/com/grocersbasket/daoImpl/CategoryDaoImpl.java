package com.grocersbasket.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.grocersbasket.dao.CategoryDao;
import com.grocersbasket.domain.Category;

@Repository
@Transactional
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	SessionFactory sessionFactory;

	public void InsertCategory(Category c) {
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		ssn.save(c);
		t.commit();
		ssn.close();

	}
	
	
	
	public void updateCategory(Category c) {
		
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		ssn.update(c);
		t.commit();
		ssn.close();
	}
	
	
	
	
public void deleteCategory(Category c) {
		
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		ssn.delete(c);
		t.commit();
		ssn.close();
	}
	
	

	@SuppressWarnings("unchecked")
	public List<Category> CategoryList() {
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		
		List<Category> list = ssn.createQuery("from Category").getResultList();
		t.commit();
		ssn.close();
		return list;
	}

	public Category GetCategoryById(int cid) {
		Session ssn=sessionFactory.openSession();
		Transaction t=ssn.getTransaction();
		t.begin();
		Category c = ssn.get(Category.class, cid);
		t.commit();
		ssn.close();
		return c;
	}

}
