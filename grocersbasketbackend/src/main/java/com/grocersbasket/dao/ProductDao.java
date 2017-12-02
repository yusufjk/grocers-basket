package com.grocersbasket.dao;

import java.util.List;

import com.grocersbasket.domain.Product;



public interface ProductDao {
 public void InsertProduct(Product p);
 public List<Product> ProductList();
 public void DeleteProduct(int pid);
 public Product GetProductById(int pid);
 public void UpdateProduct(Product product);
 public List<Product> Productbyid(int pid);
}
