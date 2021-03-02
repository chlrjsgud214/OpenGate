package com.og.opengate.dao;

import java.util.List;

import com.og.opengate.model.NoticeReplyBoard;

public interface NoticeReplyDao {

	List<NoticeReplyBoard> list(int bno);

	void delete(int rno);

	void update(NoticeReplyBoard nrb);

	void insert(NoticeReplyBoard nrb);

}
