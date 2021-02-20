package com.og.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nd;
}
