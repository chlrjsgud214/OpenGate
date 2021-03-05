package com.og.opengate.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.og.opengate.model.Loc;

@Repository
public class LocDaoImpl implements LocDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<Loc> LocList(Loc loc) {
		return sst.selectList("locns.LocList", loc);
	}

	public Loc locselect(String locName) {
		return sst.selectOne("locns.locselect", locName);
	}

	public int locinsert(Loc loc) {
		return sst.insert("locns.locinsert", loc);
	}

	public int locUpdate(Loc loc) {
		return sst.update("locns.locUpdate", loc);
	}

	public int locDelete(String locName) {
		return sst.delete("locns.locDelete", locName);
	}
	
	@Override
	public List<Loc> lList(String locName) {
		return sst.selectList("locns.lList", locName);
	}
}
