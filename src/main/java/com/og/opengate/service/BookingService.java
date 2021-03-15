package com.og.opengate.service;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import com.og.opengate.model.Booking;
public interface BookingService {

	List<Booking> bookList();


	HashMap<String, Object> insert(Booking booking);


	Booking select(String id);


	List<Booking> bookingList(String id);


	List<Booking> bookingallList();


//
//
	int delete(String id);


	int update(Booking booking);








//	List<Booking> list(String locName);

}
