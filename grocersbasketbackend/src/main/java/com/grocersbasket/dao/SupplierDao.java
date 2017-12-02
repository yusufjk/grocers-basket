package com.grocersbasket.dao;

import java.util.List;

import com.grocersbasket.domain.Supplier;


public interface SupplierDao {
 public void insertSupplier(Supplier s);
 public  List<Supplier> SupplierList();
 public Supplier GetsupplierById(int sid);
public void deleteSupplier(Supplier s);
public void updateSupplier(Supplier s);
}
