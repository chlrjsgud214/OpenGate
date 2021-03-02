package com.og.opengate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.opengate.dao.QnADao;
import com.og.opengate.model.QnA;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADao qd;

	public int getTotal(QnA qna) {
		return qd.getTotal(qna);
	}

	public List<QnA> list(QnA qna) {
		return qd.list(qna);
	}

	public QnA select(int num) {
		return qd.select(num);
	}

	public int maxNum() {
		return qd.maxNum();
	}

	public void updateStep(QnA qna) {
		qd.updateStep(qna);
	}

	public int insert(QnA qna) {
		return qd.insert(qna);
	}
}
