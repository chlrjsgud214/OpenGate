package com.og.opengate.service;

import java.util.List;

import com.og.opengate.model.Loc;

public interface LocService {

	List<Loc> LocList(Loc loc);

	Loc locselect(String locName);

	int locinsert(Loc loc);

	int locUpdate(Loc loc);

	int locDelete(String locName);
	
	List<Loc> lList(String locName);
}
