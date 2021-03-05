package com.og.opengate.service;
import java.util.List;
import com.og.opengate.model.Booking;
public interface BookingService {

	List<Booking> bookingList();

	Booking select(String name);

	int insert(Booking booking);


	List<Booking> list(String locName);
    
}
