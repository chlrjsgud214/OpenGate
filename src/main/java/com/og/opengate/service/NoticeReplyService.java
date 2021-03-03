package com.og.opengate.service;

import java.util.List;

import com.og.opengate.model.NoticeReplyBoard;

public interface NoticeReplyService {

	List<NoticeReplyBoard> list(int bno);

	void delete(int rno);

	void update(NoticeReplyBoard nrb);

	void insert(NoticeReplyBoard nrb);

}
