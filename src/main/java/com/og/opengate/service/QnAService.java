package com.og.opengate.service;

import java.util.List;

import com.og.opengate.model.QnA;

public interface QnAService {

	int getTotal(QnA qna);

	List<QnA> list(QnA qna);

	QnA select(int num);

	int maxNum();

	void updateStep(QnA qna);

	int insert(QnA qna);

	void updateReadCount(int num);

	int delete(int num);

	int update(QnA qna);

}
