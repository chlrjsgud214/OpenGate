package com.og.opengate.controllers;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.ReviewBoard;
import com.og.opengate.service.ReviewBoardService;
import com.og.opengate.service.ReviewPagingBean;
@Controller
public class ReviewBoardController {
	@Autowired
	private ReviewBoardService bs;
	@RequestMapping("list")
	public String list(String pageNum,ReviewBoard board, Model model) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; //  한 화면에 게시글 10개
//		int total = bs.getTotal();
		int total = bs.getTotal(board);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
//		List<ReviewBoard> list = bs.list(startRow, endRow);
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		List<ReviewBoard> list = bs.list(board);
		int no = total - startRow + 1; // 1p:150-1 + 1 2p:150-11+1 
		ReviewPagingBean pb=new ReviewPagingBean(currentPage, rowPerPage,total);
		String[] tit = {"작성자","제목","내용","제목+내용"};
		model.addAttribute("tit", tit);
		model.addAttribute("pb", pb);
		model.addAttribute("no", no);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return "list";
	}
	@RequestMapping("insertForm")
	public String insertForm(int num,String pageNum,Model model) {
		int ref = 0, re_level = 0, re_step = 0;
		if (num != 0) { // 답변글
			ReviewBoard board = bs.select(num);
			ref = board.getRef();
			re_level = board.getRe_level();
			re_step  = board.getRe_step();
		}
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		return "insertForm";
	}
	// HttpServletRequest 입력한 ip추적
	@RequestMapping("insert")
	public String insert(ReviewBoard board, String pageNum, Model model,
			HttpServletRequest request) {
		board.setIp(request.getRemoteAddr());
		// 답변글인 경우 때문에 sequence사용 안함
		int number = bs.maxNum();
		if (board.getNum() != 0) { // 답변글
			//  글을 읽고  ref가 같고  읽은글보다  re_step가  큰값이 있으면 
			// 그글의 re_step +1
			bs.updateStep(board);
			board.setRe_level(board.getRe_level()+1);
			board.setRe_step(board.getRe_step()  +1);
		} else board.setRef(number);  // 답변글이 아닐 때
		board.setNum(number);
		int result = bs.insert(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "insert";
	}
	@RequestMapping("updateForm")
	public String updateForm(int num, String pageNum, Model model) {
		ReviewBoard board = bs.select(num);
		model.addAttribute("board",board);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}
	@RequestMapping("update")
	public String update(ReviewBoard board, String pageNum, Model model) {
		int result = bs.update(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "update";
	}
	@RequestMapping("deleteForm")
	public String deleteForm(int num, String pageNum, Model model) {
		ReviewBoard board = bs.select(num);
		model.addAttribute("board",board);
		model.addAttribute("pageNum", pageNum);
		return "deleteForm";
	}
	@RequestMapping("delete")
	public String delete(int num, String pageNum, Model model) {
		int result = bs.delete(num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "delete";
	}
	@RequestMapping("view")
	public String view(int num, String pageNum, Model model) {
		bs.updateReadCount(num);  // 조회수 1증가 
		ReviewBoard board = bs.select(num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		return "view";
	}
}