package com.og.opengate.service;

import java.util.List;

import com.og.opengate.model.Product;

public interface ProductService {

	int Productinsert(Product product);

	Product Productselect(String tema);

	int getTotal();

	List<Product> productlist(Product product);

	int productdelete(String tema);

	int productUpdate(Product product);
	
	List<Product> ptlist(String tema);
<<<<<<< HEAD
//List<Product> ptlist();

=======
	List<Product> ptlist();

	List<Product> mainlist();
>>>>>>> branch 'master' of https://github.com/chlrjsgud214/OpenGate.git
}
