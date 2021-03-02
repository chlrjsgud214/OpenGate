package com.og.opengate.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Loc;
import com.og.opengate.model.Product;
import com.og.opengate.service.LocService;
import com.og.opengate.service.ProductService;

@Controller
public class LocController {
	@Autowired
	private LocService ls;
	@Autowired
	private ProductService ps;
	
	@RequestMapping("LocList")
	public String branch(HttpSession session, Model model, Loc loc) {
		String id=(String) session.getAttribute("id");
		List<Loc> list=ls.LocList(loc);
		model.addAttribute("list", list);
		return "/loc/Loclist";
	}
	
	@RequestMapping("locInsertForm")
	public String locInsertForm(HttpSession session, Model model) {
		String id=(String) session.getAttribute("id");
		return "/loc/locInsertForm";
	}
	
	@RequestMapping("locInsert")
	public String locInsert(Model model, HttpSession session, Loc loc) {
		String id=(String) session.getAttribute("id");
		int result=0;
		Loc l=ls.locselect(loc.getLocName());
		if (l==null) {
			result=ls.locinsert(loc);
		} else result=-1;
		model.addAttribute("loc", loc);
		model.addAttribute("result", result);
		return "/loc/locInsert";
	}
	
	@RequestMapping("locDetail")
	public String locDetail(String locName, Model model, HttpSession session,Loc loc) {
		String id=(String) session.getAttribute("id");
		Loc l=ls.locselect(locName);
		List<Loc> list=ls.LocList(loc);
		model.addAttribute("list", list);
		model.addAttribute("l", l);
		return "/loc/locDetail";
	}
	
	@RequestMapping("locUpdateForm")
	public String locUpdateForm(String locName, Model model, HttpSession session) {
		String id=(String) session.getAttribute("id");
		Loc loc=ls.locselect(locName);
		model.addAttribute("loc", loc);
		return "/loc/locUpdateForm";
	}
	
	@RequestMapping("locUpdate")
	public String locUpdate(Loc loc, Model model, HttpSession session) {
		String id=(String) session.getAttribute("id");
		int result=0;
		result=ls.locUpdate(loc);
		model.addAttribute("loc", loc);
		model.addAttribute("result", result);
		return "/loc/locUpdate";
	}
	
	@RequestMapping("locDelete")
	public String locDelete(String locName, HttpSession session, Model model) {
		String id=(String) session.getAttribute("id");
		int result=ls.locDelete(locName);
		model.addAttribute("result", result);
		return "/loc/locDelete";
	}
}
