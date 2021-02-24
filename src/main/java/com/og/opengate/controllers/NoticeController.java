package com.og.opengate.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Notice;
import com.og.opengate.service.NoticeService;
import com.og.opengate.service.PagingBean;
 
@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
	@RequestMapping("noticeList")
	public String noticeList(String pageNum, Notice notice, Model model ) {
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 게시글 10개
		int total = ns.getTotal(notice);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1; 
		
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);
		
		List<Notice> noticeList = ns.noticeList(notice);
		int no = total - startRow + 1; // 데이타가 150건이라면, 1p:150 - 1 + 1, 2p:150 - 11 + 1
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] tit = {"제목", "내용", "제목+내용"};
		
		model.addAttribute("tit", tit);
		model.addAttribute("pb", pb);
		model.addAttribute("no", no);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("total", total);
		
		return "/notice/noticeList";
	}
	@RequestMapping("noticeInsertForm")
	public String noticeInsertForm(int num, String pageNum, Model model) {
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		return "/notice/noticeInsertForm";
	}
	
	@RequestMapping("noticeInsert")
	public String noticeInsert(Notice notice, String pageNum, Model model, HttpServletRequest request) {
		notice.setIp(request.getRemoteAddr());
		int number = ns.maxNum();
		notice.setNum(number);
		int result = ns.insert(notice);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/notice/noticeInsert";
	}
}
