package com.og.opengate.dao;

import java.util.List;

import com.og.opengate.model.Notice;

public interface NoticeDao {

	int getTotal(Notice notice);

	List<Notice> noticeList(Notice notice);

}
