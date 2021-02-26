package com.og.opengate.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.og.opengate.model.ReviewBoard;
@Repository
public class ReviewBoardDaoImpl implements ReviewBoardDao {
	@Autowired
	private SqlSessionTemplate sst;
//	public int getTotal() { // 현재 게시글이 몇건
//		return sst.selectOne("reviewboardns.getTotal");
//	}
	public int getTotal(ReviewBoard board) { // 현재 게시글이 몇건
		return sst.selectOne("reviewboardns.getTotal",board);
	}
//	public List<Board> list(int startRow, int endRow) {
//		// 데이터 전송은 하나만 가능
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		return sst.selectList("boardns.list", map);
//	}
	public List<ReviewBoard> list(ReviewBoard board) {
		return sst.selectList("reviewboardns.list", board);
	}
	public void updateReadCount(int num) {
		sst.update("reviewboardns.updateReadCount", num);
	}
	public ReviewBoard select(int num) {
		return sst.selectOne("reviewboardns.select", num);
	}
	public int maxNum() {
		return sst.selectOne("reviewboardns.maxNum");
	}
	public int insert(ReviewBoard board) {
		return sst.insert("reviewboardns.insert", board);
	}
	public int update(ReviewBoard board) {
		return sst.update("reviewboardns.update", board);
	}
	public int delete(int num) {
		return sst.update("reviewboardns.delete", num);
	}
	public void updateStep(ReviewBoard board) {
		sst.update("reviewboardns.updateStep", board);
	}
}