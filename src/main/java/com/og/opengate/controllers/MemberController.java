package com.og.opengate.controllers;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.og.opengate.model.Member;
import com.og.opengate.service.MemberService;
@Controller
public class MemberController {
	private MemberService ms;
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String idChk(String id) {
		String data = "";
		Member member = ms.select(id);
		if(member == null) data = "사용 가능한 아이디입니다";
		else data = "사용중인 아이디입니다";
		return data;
	}
	@RequestMapping("join")
	public String join(Member member, Model model) {
		int result = 0;
		Member mem = ms.select(member.getId());
		if(mem == null) result = ms.insert(member);
		else result = -1;
		model.addAttribute("result", result);
		return "/member/join";
	}
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member mem = ms.select(member.getId());
		if(mem == null) {
			result = -1;
		} else if (mem.getPassword().equals(member.getPassword())) {
			result = 1;
			session.setAttribute("id", member.getId());
		}
		model.addAttribute("result", result);
		return "/member/login";
	}
	
}
