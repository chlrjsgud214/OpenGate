package com.og.opengate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.og.opengate.service.NoticeReplyService;
import com.og.opengate.service.NoticeService;

@Controller
public class NoticeReplyController {
	@Autowired
	private NoticeReplyService nrs;
	@Autowired
	private NoticeService ns;
}
