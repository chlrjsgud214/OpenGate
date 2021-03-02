package com.og.opengate.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.og.opengate.model.NoticeReplyBoard;

@Repository
public class NoticeReplyDaoImpl implements NoticeReplyDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<NoticeReplyBoard> list(int bno) {
		return sst.selectList("noticerbdns.list", bno);
	}

	public void delete(int rno) {
		sst.update("noticerbdns.delete", rno);
	}

	public void update(NoticeReplyBoard nrb) {
		sst.update("noticerbdns.update", nrb);
	}

	public void insert(NoticeReplyBoard nrb) {
		sst.insert("noticerbdns.insert", nrb);
	}
}
