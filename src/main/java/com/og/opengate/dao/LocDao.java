package com.og.opengate.dao;

import java.util.List;

import com.og.opengate.model.Loc;

public interface LocDao {

	List<Loc> LocList(Loc loc);

	Loc locselect(String locName);

	int locinsert(Loc loc);

	int locUpdate(Loc loc);

	int locDelete(String locName);

}
