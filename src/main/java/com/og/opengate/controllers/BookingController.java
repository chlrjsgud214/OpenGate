package com.og.opengate.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Booking;
import com.og.opengate.model.Loc;
import com.og.opengate.model.Product;
import com.og.opengate.service.BookingService;
import com.og.opengate.service.LocService;
import com.og.opengate.service.ProductService;

@Controller
public class BookingController {
	@Autowired
	private LocService ls;
	@Autowired
	private ProductService ps;
	@Autowired
	private BookingService bs;
	
//	@RequestMapping("bookingList")
//	public String bookingList(String locName, Model model) {
//		Loc loc = ls.locselect(locName);
//		List<Booking> bookingList = bs.list(locName);
//		model.addAttribute("loc", loc);
//		model.addAttribute("bookingList", bookingList);
//		return "/booking/bookingList";
//	}
	@RequestMapping("bookinginsertForm")
	public String bookinginsertForm(String locName ,String tema, Model model) {
		List<Booking> bookingList = bs.bookingList();
		List<Loc> lc = ls.lList(locName);
		List<Product> pt = ps.ptlist();
		model.addAttribute("lc", lc);
		model.addAttribute("pt", pt);
		model.addAttribute("bookingList", bookingList);
		return "/booking/bookinginserForm";
	}
	@RequestMapping("bookinginsert")
	public String bookinginsert(Booking booking, Model model) {
		int result = 0;
		Booking boo = bs.select(booking.getName());
		if(boo == null) result = bs.insert(booking);
		else result = -1;
		model.addAttribute("result", result);
		return "/booking/bookinginsert";
	}
}
