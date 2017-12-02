package com.grocersbasket.dao;

import java.util.List;

import com.grocersbasket.domain.Address;
import com.grocersbasket.domain.User;

public interface UserDao {
	public void InsertUser(User u);
	public void updateUser(User u);
	public void deleteUser(User u);
    public User getUserByName(String firstName);
    public User getUserByEmail(String uemail);
    public List<User> UserList();
 // add an address
    public Address getAddress(int addressId);
 	public boolean addAddress(Address address);
 	public boolean updateAddress(Address address);
 	// alternative
 	 public Address getBillingAddress(String uemail);
 	 
 	 List<Address> listShippingAddresses(String uemail);

}
