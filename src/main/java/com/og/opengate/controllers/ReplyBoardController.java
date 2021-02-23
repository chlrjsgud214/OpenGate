package com.og.opengate.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Board;
import com.og.opengate.model.ReplyBoard;
import com.og.opengate.service.BoardService;
import com.og.opengate.service.ReplyBoardService;
@Controller
public class ReplyBoardController {
	@Autowired
	private ReplyBoardService rbs;
	@Autowired
	private BoardService bs;
	@RequestMapping("/replyList/bno/{bno}")
	public String replyList(@PathVariable int bno, Model model) {
		Board board = bs.select(bno);
		List<ReplyBoard> rbdList= rbs.list(bno);
		model.addAttribute("board", board);
		model.addAttribute("rbdList", rbdList);
		return "replyList";		
	}
	@RequestMapping("rUpdate")
	public String rUpdate(ReplyBoard rb) {
		rbs.update(rb);
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	@RequestMapping("rDelete")
	public String rDelete(ReplyBoard rb) {
		rbs.delete(rb.getRno()); 
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	@RequestMapping("/rInsert")
	public String rInsert(ReplyBoard rb) {
		rbs.insert(rb); 
		// redirect 또는 forward만면 JSP가 아닌 COntroller 내부 다른 메서드실행
		return "redirect:/replyList/bno/"+rb.getBno();
	}
}