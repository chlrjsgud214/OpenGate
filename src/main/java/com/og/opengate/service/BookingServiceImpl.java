package com.og.opengate.service;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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
	public int insert(Booking booking) {
		//bookdate , time/ Date d = new SimpleDateFormat("yyyy-MM-dd HH.mm.ss.S").parse(s);
		try {
			Date bookDate = new SimpleDateFormat("yy/MM/dd").parse(booking.getBookDate());
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
			
			return bd.insert(map);
		} catch (ParseException e) {
			e.printStackTrace();
			return 5;
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

	
}
