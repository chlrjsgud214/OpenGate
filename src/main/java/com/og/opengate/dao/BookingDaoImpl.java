package com.og.opengate.dao;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.og.opengate.model.Booking;
@Repository
public class BookingDaoImpl implements BookingDao {
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public List<Booking> list(String locName) {
		return sst.selectList("bookinns",locName);
	}

	@Override
	public List<Booking> bookingList() {
		return sst.selectList("bookingns.bookingList");
	}
	@Override
	public Booking select(String name) {
		return sst.selectOne("bookingns.select", name);
	}
	@Override
	public int insert(Booking booking) {
		return sst.insert("bookingns.insert", booking);
	}
	
}
