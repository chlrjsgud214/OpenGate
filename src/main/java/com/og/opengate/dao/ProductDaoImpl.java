package com.og.opengate.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.og.opengate.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int Productinsert(Product product) {
		return sst.insert("productns.Productinsert", product);
	}

	public Product Productselect(String tema) {
		return sst.selectOne("productns.Productselect", tema);
	}

	public int getTotal() {
		return sst.selectOne("productns.getTotal");
	}

	public List<Product> productlist(Product product) {
		return sst.selectList("productns.productlist", product);
	}

	public int productdelete(String tema) {
		return sst.delete("productns.productdelete", tema);
	}

	public int productUpdate(Product product) {
		return sst.update("productns.productUpdate", product);
	}
}
