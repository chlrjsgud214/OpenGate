package com.og.opengate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.model.Notice;
import com.og.opengate.model.NoticeReplyBoard;
import com.og.opengate.service.NoticeReplyService;
import com.og.opengate.service.NoticeService;

@Controller
public class NoticeReplyController {
	@Autowired
	private NoticeReplyService nrs;
	@Autowired  
	private NoticeService ns; 
	@RequestMapping("noticeReplyList")
	public String noticeReplyList(int bno, Model model) {
		Notice notice = ns.select(bno);
		List<NoticeReplyBoard> nReplyList = nrs.list(bno);
		model.addAttribute("notice", notice);
		model.addAttribute("nReplyList", nReplyList);
		return "/notice/noticeReplyList";
	}
	@RequestMapping("/noticeReplyInsert")
	public String noticeReplyInsert(NoticeReplyBoard nrb) {
		nrs.insert(nrb);
		return "redirect:noticeReplyList.og?bno="+nrb.getBno();
	}
	
	@RequestMapping("noticeReplyDelete")
	public String noticeReplyDelete(NoticeReplyBoard nrb) {
		nrs.delete(nrb.getRno());
		return "redirect:noticeReplyList.og?bno="+nrb.getBno();
	}
	@RequestMapping("noticeReplyUpdate")
	public String noticeReplyUpdate(NoticeReplyBoard nrb) {
		nrs.update(nrb);
		return "redirect:noticeReplyList.og?bno="+nrb.getBno();
	}	
}
