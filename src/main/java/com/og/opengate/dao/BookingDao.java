package com.og.opengate.dao;
import java.util.HashMap;
import java.util.List;
import com.og.opengate.model.Booking;
public interface BookingDao {

	List<Booking> bookList();


	int insert(HashMap<String, Object> map);


	Booking select(String id);



	List<Booking> bookingList(String id);



//	List<Booking> list(String locName);

}
