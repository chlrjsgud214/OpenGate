package com.og.opengate.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.og.opengate.dao.ReviewBoardDao;
import com.og.opengate.model.ReviewBoard;
@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {
	@Autowired
	private ReviewBoardDao bd;
	public int getTotal(ReviewBoard board) {
		return bd.getTotal(board);
	}
//	public List<Board> list(int startRow, int endRow) {
//		return bd.list(startRow, endRow);
//	}
	public List<ReviewBoard> list(ReviewBoard board) {
		return bd.list(board);
	}
	public void updateReadCount(int num) {
		bd.updateReadCount(num);
	}
	public ReviewBoard select(int num) {
		return bd.select(num);
	}
	public int maxNum() {
		return bd.maxNum();
	}
	public int insert(ReviewBoard board) {
		return bd.insert(board);
	}
	public int update(ReviewBoard board) {
		return bd.update(board);
	}
	public int delete(int num) {
		return bd.delete(num);
	}
	public void updateStep(ReviewBoard board) {
		bd.updateStep(board);
	}
}