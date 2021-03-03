package com.og.opengate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.opengate.dao.NoticeReplyDao;
import com.og.opengate.model.NoticeReplyBoard;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService {
	@Autowired
	private NoticeReplyDao nrd;

	public List<NoticeReplyBoard> list(int bno) {
		return nrd.list(bno);
	}

	public void delete(int rno) {
		nrd.delete(rno);
	}

	public void update(NoticeReplyBoard nrb) {
		nrd.update(nrb);
	}

	public void insert(NoticeReplyBoard nrb) {
		nrd.insert(nrb);
	}
}
