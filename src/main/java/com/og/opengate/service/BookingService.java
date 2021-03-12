package com.og.opengate.service;
import java.util.List;
import com.og.opengate.model.Booking;
public interface BookingService {

	List<Booking> bookList();


	int insert(Booking booking);


	Booking select(String id);


	List<Booking> bookingList(String id);

	List<Booking> bookingallList();


	int delete(String id);


//	List<Booking> list(String locName);

}
