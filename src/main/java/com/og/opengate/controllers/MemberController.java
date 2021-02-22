package com.og.opengate.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.og.opengate.model.Member;
import com.og.opengate.service.MemberService;
@Controller
public class MemberController {
	private MemberService ms;
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	@RequestMapping("join")
	public String join(Member member, Model model) {
		int result = 0;
		Member mem = ms.select(member.getId());
		if(mem == null) result = ms.insert(member);
		model.addAttribute("result", result);
		return "/member/join";
	}
	
}
