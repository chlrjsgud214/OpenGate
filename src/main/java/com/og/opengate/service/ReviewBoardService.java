package com.og.opengate.service;
import java.util.List;

import com.og.opengate.model.ReviewBoard;
public interface ReviewBoardService {
//	int getTotal();
	int getTotal(ReviewBoard board);
//	List<Board> list(int startRow, int endRow);
	List<ReviewBoard> list(ReviewBoard board);
	void updateReadCount(int num);
	ReviewBoard select(int num);
	int maxNum();
	int insert(ReviewBoard board);
	int update(ReviewBoard board);
	int delete(int num);
	void updateStep(ReviewBoard board);
	

}