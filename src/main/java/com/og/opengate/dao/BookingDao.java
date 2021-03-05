package com.og.opengate.dao;
import java.util.List;
import com.og.opengate.model.Booking;
public interface BookingDao {

	List<Booking> bookingList();

	Booking select(String name);

	int insert(Booking booking);

	List<Booking> list(String locName);
 
} 
