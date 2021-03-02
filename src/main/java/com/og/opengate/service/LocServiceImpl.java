package com.og.opengate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.opengate.dao.LocDao;
import com.og.opengate.model.Loc;

@Service
public class LocServiceImpl implements LocService{
	@Autowired
	private LocDao ld;

	public List<Loc> LocList(Loc loc) {
		return ld.LocList(loc);
	}
	
	public Loc locselect(String locName) {
		return ld.locselect(locName);
	}

	public int locinsert(Loc loc) {
		return ld.locinsert(loc);
	}

	public int locUpdate(Loc loc) {
		return ld.locUpdate(loc);
	}

	public int locDelete(String locName) {
		return ld.locDelete(locName);
	}
}
