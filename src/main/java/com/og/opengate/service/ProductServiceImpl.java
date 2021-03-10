package com.og.opengate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.opengate.dao.ProductDao;
import com.og.opengate.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao pd;

	public int Productinsert(Product product) {
		return pd.Productinsert(product);
	}

	public Product Productselect(String tema) {
		return pd.Productselect(tema);
	}

	public int getTotal() {
		return pd.getTotal();
	}

	public List<Product> productlist(Product product) {
		return pd.productlist(product);
	}

	public int productdelete(String tema) {
		return pd.productdelete(tema);
	}
	
	public int productUpdate(Product product) {
		return pd.productUpdate(product);
	}
	
	@Override
	public List<Product> ptlist() {
		return pd.ptList();
	}
	
	public List<Product> mainlist() {
		return pd.mainlist();
	}
}
