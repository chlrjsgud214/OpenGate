package com.og.opengate.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.og.opengate.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(Notice notice) {
		return sst.selectOne("noticens.getTotal", notice);
	}

	public List<Notice> noticeList(Notice notice) {
		return sst.selectList("noticens.noticeList", notice);
	}

	public int maxNum() {
		return sst.selectOne("noticens.maxNum");
	}

	public int insert(Notice notice) {
		return sst.insert("noticens.insert", notice);
	}

	public void updateReadCount(int num) {
		sst.update("noticens.updateReadCount", num);
	}

	@Override
	public Notice select(int num) {
		return sst.selectOne("noticens.select", num);
	}
}
