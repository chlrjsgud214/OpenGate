package com.og.opengate.service;

import java.util.List;

import com.og.opengate.model.Notice;

public interface NoticeService {

	int getTotal(Notice notice);

	List<Notice> noticeList(Notice notice);

	int maxNum();

	int insert(Notice notice);

	void updateReadCount(int num);

	Notice select(int num);

	int update(Notice notice);

	int delete(int num);

}
