package com.grocersbasket.domain;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table
public class Category implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int cid;
private String cname;

@OneToMany(fetch=FetchType.LAZY,mappedBy="category")
private Set<Product> product;

public Set<Product> getProduct() {
	return product;
}

public void setProduct(Set<Product> product) {
	this.product = product;
}

public String getCname() {
	return cname;
}

public void setCname(String cname) {
this.cname = cname;
}

public int getCid() {
	return cid;
}

public void setCid(int cid) {
	this.cid = cid;
}
}
