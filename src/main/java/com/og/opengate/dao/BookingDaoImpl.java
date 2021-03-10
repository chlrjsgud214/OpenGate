package com.og.opengate.dao;
import java.util.HashMap;
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
	public List<Booking> bookList() {
		return sst.selectList("bookingns.bookList");
	}
	@Override
	public Booking select(String id) {
		return sst.selectOne("bookingns.select", id);
	}
	@Override
	public int insert(HashMap<String, Object> map) {
		return sst.insert("bookingns.insert", map);
	}
	@Override
	public List<Booking> bookingList(String id) {
		return sst.selectList("bookingns.bookingList", id);
	}
	 
}
