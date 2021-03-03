package com.og.opengate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.og.opengate.service.QnAService;

@Controller
public class QnAController {
	@Autowired
	private QnAService qs;
	@RequestMapping("qnalist")
	public String qnalist() {
		return "/qna/qnalist";
	}
}
