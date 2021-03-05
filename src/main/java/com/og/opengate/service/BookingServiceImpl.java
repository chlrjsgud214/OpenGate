package com.og.opengate.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.og.opengate.dao.BookingDao;
import com.og.opengate.model.Booking;
@Service
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingDao bd;
	@Override
	public List<Booking> list(String locName) {
		return bd.list(locName);
	}
	@Override
	public List<Booking> bookingList() {
		return bd.bookingList();
	}
	@Override
	public Booking select(String name) {
		return bd.select(name);
	}
	@Override
	public int insert(Booking booking) {
		return bd.insert(booking);
	}

	
}
