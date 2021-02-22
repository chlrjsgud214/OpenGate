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
}
