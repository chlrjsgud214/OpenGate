package com.og.opengate.controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Product;
import com.og.opengate.service.PagingBean;
import com.og.opengate.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService ps;
	
	@RequestMapping("productInsertForm")
	public String productForm(String pageNum, HttpSession session, Model model) {
		model.addAttribute("pageNum", pageNum);
		return "product/productInsertForm";
	}
	
	@RequestMapping("productInsert")
	public String productInsert(Model model, Product product, HttpSession session,
			String pageNum) throws IOException {
		int result=0;
		Product pro=ps.Productselect(product.getTema());
		if (pro==null) {
			String fileName=product.getFileName1().getOriginalFilename();
			product.setFileName(fileName);
			String real=session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos=new FileOutputStream(
					new File(real+"/"+fileName));
			fos.write(product.getFileName1().getBytes());
			fos.close();
			result=ps.Productinsert(product);
		} else result=-1;
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "product/productInsert";
	}
	
	@RequestMapping("productList")
	public String productList(Model model, HttpSession session,
			Product product, String pageNum) {
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage=Integer.parseInt(pageNum);
		int rowPerPage=6;
		int total=ps.getTotal();
		int startRow=(currentPage-1)*rowPerPage+1;
		int endRow=startRow+rowPerPage-1;
		product.setStartRow(startRow);
		product.setEndRow(endRow);
		List<Product> list=ps.productlist(product);
		int no=total-startRow+1;
		PagingBean pb=new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("no", no);
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("pageNum", pageNum);
		return "/product/productList";
	}
	
	@RequestMapping("productDetail")
	public String productDetail(String tema, Model model, HttpSession session,
			String pageNum) {
		Product product=ps.Productselect(tema);
		model.addAttribute("product", product);
		model.addAttribute("pageNum", pageNum);
		return "/product/productDetail";
	}
	
	@RequestMapping("productDelete")
	public String productDelete(Model model, HttpSession session, String tema,
			String pageNum) {
		int result=ps.productdelete(tema);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/product/productDelete";
	}
	
	@RequestMapping("productUpdateForm")
	public String productUpdateForm(Model model, HttpSession session,
			String tema, String pageNum) {
		Product product=ps.Productselect(tema);
		model.addAttribute("product", product);
		model.addAttribute("pageNum", pageNum);
		return "/product/productUpdateForm";
	}
	@RequestMapping("productUpdate")
	public String productUpdate(Model model, HttpSession session,
			Product product, String pageNum) throws IOException {
		int result=0;
		String fileName=product.getFileName1().getOriginalFilename();
		if (fileName!=null && !fileName.equals("")) {
			product.setFileName(fileName);
			String real=session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos=new FileOutputStream(
					new File(real+"/"+fileName));
			fos.write(product.getFileName1().getBytes());
			fos.close();
		} else result=-1;
		result=ps.productUpdate(product);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/product/productUpdate";
	}
}
