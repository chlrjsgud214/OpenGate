package com.og.opengate.dao;

import java.util.List;

import com.og.opengate.model.Product;

public interface ProductDao {

	int Productinsert(Product product);

	Product Productselect(String tema);

	int getTotal();

	List<Product> productlist(Product product);

	int productdelete(String tema);

	int productUpdate(Product product);
	
//	List<Product> ptList();

	List<Product> ptList(String tema);
}
