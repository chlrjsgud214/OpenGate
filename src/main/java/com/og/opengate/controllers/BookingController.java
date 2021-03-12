package com.og.opengate.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String bookinginsert(Booking booking, Model model,HttpSession session) {
		int result = 0;
		Booking boo = bs.select(booking.getNote());
		if(boo == null) result = bs.insert(booking);
		model.addAttribute("booking", booking);
		model.addAttribute("result", result);
		return "/booking/bookinginsert";
	}
	
	@RequestMapping("bookingList")
	public String bookingList(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = ms.select(id);
		List<Booking> bookingList = bs.bookingList(id);
		model.addAttribute("member", member);
		model.addAttribute("bookingList", bookingList);
		return "/booking/bookingList";
	}
	@RequestMapping("bookingallList")
	public String bookingallList(Model model) {
		List<Booking> list = bs.bookingallList();
		model.addAttribute("list", list);
		return "/booking/bookingallList";
	}
	@RequestMapping("bookingDel")
	public String bookingDel(String id,Model model) {
		int result = bs.delete(id);
		model.addAttribute("result", result);
		return "/booking/bookingDel";
	}
	
}
