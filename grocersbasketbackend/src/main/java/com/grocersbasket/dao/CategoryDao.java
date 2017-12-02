package com.grocersbasket.dao;

import java.util.List;

import com.grocersbasket.domain.Category;


public interface CategoryDao {

	public void InsertCategory(Category c);
	public void updateCategory(Category c);
	public void deleteCategory(Category c);
	public List<Category> CategoryList();
	 public Category GetCategoryById(int cid);
}
