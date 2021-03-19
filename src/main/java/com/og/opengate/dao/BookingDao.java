package com.og.opengate.dao;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import com.og.opengate.model.Booking;
public interface BookingDao {

	List<Booking> bookList();


	void insert(HashMap<String, Object> map);


	Booking select(String id);



	List<Booking> bookingList(String id);

  
	List<Booking> bookingallList();


//
//
	int delete(String id);


	int update(Booking booking);









//	List<Booking> list(String locName);

}
