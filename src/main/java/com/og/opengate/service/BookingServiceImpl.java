package com.og.opengate.service;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.og.opengate.dao.BookingDao;
import com.og.opengate.model.Booking;
@Service
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingDao bd;
//	@Override
//	public List<Booking> list(String locName) {
//		return bd.list(locName);
//	}
	@Override
	public List<Booking> bookList() {
		return bd.bookList();
	}
	@Override
	public HashMap<String, Object> insert(Booking booking) {
//		bookdate , time/ Date d = new SimpleDateFormat("yyyy-MM-dd HH.mm.ss.S").parse(s);
		try {
			Date bookDate = new SimpleDateFormat("yyyy-MM-dd").parse(booking.getBookDate());
			Date time = new SimpleDateFormat("HH:mm").parse(booking.getTime());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookDate", bookDate);
			map.put("time", time);
			map.put("tema", booking.getTema());
			map.put("locName", booking.getLocName());
			map.put("name", booking.getName());
			map.put("note", booking.getNote());
			map.put("id", booking.getId());
			map.put("phone", booking.getPhone());
			bd.insert(map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return new HashMap<String, Object>();
		}
	}
	@Override
	public Booking select(String id) {
		return bd.select(id);
	}
	@Override
	public List<Booking> bookingList(String id) {
		return bd.bookingList(id);
	}
	@Override
	public List<Booking> bookingallList() {
		return bd.bookingallList();
	}

	@Override
	public int delete(String id) {
		return bd.delete(id);
	}
	@Override
	public int update(Booking booking) {
		return bd.update(booking);
	}
	
}
