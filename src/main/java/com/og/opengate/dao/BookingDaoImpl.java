package com.og.opengate.dao;
import java.sql.Date;
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
	public void insert(HashMap<String, Object> map) {
		System.out.println(map.toString());
		 sst.insert("bookingns.insert", map);
	}
	@Override
	public List<Booking> bookingList(String id) {
		return sst.selectList("bookingns.bookingList", id);
	}
	@Override
	public List<Booking> bookingallList() {
		return sst.selectList("bookingns.bookingallList");
	}
	@Override
	public int delete(String id) {
		return sst.delete("bookingns.delete", id);
	}
	@Override
	public int update(Booking booking) {
		return sst.update("bookingns.update", booking);
	}
	
}
