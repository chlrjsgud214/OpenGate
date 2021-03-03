package com.og.opengate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.opengate.dao.QnADao;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADao qd;
}
