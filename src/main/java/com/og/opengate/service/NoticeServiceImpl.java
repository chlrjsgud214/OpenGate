package com.og.opengate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.opengate.dao.NoticeDao;
import com.og.opengate.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nd;

	@Override
	public int getTotal(Notice notice) {
		return nd.getTotal(notice);
	}

	public List<Notice> noticeList(Notice notice) {
		return nd.noticeList(notice);
	}

	public int maxNum() {
		return nd.maxNum();
	}

	public int insert(Notice notice) {
		return nd.insert(notice);
	}

	public void updateReadCount(int num) {
		nd.updateReadCount(num);
	}

	@Override
	public Notice select(int num) {
		return nd.select(num);
	}

	public int update(Notice notice) {
		return nd.update(notice);
	}

	@Override
	public int delete(int num) {
		return nd.delete(num);
	}
}
