package com.og.opengate.dao;
import java.util.List;
import com.og.opengate.model.ReplyBoard;
public interface ReplyBoardDao {
	List<ReplyBoard> list(int bno);
	void insert(ReplyBoard rb);
	void delete(int rno);
	void update(ReplyBoard rb);

}