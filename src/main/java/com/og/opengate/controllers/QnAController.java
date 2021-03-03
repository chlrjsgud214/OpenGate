package com.og.opengate.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Member;
import com.og.opengate.model.QnA;
import com.og.opengate.service.MemberService;
import com.og.opengate.service.PagingBean;
import com.og.opengate.service.QnAService;

@Controller
public class QnAController {
	@Autowired
	private QnAService qs;
	@Autowired
	private MemberService ms;
	@RequestMapping("qnaList")
	public String qnalist(String pageNum, QnA qna, Model model) {
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total = qs.getTotal(qna);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);
		List<QnA> qnaList = qs.list(qna);
		int no = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String [] tit = {"작성자", "제목", "내용", "제목+내용"};
		model.addAttribute("tit", tit);
		model.addAttribute("pb", pb);
		model.addAttribute("no", no);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("total", total);
		return "/qna/qnaList";
	}
	@RequestMapping("qnaInsertForm")
	public String qnaInsertForm(int num, String pageNum, Model model, HttpSession session) {
		int ref = 0, re_level = 0, re_step = 0;
		String id = (String)session.getAttribute("id");
		if(id != null) {
			Member member = ms.select(id);
			model.addAttribute("member", member);
		}
		if(num != 0) { // 답변글
			QnA qna = qs.select(num);
			ref = qna.getRef();
			re_level = qna.getRe_level();
			re_step = qna.getRe_step();
		}
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		return "/qna/qnaInsertForm";
	}
	@RequestMapping("qnaInsert")
	public String qnaInsert(QnA qna, String pageNum, Model model, HttpServletRequest request) {
		qna.setIp(request.getRemoteAddr());
		int number = qs.maxNum();
		if(qna.getNum() != 0) {
			qs.updateStep(qna);
			qna.setRe_level(qna.getRe_level()+1);
			qna.setRe_step(qna.getRe_step()+1);
		} else qna.setRef(number);
		qna.setNum(number);
		int result = qs.insert(qna);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/qna/qnaInsert";
	}
	@RequestMapping("qnaView")
	public String qnaView(int num, String pageNum, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		qs.updateReadCount(num);
		QnA qna = qs.select(num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("qna", qna);
		model.addAttribute("id", id);
		return "/qna/qnaView";
	}
	@RequestMapping("qnaDeleteForm")
	public String qnaDeleteForm(int num, String pageNum, Model model) {
		QnA qna = qs.select(num);
		model.addAttribute("qna", qna);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "/qna/qnaDeleteForm";
	}
	
	@RequestMapping("qnaDelete")
	public String qnaDelete(int num, int pageNum, Model model) {
		int result = qs.delete(num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/qna/qnaDelete";
	}
	@RequestMapping("qnaUpdateForm")
	public String qnaUpdateForm(int num, String pageNum, Model model) {
		QnA qna = qs.select(num);
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		return "/qna/qnaUpdateForm";
	}
	@RequestMapping("qnaUpdate")
	public String qnaUpdate(QnA qna, String pageNum, Model model) {
		int result = qs.update(qna);
		int num = qna.getNum();
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
		return "/qna/qnaUpdate";
	}
}
