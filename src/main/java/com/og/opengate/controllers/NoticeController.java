package com.og.opengate.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Member;
import com.og.opengate.model.Notice;
import com.og.opengate.service.MemberService;
import com.og.opengate.service.NoticeService;
import com.og.opengate.service.PagingBean;
 
@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
	@Autowired
	private MemberService ms;
	@RequestMapping("noticeList")
	public String noticeList(String pageNum, Notice notice, Model model, Member member, HttpSession session) {
		String id =(String) session.getAttribute("id");
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
		model.addAttribute("id", id);
		
		return "/notice/noticeList";
	}
	@RequestMapping("noticeInsertForm")
	public String noticeInsertForm(int num, String pageNum, String id, Model model) {
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("id", id);
		return "/notice/noticeInsertForm";
	}
	
	@RequestMapping("noticeInsert")
	public String noticeInsert(Notice notice, String id, String pageNum, Model model, HttpServletRequest request) {
		Member member = ms.select(id);
		notice.setWriter(member.getId());
		notice.setPassword(member.getPassword());
		notice.setEmail(member.getEmail());
		notice.setIp(request.getRemoteAddr());
		int number = ns.maxNum();
		notice.setNum(number);
		int result = ns.insert(notice);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/notice/noticeInsert";
	}
	@RequestMapping("noticeView")
	public String noticeView(int num, String pageNum, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		ns.updateReadCount(num); // 조회수 1 증가
		Notice notice = ns.select(num);
		if(id != null) {
			Member member = ms.select(id);
			model.addAttribute("member", member);
		}
		model.addAttribute("id", id);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("notice", notice);
		return "/notice/noticeView";
	}
	@RequestMapping("noticeUpdateForm")
	public String noticeUpdateForm(int num, String pageNum, Model model) {
		Notice notice = ns.select(num);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "/notice/noticeUpdateForm";
	}
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(Notice notice, Model model) {
		int result = ns.update(notice);
		model.addAttribute("result", result);
		model.addAttribute("num", notice.getNum());
		return "notice/noticeUpdate";
	}
	@RequestMapping("noticeDelete")
	public String noticeDelete(int num, String pageNum, Model model) {
		int result = ns.delete(num);
		System.out.println(pageNum);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "notice/noticeDelete";
	}
}
