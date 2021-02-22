package com.og.opengate.service;

import java.util.List;

import com.og.opengate.model.Notice;

public interface NoticeService {

	int getTotal(Notice notice);

	List<Notice> noticeList(Notice notice);

}
