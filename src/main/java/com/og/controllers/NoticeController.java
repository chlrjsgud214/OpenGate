package com.og.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.og.service.NoticeService;
 
@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
}
