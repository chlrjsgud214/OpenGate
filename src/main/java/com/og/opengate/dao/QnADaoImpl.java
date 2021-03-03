package com.og.opengate.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.og.opengate.model.QnA;

@Repository
public class QnADaoImpl implements QnADao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(QnA qna) {
		return sst.selectOne("qnans.getTotal", qna);
	}

	public List<QnA> list(QnA qna) {
		return sst.selectList("qnans.list", qna);
	}

	public QnA select(int num) {
		return sst.selectOne("qnans.select", num);
	}

	public int maxNum() {
		return sst.selectOne("qnans.maxNum");
	}

	public void updateStep(QnA qna) {
		sst.update("qnans.updateStep", qna);
	}

	public int insert(QnA qna) {
		return sst.insert("qnans.insert", qna);
	}

	public void updateReadCount(int num) {
		sst.update("qnans.updateReadCount", num);
	}

	public int delete(int num) {
		return sst.update("qnans.delete", num);
	}

	public int update(QnA qna) {
		return sst.update("qnans.update", qna);
	}
}
