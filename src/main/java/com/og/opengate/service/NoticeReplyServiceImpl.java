package com.og.opengate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.opengate.dao.NoticeReplyDao;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService {
	@Autowired
	private NoticeReplyDao nrd;
}
