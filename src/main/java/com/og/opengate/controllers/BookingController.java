package com.og.opengate.controllers;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Booking;
import com.og.opengate.model.Loc;
import com.og.opengate.model.Member;
import com.og.opengate.model.Product;
import com.og.opengate.service.BookingService;
import com.og.opengate.service.LocService;
import com.og.opengate.service.MemberService;
import com.og.opengate.service.ProductService;

@Controller
public class BookingController {
	@Autowired
	private LocService ls;
	@Autowired
	private ProductService ps;
	@Autowired
	private BookingService bs;
	@Autowired
	private MemberService ms;
	

	@RequestMapping("bookingForm")
	public String bookingForm() {
		return "/booking/bookingForm";
	}
	@RequestMapping("bookinginsertForm")
	public String bookinginsertForm(String locName ,String tema, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = ms.select(id);
		List<Booking> bookList = bs.bookList();
		List<Loc> lc = ls.lList(locName);
		List<Product> pt = ps.ptlist(tema);
		model.addAttribute("lc", lc);
		model.addAttribute("pt", pt);
		model.addAttribute("bookList", bookList);
		model.addAttribute("member", member);
		return "/booking/bookinginsertForm";
	}
	@RequestMapping("bookinginsert")
	public String bookinginsert(Booking booking, Model model) {
		Booking boo = bs.select(booking.getNote());
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(boo == null) {
			System.out.println("@@@@@");
			map = bs.insert(booking);
		}
		model.addAttribute("booking", map);
		model.addAttribute("boo", boo);
		return "/booking/bookinginsert";
	}
	
	@RequestMapping("bookingList")
	public String bookingList(Booking booking, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = ms.select(id);
		List<Booking> bookingList = bs.bookingList(id);
		model.addAttribute("member", member);
		model.addAttribute("booking", booking);
		model.addAttribute("bookingList", bookingList);
		System.out.println(bookingList.get(0).getTime());
		return "/booking/bookingList";
	}
	@RequestMapping("bookingallList")
	public String bookingallList(Model model) {
		List<Booking> bookingallList = bs.bookingallList();
		model.addAttribute("bookingallList", bookingallList);
		return "/booking/bookingallList";
	}
//	@RequestMapping("bookingDel")
//	public String bookingDel(String id,Model model) {
//		int result = bs.delete(id);
//		model.addAttribute("result", result);
//		return "/booking/bookingDel";
//	}
	
}
