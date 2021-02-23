package com.og.opengate.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.og.opengate.dao.ReplyBoardDao;
import com.og.opengate.model.ReplyBoard;
@Service
public class ReplyBoardServiceImpl implements ReplyBoardService {
	@Autowired
	private ReplyBoardDao rbd;
	public List<ReplyBoard> list(int bno) {
		return rbd.list(bno);
	}
	public void insert(ReplyBoard rb) {
		rbd.insert(rb);
	}
	public void delete(int rno) {
		rbd.delete(rno);		
	}
	public void update(ReplyBoard rb) {
		rbd.update(rb);
	}
}