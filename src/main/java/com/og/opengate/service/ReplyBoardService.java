package com.og.opengate.service;
import java.util.List;
import com.og.opengate.model.ReplyBoard;
public interface ReplyBoardService {
	List<ReplyBoard> list(int bno);
	void insert(ReplyBoard rb);
	void delete(int rno);
	void update(ReplyBoard rb);

}