package com.og.opengate.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Product;
import com.og.opengate.service.ProductService;

@Controller
public class MainController {
	@Autowired
	private ProductService ps;
	
	@RequestMapping("main")
	public String main(Model model) {
		List<Product> list=ps.mainlist();
		model.addAttribute("list", list);
		return "main";
	}
}
